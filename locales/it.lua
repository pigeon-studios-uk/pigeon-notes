--[[
    Pigeon Notes: Italian (Italiano).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'it'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.it = {
    title = 'Biglietti',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Scrivi un biglietto',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Scrivi un biglietto',
    write_placeholder = 'Scrivi qualcosa...',
    write_sign = 'Firmalo',
    write_place = 'Attaccalo',
    write_cancel = 'Annulla',
    read_close = 'Chiudi',
    read_remove = 'Staccalo',
    read_unsigned = 'Senza firma',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Attacca il biglietto~n~~INPUT_CELLPHONE_CANCEL~ Annulla',
    place_help_floor = '~INPUT_PICKUP~ Attacca il biglietto~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Ruotalo~n~~INPUT_CELLPHONE_CANCEL~ Annulla',
    place_help_none = 'Guarda un muro, un tavolo o il pavimento per attaccare il biglietto.~n~~INPUT_CELLPHONE_CANCEL~ Annulla',
    read_help = '~INPUT_PICKUP~ Leggi il biglietto',

    cancelled = 'Biglietto messo via.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Quel tipo di biglietto non è disponibile.',
    refused_empty = 'Il biglietto è vuoto.',
    refused_too_long = 'Quel biglietto è troppo lungo.',
    refused_cooldown = 'Aspetta {seconds} secondi tra un biglietto e l\'altro.',
    refused_player_limit = 'Hai già {limit} biglietti attaccati. Prima staccane uno.',
    refused_server_limit = 'Ci sono troppi biglietti in giro. Riprova più tardi.',
    refused_too_far = 'È troppo lontano.',
    refused_no_identifier = 'Al momento i tuoi biglietti non possono essere salvati.',
    refused_not_yours = 'Puoi staccare solo i tuoi biglietti.',
}
