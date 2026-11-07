--[[
    Pigeon Notes: Polish (Polski).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.pl = {
    title = 'Notatki',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Napisz notatkę',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Napisz notatkę',
    write_placeholder = 'Napisz coś...',
    write_sign = 'Podpisz',
    write_place = 'Przypnij',
    write_cancel = 'Anuluj',
    read_close = 'Zamknij',
    read_remove = 'Zdejmij',
    read_unsigned = 'Bez podpisu',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Przypnij notatkę~n~~INPUT_CELLPHONE_CANCEL~ Anuluj',
    place_help_floor = '~INPUT_PICKUP~ Przypnij notatkę~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Obróć~n~~INPUT_CELLPHONE_CANCEL~ Anuluj',
    place_help_none = 'Spójrz na ścianę, stół lub podłogę, aby przypiąć notatkę.~n~~INPUT_CELLPHONE_CANCEL~ Anuluj',
    read_help = '~INPUT_PICKUP~ Przeczytaj notatkę',

    cancelled = 'Notatka schowana.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Ten rodzaj notatki jest niedostępny.',
    refused_empty = 'Notatka jest pusta.',
    refused_too_long = 'Ta notatka jest za długa.',
    refused_cooldown = 'Odczekaj {seconds} sekund między notatkami.',
    refused_player_limit = 'Masz już przypiętych {limit} notatek. Najpierw zdejmij jedną.',
    refused_server_limit = 'Jest za dużo notatek. Spróbuj później.',
    refused_too_far = 'To jest za daleko.',
    refused_no_identifier = 'Twoich notatek nie można teraz zapisać.',
    refused_not_yours = 'Możesz zdejmować tylko własne notatki.',
}
