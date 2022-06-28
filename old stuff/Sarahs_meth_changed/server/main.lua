------CODERC-SLO----------
----DRUG weed------------
local isbusy = false
local done = false
local random = false

local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('sarah_weed:server:setSpotState')
AddEventHandler('sarah_weed:server:setSpotState', function(stateType, state, spot)
    if stateType == "isBusy" then
        Config.Weed["takeables"][spot].isBusy = state
    elseif stateType == "isDone" then
        Config.Weed["takeables"][spot].isDone = state
		random = true
    end
    TriggerClientEvent('sarah_weed:client:setSpotState', -1, stateType, state, spot)
end)

function refresh(stateType, state, spot)
	if stateType == "isBusy" then
        Config.Weed["takeables"][spot].isBusy = state
    elseif stateType == "isDone" then
        Config.Weed["takeables"][spot].isDone = state
    end
    TriggerClientEvent('sarah_weed:client:setSpotState', -1, stateType, state, spot)
end



RegisterServerEvent('sarah_weed:server:itemReward')
AddEventHandler('sarah_weed:server:itemReward', function(spot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Config.Weed["takeables"][spot].reward
	local bag = Player.Functions.GetItemByName('empty_weed_bag')
	local spot = spot
	if Player.PlayerData.items ~= nil then
    if bag ~= nil then
		if bag.amount >= 1 then 
			Player.Functions.RemoveItem('empty_weed_bag', 1)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
					WeedrewardsProcess(source, spot)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You do not have the right Items or you are to heavy', 'error')
		end
    else
        TriggerClientEvent('QBCore:Notify', source, 'You do not have the right Items or you are to heavy', 'error')
    end
	end
end)

RegisterServerEvent('sarah_weed:server:LoadLocationList')
AddEventHandler('sarah_weed:server:LoadLocationList', function()
    local src = source
    TriggerClientEvent("sarah_weed:server:LoadLocationList", source, Config.Weed)
end)

RegisterServerEvent('sarah_weed:server:skunkpro')
AddEventHandler('sarah_weed:server:skunkpro', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(source)
	local wetweed = Player.Functions.GetItemByName('wetweed_skunk')
	local bag = Player.Functions.GetItemByName('empty_weed_bag')
	if wetweed ~= nil then
		if bag ~= nil then
			if bag.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('wetweed_skunk', 4)---
					Player.Functions.RemoveItem('empty_weed_bag', 2)---
					Player.Functions.AddItem('weed_skunk', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['wetweed_skunk'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_skunk'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:purplepro')
AddEventHandler('sarah_weed:server:purplepro', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(source)
	local wetweed = Player.Functions.GetItemByName('wetweed_purple-haze')
	local bag = Player.Functions.GetItemByName('empty_weed_bag')
	if wetweed ~= nil then
		if bag ~= nil then
			if bag.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('wetweed_purple-haze', 4)---
					Player.Functions.RemoveItem('empty_weed_bag', 2)---
					Player.Functions.AddItem('weed_purple-haze', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['wetweed_purple-haze'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_purple-haze'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:ogpro')
AddEventHandler('sarah_weed:server:ogpro', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(source)
	local wetweed = Player.Functions.GetItemByName('wetweed_og-kush')
	local bag = Player.Functions.GetItemByName('empty_weed_bag')
	if wetweed ~= nil then
		if bag ~= nil then
			if bag.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('wetweed_og-kush', 4)---
					Player.Functions.RemoveItem('empty_weed_bag', 2)---
					Player.Functions.AddItem('weed_purple-haze', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['wetweed_og-kush'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_og-kush'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:amnesiapro')
AddEventHandler('sarah_weed:server:amnesiapro', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(source)
	local wetweed = Player.Functions.GetItemByName('wetweed_amnesia')
	local bag = Player.Functions.GetItemByName('empty_weed_bag')
	if wetweed ~= nil then
		if bag ~= nil then
			if bag.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('wetweed_amnesia', 4)---
					Player.Functions.RemoveItem('empty_weed_bag', 2)---
					Player.Functions.AddItem('weed_purple-haze', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['wetweed_amnesia'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_amnesia'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:ak47pro')
AddEventHandler('sarah_weed:server:ak47pro', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(source)
	local wetweed = Player.Functions.GetItemByName('wetweed_ak47')
	local bag = Player.Functions.GetItemByName('empty_weed_bag')
	if wetweed ~= nil then
		if bag ~= nil then
			if bag.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('wetweed_ak47', 4)---
					Player.Functions.RemoveItem('empty_weed_bag', 2)---
					Player.Functions.AddItem('weed_ak47', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['wetweed_ak47'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_ak47'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:whitewidowpro')
AddEventHandler('sarah_weed:server:whitewidowpro', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(source)
	local wetweed = Player.Functions.GetItemByName('wetweed_white-widow')
	local bag = Player.Functions.GetItemByName('empty_weed_bag')
	if wetweed ~= nil then
		if bag ~= nil then
			if bag.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('wetweed_white-widow', 4)---
					Player.Functions.RemoveItem('empty_weed_bag', 2)---
					Player.Functions.AddItem('weed_white-widow', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['wetweed_white-widow'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_white-widow'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)


RegisterServerEvent('sarah_coke:server:setSpotState')
AddEventHandler('sarah_coke:server:setSpotState', function(stateType, state, spot)
    if stateType == "isBusy" then
        Config.Coke["takeables"][spot].isBusy = state
    elseif stateType == "isDone" then
        Config.Coke["takeables"][spot].isDone = state
    end
    TriggerClientEvent('sarah_coke:client:setSpotState', -1, stateType, state, spot)
end)

RegisterServerEvent('sarah_coke:server:itemReward')
AddEventHandler('sarah_coke:server:itemReward', function(spot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Config.Coke["takeables"][spot].reward
	local bag = Player.Functions.GetItemByName('empty_weed_bag')
	local spot = spot
	if Player.PlayerData.items ~= nil then
		CokerewardsProcess(source,spot)
	end
end)

RegisterServerEvent('sarah_coke:server:LoadLocationList')
AddEventHandler('sarah_coke:server:LoadLocationList', function()
    local src = source
    TriggerClientEvent("sarah_coke:server:LoadLocationList", source, Config.Coke)
end)


function CokerewardsProcess(source,spot)
    local Player = QBCore.Functions.GetPlayer(source)
	local item = Config.Coke["takeables"][spot].reward
	Player.Functions.AddItem(item.name, item.amount)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item.name], 'add')
end

function WeedrewardsProcess(source,spot)
    local Player = QBCore.Functions.GetPlayer(source)
	local item = Config.Weed["takeables"][spot].reward
	Player.Functions.AddItem(item.name, item.amount)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item.name], 'add')
end


RegisterServerEvent('sarah_weed:server:whitewidowjoint')
AddEventHandler('sarah_weed:server:whitewidowjoint', function()
	local Player = QBCore.Functions.GetPlayer(source)
    local wetweed = Player.Functions.GetItemByName('weed_white-widow')
    local rolling = Player.Functions.GetItemByName('rolling_paper')
    if wetweed ~= nil then
		if rolling ~= nil then
			if rolling.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('weed_white-widow', 4)---
					Player.Functions.RemoveItem('rolling_paper', 2)---
					Player.Functions.AddItem('joint_white-widow', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_white-widow'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint_white-widow'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:amnesiajoint')
AddEventHandler('sarah_weed:server:amnesiajoint', function()
	local Player = QBCore.Functions.GetPlayer(source)
    local wetweed = Player.Functions.GetItemByName('weed_amnesia')
    local rolling = Player.Functions.GetItemByName('rolling_paper')
    if wetweed ~= nil then
		if rolling ~= nil then
			if rolling.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('weed_amnesia', 4)---
					Player.Functions.RemoveItem('rolling_paper', 2)---
					Player.Functions.AddItem('joint_amnesia', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_amnesia'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint_amnesia'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:kushjoint')
AddEventHandler('sarah_weed:server:kushjoint', function()
	local Player = QBCore.Functions.GetPlayer(source)
    local wetweed = Player.Functions.GetItemByName('weed_og-kush')
    local rolling = Player.Functions.GetItemByName('rolling_paper')
    if wetweed ~= nil then
		if rolling ~= nil then
			if rolling.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('weed_og-kush', 4)---
					Player.Functions.RemoveItem('rolling_paper', 2)---
					Player.Functions.AddItem('joint_og-kush', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_og-kush'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint_og-kush'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:purplejoint')
AddEventHandler('sarah_weed:server:purplejoint', function()
	local Player = QBCore.Functions.GetPlayer(source)
    local wetweed = Player.Functions.GetItemByName('weed_purple-haze')
    local rolling = Player.Functions.GetItemByName('rolling_paper')
    if wetweed ~= nil then
		if rolling ~= nil then
			if rolling.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('weed_purple-haze', 4)---
					Player.Functions.RemoveItem('rolling_paper', 2)---
					Player.Functions.AddItem('joint_purple-haze', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_purple-haze'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint_purple-haze'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:skunkjoint')
AddEventHandler('sarah_weed:server:skunkjoint', function()
	local Player = QBCore.Functions.GetPlayer(source)
    local wetweed = Player.Functions.GetItemByName('weed_skunk')
    local rolling = Player.Functions.GetItemByName('rolling_paper')
    if wetweed ~= nil then
		if rolling ~= nil then
			if rolling.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('weed_skunk', 4)---
					Player.Functions.RemoveItem('rolling_paper', 2)---
					Player.Functions.AddItem('joint_skunk', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_skunk'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint_skunk'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent('sarah_weed:server:ak47joint')
AddEventHandler('sarah_weed:server:ak47joint', function()
	local Player = QBCore.Functions.GetPlayer(source)
    local wetweed = Player.Functions.GetItemByName('weed_ak47')
    local rolling = Player.Functions.GetItemByName('rolling_paper')
    if wetweed ~= nil then
		if rolling ~= nil then
			if rolling.amount >= 2 then 
				if wetweed.amount >= 4 then 
					Player.Functions.RemoveItem('weed_ak47', 4)---
					Player.Functions.RemoveItem('rolling_paper', 2)---
					Player.Functions.AddItem('joint_ak47', 2)--
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['weed_ak47'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rolling_paper'], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint_ak47'], "add")
				else
					TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)
