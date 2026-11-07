--[[
    Pigeon Notes: Estonian (Eesti).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'et'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.et = {
    title = 'Märkmed',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Kirjuta märge',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Kirjuta märge',
    write_placeholder = 'Kirjuta midagi...',
    write_sign = 'Allkirjasta',
    write_place = 'Pane üles',
    write_cancel = 'Tühista',
    read_close = 'Sulge',
    read_remove = 'Võta maha',
    read_unsigned = 'Allkirjastamata',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Pane märge üles~n~~INPUT_CELLPHONE_CANCEL~ Tühista',
    place_help_floor = '~INPUT_PICKUP~ Pane märge üles~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Pööra~n~~INPUT_CELLPHONE_CANCEL~ Tühista',
    place_help_none = 'Vaata seina, laua või põranda poole, et märge üles panna.~n~~INPUT_CELLPHONE_CANCEL~ Tühista',
    read_help = '~INPUT_PICKUP~ Loe märget',

    cancelled = 'Märge pandi ära.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Sellist märget pole saadaval.',
    refused_empty = 'Märge on tühi.',
    refused_too_long = 'See märge on liiga pikk.',
    refused_cooldown = 'Oota märkmete vahel {seconds} sekundit.',
    refused_player_limit = 'Sul on juba {limit} märget üleval. Võta enne üks maha.',
    refused_server_limit = 'Märkmeid on liiga palju. Proovi hiljem uuesti.',
    refused_too_far = 'See on liiga kaugel.',
    refused_no_identifier = 'Sinu märkmeid ei saa praegu salvestada.',
    refused_not_yours = 'Saad maha võtta ainult enda märkmeid.',
}
