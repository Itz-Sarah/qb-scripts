fx_version 'cerulean'
game 'gta5'

description 'qb-lumber'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua'
}

client_scripts {
    'client.lua'
}

server_script 'server.lua'