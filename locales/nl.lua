--[[
    Pigeon Notes: Dutch (Nederlands).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'nl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.nl = {
    title = 'Briefjes',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Een briefje schrijven',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Een briefje schrijven',
    write_placeholder = 'Schrijf iets...',
    write_sign = 'Ondertekenen',
    write_place = 'Ophangen',
    write_cancel = 'Annuleren',
    read_close = 'Sluiten',
    read_remove = 'Weghalen',
    read_unsigned = 'Niet ondertekend',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Briefje ophangen~n~~INPUT_CELLPHONE_CANCEL~ Annuleren',
    place_help_floor = '~INPUT_PICKUP~ Briefje ophangen~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Draaien~n~~INPUT_CELLPHONE_CANCEL~ Annuleren',
    place_help_none = 'Kijk naar een muur, tafel of de vloer om je briefje op te hangen.~n~~INPUT_CELLPHONE_CANCEL~ Annuleren',
    read_help = '~INPUT_PICKUP~ Briefje lezen',

    cancelled = 'Briefje opgeborgen.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Dat soort briefje is niet beschikbaar.',
    refused_empty = 'Het briefje is leeg.',
    refused_too_long = 'Dat briefje is te lang.',
    refused_cooldown = 'Wacht {seconds} seconden tussen briefjes.',
    refused_player_limit = 'Je hebt al {limit} briefjes hangen. Haal er eerst een weg.',
    refused_server_limit = 'Er hangen te veel briefjes. Probeer het later opnieuw.',
    refused_too_far = 'Dat is te ver weg.',
    refused_no_identifier = 'Je briefjes kunnen nu niet worden opgeslagen.',
    refused_not_yours = 'Je kunt alleen je eigen briefjes weghalen.',
}
