--[[
    Pigeon Notes: English.

    To translate, copy this file to a new one named with the language's two-letter code (such as de.lua),
    change `Locales.en` to match (Locales.de), translate the text in quotes, and set Config.Locale.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.en = {
    title = 'Notes',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Write a note',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Write a note',
    write_placeholder = 'Write something...',
    write_sign = 'Sign it',
    write_place = 'Place it',
    write_cancel = 'Cancel',
    read_close = 'Close',
    read_remove = 'Take it down',
    read_unsigned = 'Unsigned',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Place the note~n~~INPUT_CELLPHONE_CANCEL~ Cancel',
    place_help_floor = '~INPUT_PICKUP~ Place the note~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Turn it~n~~INPUT_CELLPHONE_CANCEL~ Cancel',
    place_help_none = 'Look at a wall, table or floor to place your note.~n~~INPUT_CELLPHONE_CANCEL~ Cancel',
    read_help = '~INPUT_PICKUP~ Read the note',

    cancelled = 'Note put away.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'That kind of note isn\'t available.',
    refused_empty = 'The note is empty.',
    refused_too_long = 'That note is too long.',
    refused_cooldown = 'Wait {seconds} seconds between notes.',
    refused_player_limit = 'You already have {limit} notes up. Take one down first.',
    refused_server_limit = 'There are too many notes about. Try again later.',
    refused_too_far = 'That\'s too far away.',
    refused_no_identifier = 'Notes can\'t be saved for you right now.',
    refused_not_yours = 'You can only take down your own notes.',
}
