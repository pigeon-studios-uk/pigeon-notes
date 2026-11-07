--[[
    Pigeon Notes: Danish (Dansk).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'da'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.da = {
    title = 'Sedler',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Skriv en seddel',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Skriv en seddel',
    write_placeholder = 'Skriv noget...',
    write_sign = 'Underskriv',
    write_place = 'Sæt den op',
    write_cancel = 'Annuller',
    read_close = 'Luk',
    read_remove = 'Tag den ned',
    read_unsigned = 'Ikke underskrevet',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Sæt sedlen op~n~~INPUT_CELLPHONE_CANCEL~ Annuller',
    place_help_floor = '~INPUT_PICKUP~ Sæt sedlen op~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Drej den~n~~INPUT_CELLPHONE_CANCEL~ Annuller',
    place_help_none = 'Kig på en væg, et bord eller gulvet for at sætte din seddel op.~n~~INPUT_CELLPHONE_CANCEL~ Annuller',
    read_help = '~INPUT_PICKUP~ Læs sedlen',

    cancelled = 'Sedlen er lagt væk.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Den slags seddel findes ikke.',
    refused_empty = 'Sedlen er tom.',
    refused_too_long = 'Den seddel er for lang.',
    refused_cooldown = 'Vent {seconds} sekunder mellem sedler.',
    refused_player_limit = 'Du har allerede {limit} sedler oppe. Tag en ned først.',
    refused_server_limit = 'Der er for mange sedler rundt omkring. Prøv igen senere.',
    refused_too_far = 'Det er for langt væk.',
    refused_no_identifier = 'Dine sedler kan ikke gemmes lige nu.',
    refused_not_yours = 'Du kan kun tage dine egne sedler ned.',
}
