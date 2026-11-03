--[[
    Pigeon Notes: frameworks.

    Finds Qbox, QBCore or ESX if one is running, and reads the name of the character a player has loaded,
    for signed notes. Without a framework, signed notes use the player's FiveM name.
]]

Bridge = {}

local framework, core

local function detect()
    if framework ~= nil then return end
    if GetResourceState('qbx_core') == 'started' then
        framework = 'qbx'
    elseif GetResourceState('qb-core') == 'started' then
        framework = 'qb'
        core = exports['qb-core']:GetCoreObject()
    elseif GetResourceState('es_extended') == 'started' then
        framework = 'esx'
        core = exports.es_extended:getSharedObject()
    else
        framework = false
    end
end

local function fromQb(player)
    local info = player and player.PlayerData and player.PlayerData.charinfo
    if not info then return nil end
    local name = ((info.firstname or '') .. ' ' .. (info.lastname or '')):match('^%s*(.-)%s*$')
    return name ~= '' and name or nil
end

local readers = {
    qbx = function(source) return fromQb(exports.qbx_core:GetPlayer(source)) end,
    qb = function(source) return fromQb(core.Functions.GetPlayer(source)) end,
    esx = function(source)
        local player = core.GetPlayerFromId(source)
        return player and player.getName and player.getName() or nil
    end,
}

--- The name of the player's loaded character, or their FiveM name.
function Bridge.GetName(source)
    detect()
    if framework then
        local ok, name = pcall(readers[framework], source)
        if ok and type(name) == 'string' and name ~= '' then return name end
    end
    return GetPlayerName(source) or '?'
end
