--[[
    Pigeon Notes: Hungarian (Magyar).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'hu'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.hu = {
    title = 'Cetlik',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Cetli írása',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Cetli írása',
    write_placeholder = 'Írj valamit...',
    write_sign = 'Aláírás',
    write_place = 'Kitűzés',
    write_cancel = 'Mégse',
    read_close = 'Bezárás',
    read_remove = 'Levétel',
    read_unsigned = 'Aláíratlan',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Cetli kitűzése~n~~INPUT_CELLPHONE_CANCEL~ Mégse',
    place_help_floor = '~INPUT_PICKUP~ Cetli kitűzése~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Forgatás~n~~INPUT_CELLPHONE_CANCEL~ Mégse',
    place_help_none = 'Nézz egy falra, asztalra vagy a padlóra a cetli kitűzéséhez.~n~~INPUT_CELLPHONE_CANCEL~ Mégse',
    read_help = '~INPUT_PICKUP~ Cetli elolvasása',

    cancelled = 'Cetli elrakva.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Ilyen cetli nem érhető el.',
    refused_empty = 'A cetli üres.',
    refused_too_long = 'Ez a cetli túl hosszú.',
    refused_cooldown = 'Várj {seconds} másodpercet két cetli között.',
    refused_player_limit = 'Már {limit} cetlid van kint. Előbb vegyél le egyet.',
    refused_server_limit = 'Túl sok cetli van kint. Próbáld újra később.',
    refused_too_far = 'Az túl messze van.',
    refused_no_identifier = 'A cetlijeidet most nem lehet menteni.',
    refused_not_yours = 'Csak a saját cetlijeidet veheted le.',
}
