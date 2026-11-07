--[[
    Pigeon Notes: Slovenian (Slovenščina).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'sl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.sl = {
    title = 'Listki',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Napiši listek',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Napiši listek',
    write_placeholder = 'Napiši nekaj...',
    write_sign = 'Podpiši',
    write_place = 'Pritrdi',
    write_cancel = 'Prekliči',
    read_close = 'Zapri',
    read_remove = 'Snemi',
    read_unsigned = 'Nepodpisano',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Pritrdi listek~n~~INPUT_CELLPHONE_CANCEL~ Prekliči',
    place_help_floor = '~INPUT_PICKUP~ Pritrdi listek~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Obrni~n~~INPUT_CELLPHONE_CANCEL~ Prekliči',
    place_help_none = 'Poglej v steno, mizo ali tla, da pritrdiš listek.~n~~INPUT_CELLPHONE_CANCEL~ Prekliči',
    read_help = '~INPUT_PICKUP~ Preberi listek',

    cancelled = 'Listek pospravljen.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Ta vrsta listka ni na voljo.',
    refused_empty = 'Listek je prazen.',
    refused_too_long = 'Ta listek je predolg.',
    refused_cooldown = 'Med listki počakaj {seconds} sekund.',
    refused_player_limit = 'Pritrjenih imaš že {limit} listkov. Najprej snemi enega.',
    refused_server_limit = 'Listkov je preveč. Poskusi pozneje.',
    refused_too_far = 'To je predaleč.',
    refused_no_identifier = 'Tvojih listkov trenutno ni mogoče shraniti.',
    refused_not_yours = 'Snameš lahko samo svoje listke.',
}
