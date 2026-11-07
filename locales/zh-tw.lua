--[[
    Pigeon Notes: Traditional Chinese (繁體中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-tw'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} and the ~INPUT_...~ codes exactly as they are.
]]

Locales = Locales or {}

Locales['zh-tw'] = {
    title = '便條',

    -- GTA's Settings -> Key Bindings -> FiveM.
    key_description = '寫便條',

    -- The notepad and reading a note (shown on the page).
    write_heading = '寫便條',
    write_placeholder = '寫點什麼...',
    write_sign = '署名',
    write_place = '貼上',
    write_cancel = '取消',
    read_close = '關閉',
    read_remove = '撕下',
    read_unsigned = '未署名',

    -- Help text in the world.
    place_help_wall = '~INPUT_PICKUP~ 貼上便條~n~~INPUT_CELLPHONE_CANCEL~ 取消',
    place_help_floor = '~INPUT_PICKUP~ 貼上便條~n~~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ 旋轉~n~~INPUT_CELLPHONE_CANCEL~ 取消',
    place_help_none = '看向牆壁、桌子或地面來貼上便條。~n~~INPUT_CELLPHONE_CANCEL~ 取消',
    read_help = '~INPUT_PICKUP~ 閱讀便條',

    cancelled = '便條已收起。',

    -- Why a note wasn't placed or taken down.
    refused_style = '這種便條無法使用。',
    refused_empty = '便條是空的。',
    refused_too_long = '這張便條太長了。',
    refused_cooldown = '每張便條之間請等待 {seconds} 秒。',
    refused_player_limit = '你已經貼了 {limit} 張便條。請先撕下一張。',
    refused_server_limit = '周圍的便條太多了。請稍後再試。',
    refused_too_far = '那太遠了。',
    refused_no_identifier = '現在無法儲存你的便條。',
    refused_not_yours = '你只能撕下自己的便條。',
}
