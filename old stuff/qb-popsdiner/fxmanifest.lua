fx_version 'cerulean'
game 'gta5'

author 'DrB1ackBeard' edited_and_adapted 'maldingrp'
description 'qb-burgershot for QBCore Created By DrB1ackBeard' edited_and_adapted 'maldingrp'
version '2.1.0'

shared_scripts {
    'config.lua',
    '@qb-core/import.lua'
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/main.lua',
	'client/garage.lua'
}

server_script 'server/main.lua'