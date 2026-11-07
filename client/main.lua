--[[
    Pigeon Notes: client.

    Writing: /note opens the notepad. When the player's done, a see-through note follows where they look;
    E places it, Backspace cancels. The server checks it and tells everyone.

    Reading: near a note, the player's told they can press E to read it. Notes are local props, made only
    in this game, near the player and in their routing bucket, so they cost the server nothing.
]]

local RESOURCE = GetCurrentResourceName()
local TRACE_FLAGS = 1 | 16 | 64            -- world, objects and glass; not vehicles or peds
local STREAM_MS = 1000                     -- how often nearby notes are made or removed
local SURFACE_GAP = 0.004                  -- metres a note sits off its surface, so it doesn't flicker
local SPIN_STEP = 15.0                     -- degrees per scroll on floors
local CONTROLS = { place = 38, cancel = 177, spinUp = 15, spinDown = 14 }   -- E, Backspace, scroll
local PLACING_BLOCKED = { 24, 25, 37, 44, 140, 141, 142, 143, 257, 263, 264, 14, 15, 16, 17 }

-- 'auto' follows ox_lib's language (the ox:locale convar), and English when that isn't set.
local locale = Config.Locale == 'auto' and GetConvar('ox:locale', 'en') or Config.Locale
local strings = Locales[locale] or Locales.en

local notes = {}           -- [id] = note, from the server
local props = {}           -- [id] = the prop made for it in this game
local placing              -- while placing: { text, style, signed, prop, spin }
local busy = false         -- the notepad or a note is open
local reading              -- the id of the note being read

local function t(key, values)
    local text = strings[key] or Locales.en[key] or key
    return (text:gsub('{(%w+)}', function(name)
        local value = values and values[name]
        return value ~= nil and tostring(value) or '{' .. name .. '}'
    end))
end

local function notify(key, values)
    local text = t(key, values)
    if GetResourceState('ox_lib') == 'started' then
        TriggerEvent('ox_lib:notify', { title = strings.title, description = text, type = 'inform' })
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandThefeedPostTicker(false, false)
    end
end

local function help(text)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, false, -1)
end

local function loadModel(model)
    local hash = joaat(model)
    if not IsModelInCdimage(hash) then return nil end
    RequestModel(hash)
    local giveUp = GetGameTimer() + 5000
    while not HasModelLoaded(hash) and GetGameTimer() < giveUp do Wait(0) end
    return HasModelLoaded(hash) and hash or nil
end

local function makeProp(model, x, y, z, pitch, roll, yaw)
    local hash = loadModel(model)
    if not hash then return nil end
    local prop = CreateObject(hash, x, y, z, false, false, false)
    SetEntityRotation(prop, pitch, roll, yaw, 2, false)
    SetEntityCoordsNoOffset(prop, x, y, z, false, false, false)
    FreezeEntityPosition(prop, true)
    SetEntityCollision(prop, false, false)
    SetModelAsNoLongerNeeded(hash)
    return prop
end

local function deleteProp(prop)
    if prop and DoesEntityExist(prop) then DeleteEntity(prop) end
end

local function myBucket()
    return LocalPlayer.state.pigeonNotesBucket or 0
end

---------------------------------------------------------------------------
-- Notes near the player

local function distanceTo(note, position)
    local dx, dy, dz = note.x - position.x, note.y - position.y, note.z - position.z
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end

CreateThread(function()
    TriggerServerEvent('pigeon-notes:ready')
    while true do
        local position = GetEntityCoords(PlayerPedId())
        local bucket = myBucket()
        for id, note in pairs(notes) do
            local near = note.bucket == bucket and distanceTo(note, position) <= (Config.DrawDistance or 40.0)
            if near and not props[id] then
                local style = Config.Styles[note.style]
                if style then props[id] = makeProp(style.model, note.x, note.y, note.z, note.pitch, note.roll, note.yaw) or false end
            elseif not near and props[id] ~= nil then
                deleteProp(props[id])
                props[id] = nil
            end
        end
        Wait(STREAM_MS)
    end
end)

RegisterNetEvent('pigeon-notes:all', function(list)
    for id, prop in pairs(props) do deleteProp(prop) props[id] = nil end
    notes = {}
    for _, note in ipairs(list or {}) do notes[note.id] = note end
end)

RegisterNetEvent('pigeon-notes:added', function(note)
    notes[note.id] = note
end)

RegisterNetEvent('pigeon-notes:removed', function(id)
    notes[id] = nil
    deleteProp(props[id])
    props[id] = nil
    if reading == id then
        SendNUIMessage({ type = 'close' })
        SetNuiFocus(false, false)
        busy, reading = false, nil
    end
end)

RegisterNetEvent('pigeon-notes:refused', function(reason)
    notify('refused_' .. tostring(reason), { limit = Config.MaxPerPlayer, seconds = Config.Cooldown })
end)

---------------------------------------------------------------------------
-- Writing

local function openNotepad(style)
    if busy or placing then return end
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) or IsEntityDead(ped) then return end
    local styles = {}
    for key, info in pairs(Config.Styles) do
        styles[#styles + 1] = { key = key, label = info.label, maxLength = info.maxLength, colour = info.colour }
    end
    table.sort(styles, function(a, b) return a.key == (Config.DefaultStyle or 'paper') or (b.key ~= (Config.DefaultStyle or 'paper') and a.key < b.key) end)
    busy = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'write', styles = styles, style = Config.Styles[style] and style or Config.DefaultStyle,
        allowSigning = Config.AllowSigning ~= false, text = strings,
    })
end

RegisterNUICallback('write', function(data, cb)
    cb({})
    SetNuiFocus(false, false)
    busy = false
    local text, problem = Notes.validate(Config, data and data.text, data and data.style)
    if not text then
        notify('refused_' .. problem)
        return
    end
    local style = Config.Styles[data.style]
    local ped = GetEntityCoords(PlayerPedId())
    local prop = makeProp(style.model, ped.x, ped.y, ped.z - 5.0, 0.0, 0.0, 0.0)
    if not prop then
        notify('refused_style')
        return
    end
    SetEntityAlpha(prop, 170, false)
    placing = { text = text, style = data.style, signed = data.signed == true, prop = prop, spin = GetEntityHeading(PlayerPedId()) }
end)

RegisterNUICallback('close', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
    busy, reading = false, nil
end)

--- Where the camera's looking, up to Config.PlaceDistance away: hit, coords, normal.
local function aim()
    local from = GetGameplayCamCoord()
    local rotation = GetGameplayCamRot(2)
    local pitch, yaw = math.rad(rotation.x), math.rad(rotation.z)
    local direction = vector3(-math.sin(yaw) * math.cos(pitch), math.cos(yaw) * math.cos(pitch), math.sin(pitch))
    local reach = (Config.PlaceDistance or 3.0) + #(from - GetEntityCoords(PlayerPedId()))
    local to = from + direction * reach
    local handle = StartExpensiveSynchronousShapeTestLosProbe(from.x, from.y, from.z, to.x, to.y, to.z, TRACE_FLAGS, PlayerPedId(), 7)
    local _, hit, coords, normal = GetShapeTestResult(handle)
    return hit == 1 or hit == true, coords, normal
end

local function cancelPlacing()
    if not placing then return end
    deleteProp(placing.prop)
    placing = nil
end

local function whilePlacing()
    for _, control in ipairs(PLACING_BLOCKED) do DisableControlAction(0, control, true) end
    DisableControlAction(0, CONTROLS.place, true)
    DisableControlAction(0, CONTROLS.cancel, true)

    if IsDisabledControlJustPressed(0, CONTROLS.spinUp) then placing.spin = placing.spin + SPIN_STEP end
    if IsDisabledControlJustPressed(0, CONTROLS.spinDown) then placing.spin = placing.spin - SPIN_STEP end

    local hit, coords, normal = aim()
    local kind, pitch, roll, yaw
    if hit then kind, pitch, roll, yaw = Notes.surface(normal, placing.spin) end

    if kind then
        local x, y, z = coords.x + normal.x * SURFACE_GAP, coords.y + normal.y * SURFACE_GAP, coords.z + normal.z * SURFACE_GAP
        SetEntityRotation(placing.prop, pitch, roll, yaw, 2, false)
        SetEntityCoordsNoOffset(placing.prop, x, y, z, false, false, false)
        SetEntityVisible(placing.prop, true, false)
        help(t(kind == 'floor' and 'place_help_floor' or 'place_help_wall'))
        if IsDisabledControlJustPressed(0, CONTROLS.place) then
            TriggerServerEvent('pigeon-notes:place', {
                text = placing.text, style = placing.style, signed = placing.signed,
                x = x, y = y, z = z, pitch = pitch, roll = roll, yaw = yaw,
            })
            cancelPlacing()
            return
        end
    else
        SetEntityVisible(placing.prop, false, false)
        help(t('place_help_none'))
    end

    if IsDisabledControlJustPressed(0, CONTROLS.cancel) or IsEntityDead(PlayerPedId()) or IsPedInAnyVehicle(PlayerPedId(), false) then
        cancelPlacing()
        notify('cancelled')
    end
end

---------------------------------------------------------------------------
-- Reading

local function nearestNote()
    local position = GetEntityCoords(PlayerPedId())
    local best, bestDistance
    for id, note in pairs(notes) do
        if props[id] then
            local distance = distanceTo(note, position)
            if distance <= (Config.ReadDistance or 1.8) and (not bestDistance or distance < bestDistance) then
                best, bestDistance = note, distance
            end
        end
    end
    return best
end

local function openNote(note)
    busy, reading = true, note.id
    SetNuiFocus(true, true)
    local style = Config.Styles[note.style] or {}
    SendNUIMessage({
        type = 'read', id = note.id, text = note.text, name = note.name, colour = style.colour,
        created = note.created, strings = strings,
    })
    TriggerServerEvent('pigeon-notes:canRemove', note.id)
end

RegisterNetEvent('pigeon-notes:removable', function(id, allowed)
    if reading == id then SendNUIMessage({ type = 'removable', id = id, allowed = allowed == true }) end
end)

RegisterNUICallback('remove', function(data, cb)
    cb({})
    if data and data.id and notes[data.id] then TriggerServerEvent('pigeon-notes:remove', data.id) end
    SetNuiFocus(false, false)
    busy, reading = false, nil
end)

CreateThread(function()
    while true do
        if placing then
            whilePlacing()
            Wait(0)
        elseif busy then
            Wait(200)
        else
            local note = not IsPedInAnyVehicle(PlayerPedId(), false) and nearestNote()
            if note then
                help(t('read_help'))
                if IsControlJustPressed(0, CONTROLS.place) then openNote(note) end
                Wait(0)
            else
                Wait(300)
            end
        end
    end
end)

---------------------------------------------------------------------------
-- Command, key and exports

RegisterCommand(Config.Command, function() openNotepad() end, false)
RegisterKeyMapping(Config.Command, strings.key_description, 'keyboard', Config.Key or '')

--- Opens the notepad, for example when a notepad item is used. `style` is a key of Config.Styles; anything
--- else (such as the item data ox_inventory passes) opens it on Config.DefaultStyle.
exports('OpenNotepad', function(style) openNotepad(style) end)

-- The same from the server, for inventories whose items are used there (QBCore, ESX):
--     TriggerClientEvent('pigeon-notes:open', source, 'postit')
RegisterNetEvent('pigeon-notes:open', function(style) openNotepad(style) end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= RESOURCE then return end
    cancelPlacing()
    for _, prop in pairs(props) do deleteProp(prop) end
    if busy then SetNuiFocus(false, false) end
end)
