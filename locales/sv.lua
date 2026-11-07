--[[
    Pigeon Notes: Swedish (Svenska).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'sv'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.sv = {
    title = 'Lappar',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Skriv en lapp',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Skriv en lapp',
    write_placeholder = 'Skriv något...',
    write_sign = 'Signera den',
    write_place = 'Sätt upp den',
    write_cancel = 'Avbryt',
    read_close = 'Stäng',
    read_remove = 'Ta ner den',
    read_unsigned = 'Osignerad',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Sätt upp lappen~n~~INPUT_CELLPHONE_CANCEL~ Avbryt',
    place_help_floor = '~INPUT_PICKUP~ Sätt upp lappen~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Vrid den~n~~INPUT_CELLPHONE_CANCEL~ Avbryt',
    place_help_none = 'Titta på en vägg, ett bord eller golvet för att sätta upp lappen.~n~~INPUT_CELLPHONE_CANCEL~ Avbryt',
    read_help = '~INPUT_PICKUP~ Läs lappen',

    cancelled = 'Lappen lades undan.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Den sortens lapp finns inte.',
    refused_empty = 'Lappen är tom.',
    refused_too_long = 'Den lappen är för lång.',
    refused_cooldown = 'Vänta {seconds} sekunder mellan lapparna.',
    refused_player_limit = 'Du har redan {limit} lappar uppe. Ta ner en först.',
    refused_server_limit = 'Det finns för många lappar. Försök igen senare.',
    refused_too_far = 'Det är för långt bort.',
    refused_no_identifier = 'Dina lappar kan inte sparas just nu.',
    refused_not_yours = 'Du kan bara ta ner dina egna lappar.',
}
