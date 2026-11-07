--[[
    Pigeon Notes: Norwegian (Norsk).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'no'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.no = {
    title = 'Lapper',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Skriv en lapp',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Skriv en lapp',
    write_placeholder = 'Skriv noe...',
    write_sign = 'Signer den',
    write_place = 'Heng den opp',
    write_cancel = 'Avbryt',
    read_close = 'Lukk',
    read_remove = 'Ta den ned',
    read_unsigned = 'Ikke signert',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Heng opp lappen~n~~INPUT_CELLPHONE_CANCEL~ Avbryt',
    place_help_floor = '~INPUT_PICKUP~ Heng opp lappen~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Snu den~n~~INPUT_CELLPHONE_CANCEL~ Avbryt',
    place_help_none = 'Se på en vegg, et bord eller gulvet for å henge opp lappen.~n~~INPUT_CELLPHONE_CANCEL~ Avbryt',
    read_help = '~INPUT_PICKUP~ Les lappen',

    cancelled = 'Lappen er lagt bort.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Den typen lapp er ikke tilgjengelig.',
    refused_empty = 'Lappen er tom.',
    refused_too_long = 'Den lappen er for lang.',
    refused_cooldown = 'Vent {seconds} sekunder mellom lappene.',
    refused_player_limit = 'Du har allerede {limit} lapper oppe. Ta ned en først.',
    refused_server_limit = 'Det er for mange lapper rundt omkring. Prøv igjen senere.',
    refused_too_far = 'Det er for langt unna.',
    refused_no_identifier = 'Lappene dine kan ikke lagres akkurat nå.',
    refused_not_yours = 'Du kan bare ta ned dine egne lapper.',
}
