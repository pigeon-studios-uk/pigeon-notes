--[[
    Pigeon Notes: Indonesian (Bahasa Indonesia).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'id'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.id = {
    title = 'Catatan',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Tulis catatan',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Tulis catatan',
    write_placeholder = 'Tulis sesuatu...',
    write_sign = 'Tanda tangani',
    write_place = 'Pasang',
    write_cancel = 'Batal',
    read_close = 'Tutup',
    read_remove = 'Copot',
    read_unsigned = 'Tanpa tanda tangan',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Pasang catatan~n~~INPUT_CELLPHONE_CANCEL~ Batal',
    place_help_floor = '~INPUT_PICKUP~ Pasang catatan~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Putar~n~~INPUT_CELLPHONE_CANCEL~ Batal',
    place_help_none = 'Lihat ke dinding, meja, atau lantai untuk memasang catatanmu.~n~~INPUT_CELLPHONE_CANCEL~ Batal',
    read_help = '~INPUT_PICKUP~ Baca catatan',

    cancelled = 'Catatan disimpan.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Jenis catatan itu tidak tersedia.',
    refused_empty = 'Catatannya kosong.',
    refused_too_long = 'Catatan itu terlalu panjang.',
    refused_cooldown = 'Tunggu {seconds} detik di antara catatan.',
    refused_player_limit = 'Kamu sudah memasang {limit} catatan. Copot satu dulu.',
    refused_server_limit = 'Terlalu banyak catatan di sekitar. Coba lagi nanti.',
    refused_too_far = 'Itu terlalu jauh.',
    refused_no_identifier = 'Catatanmu tidak bisa disimpan sekarang.',
    refused_not_yours = 'Kamu hanya bisa mencopot catatanmu sendiri.',
}
