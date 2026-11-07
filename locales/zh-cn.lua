--[[
    Pigeon Notes: Simplified Chinese (简体中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-cn'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales['zh-cn'] = {
    title = '便条',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = '写便条',

    -- The notepad and reading a note (shown on the page).
    write_heading = '写便条',
    write_placeholder = '写点什么...',
    write_sign = '署名',
    write_place = '贴上',
    write_cancel = '取消',
    read_close = '关闭',
    read_remove = '撕下',
    read_unsigned = '未署名',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ 贴上便条~n~~INPUT_CELLPHONE_CANCEL~ 取消',
    place_help_floor = '~INPUT_PICKUP~ 贴上便条~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ 旋转~n~~INPUT_CELLPHONE_CANCEL~ 取消',
    place_help_none = '看向墙壁、桌子或地面来贴上便条。~n~~INPUT_CELLPHONE_CANCEL~ 取消',
    read_help = '~INPUT_PICKUP~ 阅读便条',

    cancelled = '便条已收起。',

    -- Why a note wasn't placed or taken down.
    refused_style = '这种便条不可用。',
    refused_empty = '便条是空的。',
    refused_too_long = '这张便条太长了。',
    refused_cooldown = '每张便条之间请等待 {seconds} 秒。',
    refused_player_limit = '你已经贴了 {limit} 张便条。请先撕下一张。',
    refused_server_limit = '周围的便条太多了。请稍后再试。',
    refused_too_far = '那太远了。',
    refused_no_identifier = '现在无法保存你的便条。',
    refused_not_yours = '你只能撕下自己的便条。',
}
