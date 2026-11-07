--[[
    Pigeon Notes: Finnish (Suomi).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'fi'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.fi = {
    title = 'Lappuset',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Kirjoita lappunen',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Kirjoita lappunen',
    write_placeholder = 'Kirjoita jotain...',
    write_sign = 'Allekirjoita',
    write_place = 'Kiinnitä',
    write_cancel = 'Peruuta',
    read_close = 'Sulje',
    read_remove = 'Ota pois',
    read_unsigned = 'Allekirjoittamaton',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Kiinnitä lappunen~n~~INPUT_CELLPHONE_CANCEL~ Peruuta',
    place_help_floor = '~INPUT_PICKUP~ Kiinnitä lappunen~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Käännä~n~~INPUT_CELLPHONE_CANCEL~ Peruuta',
    place_help_none = 'Katso seinää, pöytää tai lattiaa kiinnittääksesi lappusen.~n~~INPUT_CELLPHONE_CANCEL~ Peruuta',
    read_help = '~INPUT_PICKUP~ Lue lappunen',

    cancelled = 'Lappunen laitettu pois.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Sellaista lappusta ei ole saatavilla.',
    refused_empty = 'Lappunen on tyhjä.',
    refused_too_long = 'Lappunen on liian pitkä.',
    refused_cooldown = 'Odota {seconds} sekuntia lappusten välillä.',
    refused_player_limit = 'Sinulla on jo {limit} lappusta esillä. Ota ensin yksi pois.',
    refused_server_limit = 'Lappusia on liikaa. Yritä myöhemmin uudelleen.',
    refused_too_far = 'Se on liian kaukana.',
    refused_no_identifier = 'Lappusiasi ei voi tallentaa juuri nyt.',
    refused_not_yours = 'Voit ottaa pois vain omia lappusiasi.',
}
