--[[
    Pigeon Notes: Croatian (Hrvatski).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'hr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.hr = {
    title = 'Poruke',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Napiši poruku',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Napiši poruku',
    write_placeholder = 'Napiši nešto...',
    write_sign = 'Potpiši',
    write_place = 'Postavi',
    write_cancel = 'Odustani',
    read_close = 'Zatvori',
    read_remove = 'Skini',
    read_unsigned = 'Nepotpisano',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Postavi poruku~n~~INPUT_CELLPHONE_CANCEL~ Odustani',
    place_help_floor = '~INPUT_PICKUP~ Postavi poruku~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Okreni~n~~INPUT_CELLPHONE_CANCEL~ Odustani',
    place_help_none = 'Pogledaj zid, stol ili pod da postaviš poruku.~n~~INPUT_CELLPHONE_CANCEL~ Odustani',
    read_help = '~INPUT_PICKUP~ Pročitaj poruku',

    cancelled = 'Poruka spremljena.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Ta vrsta poruke nije dostupna.',
    refused_empty = 'Poruka je prazna.',
    refused_too_long = 'Ta poruka je preduga.',
    refused_cooldown = 'Pričekaj {seconds} sekundi između poruka.',
    refused_player_limit = 'Već imaš {limit} postavljenih poruka. Prvo skini jednu.',
    refused_server_limit = 'Ima previše poruka uokolo. Pokušaj kasnije.',
    refused_too_far = 'To je predaleko.',
    refused_no_identifier = 'Tvoje poruke se trenutno ne mogu spremiti.',
    refused_not_yours = 'Možeš skinuti samo svoje poruke.',
}
