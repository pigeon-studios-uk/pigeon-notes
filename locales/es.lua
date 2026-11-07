--[[
    Pigeon Notes: Spanish (Español).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'es'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.es = {
    title = 'Notas',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Escribir una nota',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Escribir una nota',
    write_placeholder = 'Escribe algo...',
    write_sign = 'Firmarla',
    write_place = 'Colocarla',
    write_cancel = 'Cancelar',
    read_close = 'Cerrar',
    read_remove = 'Quitarla',
    read_unsigned = 'Sin firmar',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Colocar la nota~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    place_help_floor = '~INPUT_PICKUP~ Colocar la nota~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Girarla~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    place_help_none = 'Mira a una pared, una mesa o el suelo para colocar tu nota.~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    read_help = '~INPUT_PICKUP~ Leer la nota',

    cancelled = 'Nota guardada.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Ese tipo de nota no está disponible.',
    refused_empty = 'La nota está vacía.',
    refused_too_long = 'Esa nota es demasiado larga.',
    refused_cooldown = 'Espera {seconds} segundos entre notas.',
    refused_player_limit = 'Ya tienes {limit} notas puestas. Quita una primero.',
    refused_server_limit = 'Hay demasiadas notas por ahí. Inténtalo más tarde.',
    refused_too_far = 'Eso está demasiado lejos.',
    refused_no_identifier = 'Ahora mismo no se pueden guardar tus notas.',
    refused_not_yours = 'Solo puedes quitar tus propias notas.',
}
