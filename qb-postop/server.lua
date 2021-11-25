local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('postOP:success')
AddEventHandler('postOP:success', function()
	local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
	local chance = math.random(1,5)
	local tip = math.random(25,30)
	--local criticalTip = 20
	local random = math.random(1,5)
	local price = math.random(37, 40)
	local total = price
	if Player ~= nil then
		
		if chance == random then
		  TriggerClientEvent('QBCore:Notify', _source, 'They refused the package, you got to keep it!', "success")
		  Player.Functions.AddItem('package', 1)
		elseif chance > random then
		  total = price + tip
		else
		  TriggerClientEvent('QBCore:Notify', _source, 'You got a tip!', "success")
		end

	Player.Functions.AddMoney('cash', total, "DHL Pay")
	TriggerClientEvent('QBCore:Notify', _source, 'You got ' ..total.. ' Pounds!', "success")

   -- update player money amount
	end
end)


QBCore.Functions.CreateUseableItem("package", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem("package", 1, item.slot) then
		local random = math.random(1,10)
		if random == 1 then 
			Player.Functions.AddItem('lighter', 1)
		end
		if random == 2 then 
			Player.Functions.AddItem('fitbit', 1)
		end
		if random == 3 then 
			Player.Functions.AddItem('phone', 1)
		end
		if random == 4 then
			Player.Functions.AddItem('stickynote', 1)
		end
		if random == 5 then 
			Player.Functions.AddItem('rolling_paper', 1)
		end
		if random == 6 then 
			Player.Functions.AddItem('sandwich', 1)
		end
		if random == 7 then 
			Player.Functions.AddItem('water_bottle', 1)
		end
		if random == 8 then 
			Player.Functions.AddItem('tosti', 1)
		end
		if random == 9 then 
			Player.Functions.AddItem('beer', 1)
		end
		if random == 10 then
			Player.Functions.AddItem('vodka', 1)
		end
    end
end)