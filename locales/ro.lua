--[[
    Pigeon Notes: Romanian (Română).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'ro'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.ro = {
    title = 'Bilețele',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Scrie un bilețel',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Scrie un bilețel',
    write_placeholder = 'Scrie ceva...',
    write_sign = 'Semnează-l',
    write_place = 'Pune-l',
    write_cancel = 'Anulează',
    read_close = 'Închide',
    read_remove = 'Dă-l jos',
    read_unsigned = 'Nesemnat',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Pune bilețelul~n~~INPUT_CELLPHONE_CANCEL~ Anulează',
    place_help_floor = '~INPUT_PICKUP~ Pune bilețelul~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Rotește-l~n~~INPUT_CELLPHONE_CANCEL~ Anulează',
    place_help_none = 'Uită-te la un perete, o masă sau podea ca să pui bilețelul.~n~~INPUT_CELLPHONE_CANCEL~ Anulează',
    read_help = '~INPUT_PICKUP~ Citește bilețelul',

    cancelled = 'Bilețel pus deoparte.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Acest tip de bilețel nu este disponibil.',
    refused_empty = 'Bilețelul e gol.',
    refused_too_long = 'Bilețelul e prea lung.',
    refused_cooldown = 'Așteaptă {seconds} secunde între bilețele.',
    refused_player_limit = 'Ai deja {limit} bilețele puse. Dă unul jos mai întâi.',
    refused_server_limit = 'Sunt prea multe bilețele. Încearcă mai târziu.',
    refused_too_far = 'E prea departe.',
    refused_no_identifier = 'Bilețelele tale nu pot fi salvate acum.',
    refused_not_yours = 'Poți da jos doar bilețelele tale.',
}
