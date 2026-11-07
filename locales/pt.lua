--[[
    Pigeon Notes: Portuguese (Português).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pt'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales.pt = {
    title = 'Bilhetes',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = 'Escrever um bilhete',

    -- The notepad and reading a note (shown on the page).
    write_heading = 'Escrever um bilhete',
    write_placeholder = 'Escreve algo...',
    write_sign = 'Assinar',
    write_place = 'Afixar',
    write_cancel = 'Cancelar',
    read_close = 'Fechar',
    read_remove = 'Retirar',
    read_unsigned = 'Sem assinatura',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ Afixar o bilhete~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    place_help_floor = '~INPUT_PICKUP~ Afixar o bilhete~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ Rodar~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    place_help_none = 'Olha para uma parede, mesa ou chão para afixar o bilhete.~n~~INPUT_CELLPHONE_CANCEL~ Cancelar',
    read_help = '~INPUT_PICKUP~ Ler o bilhete',

    cancelled = 'Bilhete guardado.',

    -- Why a note wasn't placed or taken down.
    refused_style = 'Esse tipo de bilhete não está disponível.',
    refused_empty = 'O bilhete está vazio.',
    refused_too_long = 'Esse bilhete é demasiado longo.',
    refused_cooldown = 'Espera {seconds} segundos entre bilhetes.',
    refused_player_limit = 'Já tens {limit} bilhetes afixados. Retira um primeiro.',
    refused_server_limit = 'Há demasiados bilhetes por aí. Tenta mais tarde.',
    refused_too_far = 'Isso está demasiado longe.',
    refused_no_identifier = 'Os teus bilhetes não podem ser guardados agora.',
    refused_not_yours = 'Só podes retirar os teus próprios bilhetes.',
}
