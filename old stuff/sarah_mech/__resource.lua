resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Sarah-mech'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua'
}

client_script 'client/main.lua'

server_script 'server/main.lua'
