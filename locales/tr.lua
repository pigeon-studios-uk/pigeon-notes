--[[
    Pigeon Notes: Turkish (Türkçe).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'tr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.tr = {
    title = 'Notlar',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Not yaz',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Not yaz',
    write_placeholder = 'Bir şey yaz...',
    write_sign = 'İmzala',
    write_place = 'Yerleştir',
    write_cancel = 'İptal',
    read_close = 'Kapat',
    read_remove = 'Kaldır',
    read_unsigned = 'İmzasız',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Notu yerleştir~n~~INPUT_CELLPHONE_CANCEL~ İptal',
    place_help_floor = '~INPUT_PICKUP~ Notu yerleştir~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Döndür~n~~INPUT_CELLPHONE_CANCEL~ İptal',
    place_help_none = 'Notunu yerleştirmek için bir duvara, masaya veya zemine bak.~n~~INPUT_CELLPHONE_CANCEL~ İptal',
    read_help = '~INPUT_PICKUP~ Notu oku',

    cancelled = 'Not kaldırıldı.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Bu tür not kullanılamıyor.',
    refused_empty = 'Not boş.',
    refused_too_long = 'Bu not çok uzun.',
    refused_cooldown = 'Notlar arasında {seconds} saniye bekle.',
    refused_player_limit = 'Zaten {limit} notun asılı. Önce birini kaldır.',
    refused_server_limit = 'Etrafta çok fazla not var. Daha sonra tekrar dene.',
    refused_too_far = 'Bu çok uzakta.',
    refused_no_identifier = 'Notların şu anda kaydedilemiyor.',
    refused_not_yours = 'Yalnızca kendi notlarını kaldırabilirsin.',
}
