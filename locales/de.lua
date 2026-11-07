--[[
    Pigeon Notes: German (Deutsch).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'de'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.de = {
    title = 'Notizen',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Eine Notiz schreiben',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Eine Notiz schreiben',
    write_placeholder = 'Schreib etwas...',
    write_sign = 'Unterschreiben',
    write_place = 'Anbringen',
    write_cancel = 'Abbrechen',
    read_close = 'Schließen',
    read_remove = 'Abnehmen',
    read_unsigned = 'Ohne Unterschrift',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Notiz anbringen~n~~INPUT_CELLPHONE_CANCEL~ Abbrechen',
    place_help_floor = '~INPUT_PICKUP~ Notiz anbringen~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Drehen~n~~INPUT_CELLPHONE_CANCEL~ Abbrechen',
    place_help_none = 'Schau auf eine Wand, einen Tisch oder den Boden, um deine Notiz anzubringen.~n~~INPUT_CELLPHONE_CANCEL~ Abbrechen',
    read_help = '~INPUT_PICKUP~ Notiz lesen',

    cancelled = 'Notiz weggesteckt.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Diese Art von Notiz gibt es nicht.',
    refused_empty = 'Die Notiz ist leer.',
    refused_too_long = 'Diese Notiz ist zu lang.',
    refused_cooldown = 'Warte {seconds} Sekunden zwischen Notizen.',
    refused_player_limit = 'Du hast schon {limit} Notizen hängen. Nimm zuerst eine ab.',
    refused_server_limit = 'Es hängen zu viele Notizen herum. Versuch es später noch einmal.',
    refused_too_far = 'Das ist zu weit weg.',
    refused_no_identifier = 'Deine Notizen können gerade nicht gespeichert werden.',
    refused_not_yours = 'Du kannst nur deine eigenen Notizen abnehmen.',
}
