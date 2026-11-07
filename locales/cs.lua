--[[
    Pigeon Notes: Czech (Čeština).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'cs'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.cs = {
    title = 'Vzkazy',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Napsat vzkaz',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Napsat vzkaz',
    write_placeholder = 'Napiš něco...',
    write_sign = 'Podepsat',
    write_place = 'Umístit',
    write_cancel = 'Zrušit',
    read_close = 'Zavřít',
    read_remove = 'Sundat',
    read_unsigned = 'Nepodepsáno',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Umístit vzkaz~n~~INPUT_CELLPHONE_CANCEL~ Zrušit',
    place_help_floor = '~INPUT_PICKUP~ Umístit vzkaz~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Otočit~n~~INPUT_CELLPHONE_CANCEL~ Zrušit',
    place_help_none = 'Podívej se na zeď, stůl nebo podlahu, kam chceš vzkaz umístit.~n~~INPUT_CELLPHONE_CANCEL~ Zrušit',
    read_help = '~INPUT_PICKUP~ Přečíst vzkaz',

    cancelled = 'Vzkaz uklizen.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Tento druh vzkazu není k dispozici.',
    refused_empty = 'Vzkaz je prázdný.',
    refused_too_long = 'Ten vzkaz je moc dlouhý.',
    refused_cooldown = 'Mezi vzkazy počkej {seconds} sekund.',
    refused_player_limit = 'Už máš vyvěšeno {limit} vzkazů. Nejdřív jeden sundej.',
    refused_server_limit = 'Vzkazů je všude moc. Zkus to později.',
    refused_too_far = 'To je moc daleko.',
    refused_no_identifier = 'Vzkazy ti teď nejde uložit.',
    refused_not_yours = 'Sundat můžeš jen svoje vzkazy.',
}
