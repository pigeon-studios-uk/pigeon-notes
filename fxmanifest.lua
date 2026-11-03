fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-notes'
author 'Pigeon Studios'
description 'Write notes and leave them on walls, tables and floors for other players to find and read.'
version '0.1.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-notes'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-notes'

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/app.js',
}

shared_scripts {
    'configuration/config.lua',
    'locales/*.lua',
    'shared/rules.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/bridge.lua',
    'server/main.lua',
    'server/version_check.lua',
}
