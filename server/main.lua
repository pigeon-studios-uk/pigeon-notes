--[[
    Pigeon Notes: server.

    Keeps every note, in the server's own key-value storage, so they survive restarts without a database.
    Every player's game gets the full list when it joins and each change as it happens, and shows the
    notes near them in their routing bucket.

    Everything a player's game sends is checked again here: the text, the style, where it's placed, the
    cooldown and the limits.
]]

local KEY_PREFIX = 'note:'
local PLACE_SLACK = 2.0          -- metres beyond Config.PlaceDistance allowed for lag
local BUCKET_STATE = 'pigeonNotesBucket'

local notes = {}                 -- [id] = note
local lastPlaced = {}            -- [source] = os.time() of their last note
local counter = 0

local function log(message)
    if Config.ConsoleLog ~= false then print(('^6[Pigeon Notes]^7 %s'):format(message)) end
end

local function webhook(title, note, by)
    local url = GetConvar('pigeon_notes_webhook', '')
    if url == '' or not url:match('^https://') then return end
    PerformHttpRequest(url, function() end, 'POST', json.encode({
        username = 'Pigeon Notes',
        allowed_mentions = { parse = {} },
        embeds = { {
            title = title,
            description = note.text:sub(1, 1500),
            color = title == 'Note removed' and 15548997 or 16748544,
            fields = {
                { name = 'By', value = by, inline = true },
                { name = 'Style', value = note.style, inline = true },
                { name = 'Where', value = ('%.1f, %.1f, %.1f (bucket %d)'):format(note.x, note.y, note.z, note.bucket), inline = false },
            },
            footer = { text = 'Note ' .. note.id },
            timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ'),
        } },
    }), { ['Content-Type'] = 'application/json' })
end

local function identifier(source)
    return GetPlayerIdentifierByType(source, 'license') or GetPlayerIdentifierByType(source, 'fivem')
end

local function isStaff(source)
    return source == 0 or IsPlayerAceAllowed(source, Config.StaffPermission or 'pigeon-notes.staff')
end

local function count()
    local total = 0
    for _ in pairs(notes) do total = total + 1 end
    return total
end

--- What players' games get: everything but who wrote it.
local function public(note)
    return {
        id = note.id, text = note.text, style = note.style, name = note.signed and note.name or nil,
        created = note.created, x = note.x, y = note.y, z = note.z,
        pitch = note.pitch, roll = note.roll, yaw = note.yaw, bucket = note.bucket,
    }
end

local function save(note) SetResourceKvp(KEY_PREFIX .. note.id, json.encode(note)) end

local function remove(id, by)
    local note = notes[id]
    if not note then return false end
    notes[id] = nil
    DeleteResourceKvp(KEY_PREFIX .. id)
    TriggerClientEvent('pigeon-notes:removed', -1, id)
    log(('Note %s removed by %s.'):format(id, by))
    webhook('Note removed', note, by)
    return true
end

local function removeExpired()
    local now = os.time()
    for id, note in pairs(notes) do
        if Notes.expired(note, now, Config.ExpiryDays) then remove(id, 'expiry') end
    end
end

---------------------------------------------------------------------------
-- Loading

CreateThread(function()
    local handle = StartFindKvp(KEY_PREFIX)
    if handle ~= -1 then
        while true do
            local key = FindKvp(handle)
            if not key then break end
            local ok, note = pcall(json.decode, GetResourceKvpString(key) or '')
            if ok and type(note) == 'table' and note.id then notes[note.id] = note end
        end
        EndFindKvp(handle)
    end
    removeExpired()
    log(('%d notes loaded.'):format(count()))
    TriggerClientEvent('pigeon-notes:all', -1, (function()
        local list = {}
        for _, note in pairs(notes) do list[#list + 1] = public(note) end
        return list
    end)())

    while true do
        Wait(60 * 60 * 1000)
        removeExpired()
    end
end)

-- Every player's game shows only the notes in its own routing bucket, so it's kept up to date here.
CreateThread(function()
    while true do
        for _, id in ipairs(GetPlayers()) do
            local bucket = GetPlayerRoutingBucket(id)
            local state = Player(id).state
            if state[BUCKET_STATE] ~= bucket then state:set(BUCKET_STATE, bucket, true) end
        end
        Wait(2000)
    end
end)

RegisterNetEvent('pigeon-notes:ready', function()
    local source = source
    local list = {}
    for _, note in pairs(notes) do list[#list + 1] = public(note) end
    TriggerClientEvent('pigeon-notes:all', source, list)
    Player(source).state:set(BUCKET_STATE, GetPlayerRoutingBucket(source), true)
end)

---------------------------------------------------------------------------
-- Placing

local function refuse(source, reason)
    TriggerClientEvent('pigeon-notes:refused', source, reason)
end

local function number(value) return type(value) == 'number' and value == value and math.abs(value) < 1e6 end

RegisterNetEvent('pigeon-notes:place', function(data)
    local source = source
    if type(data) ~= 'table' then return end

    local text, problem = Notes.validate(Config, data.text, data.style)
    if not text then return refuse(source, problem) end
    if not (number(data.x) and number(data.y) and number(data.z) and number(data.pitch) and number(data.roll) and number(data.yaw)) then return end

    local now = os.time()
    if lastPlaced[source] and now - lastPlaced[source] < (tonumber(Config.Cooldown) or 0) then return refuse(source, 'cooldown') end

    local author = identifier(source)
    if not author then return refuse(source, 'no_identifier') end
    if (Config.MaxPerPlayer or 0) > 0 and Notes.countBy(notes, author) >= Config.MaxPerPlayer then return refuse(source, 'player_limit') end
    if (Config.MaxTotal or 0) > 0 and count() >= Config.MaxTotal then return refuse(source, 'server_limit') end

    -- With OneSync the server knows where the player is, so a note can't be placed across the map.
    local ped = GetPlayerPed(source)
    if ped and ped ~= 0 then
        local position = GetEntityCoords(ped)
        if position.x ~= 0.0 or position.y ~= 0.0 then
            local dx, dy, dz = position.x - data.x, position.y - data.y, position.z - data.z
            if math.sqrt(dx * dx + dy * dy + dz * dz) > (tonumber(Config.PlaceDistance) or 3.0) + PLACE_SLACK then
                return refuse(source, 'too_far')
            end
        end
    end

    counter = counter + 1
    local note = {
        id = ('%d%03d'):format(now, counter % 1000),
        text = text, style = data.style, signed = Config.AllowSigning ~= false and data.signed == true,
        name = Bridge.GetName(source), author = author, created = now,
        x = data.x, y = data.y, z = data.z, pitch = data.pitch, roll = data.roll, yaw = data.yaw,
        bucket = GetPlayerRoutingBucket(source),
    }
    notes[note.id] = note
    save(note)
    lastPlaced[source] = now
    TriggerClientEvent('pigeon-notes:added', -1, public(note))

    local by = ('%s (ID %d)'):format(GetPlayerName(source) or '?', source)
    log(('Note %s placed by %s: %s'):format(note.id, by, text:gsub('\n', ' '):sub(1, 120)))
    webhook('Note placed', note, by)
end)

---------------------------------------------------------------------------
-- Taking down

--- Tells a player's game which notes it can take down, when it opens one to read.
RegisterNetEvent('pigeon-notes:canRemove', function(id)
    local source = source
    local note = notes[id]
    if not note then return end
    TriggerClientEvent('pigeon-notes:removable', source, id,Notes.canRemove(Config.WhoCanRemove, note, identifier(source), isStaff(source)))
end)

RegisterNetEvent('pigeon-notes:remove', function(id)
    local source = source
    local note = notes[id]
    if not note then return end
    if not Notes.canRemove(Config.WhoCanRemove, note, identifier(source), isStaff(source)) then return refuse(source, 'not_yours') end
    remove(id, ('%s (ID %d)'):format(GetPlayerName(source) or '?', source))
end)

AddEventHandler('playerDropped', function()
    lastPlaced[source] = nil
end)

---------------------------------------------------------------------------
-- Exports

--- Every note, as players' games see it.
exports('GetNotes', function()
    local list = {}
    for _, note in pairs(notes) do list[#list + 1] = public(note) end
    return list
end)

--- Takes a note down. Returns true if there was one.
exports('RemoveNote', function(id)
    return remove(tostring(id), GetInvokingResource() or 'a resource')
end)
