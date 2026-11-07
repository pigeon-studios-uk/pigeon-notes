--[[
    Pigeon Notes: Brazilian Portuguese (Português do Brasil).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pt-br'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales['pt-br'] = {
    title = 'Bilhetes',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Escrever um bilhete',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Escrever um bilhete',
    write_placeholder = 'Escreva algo...',
    write_sign = 'Assinar',
    write_place = 'Colocar',
    write_cancel = 'Cancelar',
    read_close = 'Fechar',
    read_remove = 'Tirar',
    read_unsigned = 'Sem assinatura',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Colocar o bilhete~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    place_help_floor = '~INPUT_PICKUP~ Colocar o bilhete~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Girar~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    place_help_none = 'Olhe para uma parede, mesa ou chão para colocar seu bilhete.~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    read_help = '~INPUT_PICKUP~ Ler o bilhete',

    cancelled = 'Bilhete guardado.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Esse tipo de bilhete não está disponível.',
    refused_empty = 'O bilhete está vazio.',
    refused_too_long = 'Esse bilhete é longo demais.',
    refused_cooldown = 'Espere {seconds} segundos entre bilhetes.',
    refused_player_limit = 'Você já tem {limit} bilhetes colocados. Tire um primeiro.',
    refused_server_limit = 'Há bilhetes demais por aí. Tente mais tarde.',
    refused_too_far = 'Isso está longe demais.',
    refused_no_identifier = 'Seus bilhetes não podem ser salvos agora.',
    refused_not_yours = 'Você só pode tirar seus próprios bilhetes.',
}
