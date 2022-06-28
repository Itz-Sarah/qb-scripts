local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-AAA:server:craftengine")
AddEventHandler("qb-AAA:server:craftengine", function(level)
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName(Engine.components.item1)
    local item2 = Player.Functions.GetItemByName(Engine.components.item2)
    local item3 = Player.Functions.GetItemByName(Engine.components.item3)
    local item4 = Player.Functions.GetItemByName(Engine.components.item4)

    if level == 1 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= Engine.level1.item1ammount and item2.amount >= Engine.level1.item2ammount and item3.amount >= Engine.level1.item3ammount then
                Player.Functions.RemoveItem(Engine.components.item1, Engine.level1.item1ammount)
				Player.Functions.RemoveItem(Engine.components.item2, Engine.level1.item2ammount)
                Player.Functions.RemoveItem(Engine.components.item3, Engine.level1.item3ammount)
					Player.Functions.AddItem('engine_level_1', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_1'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 2 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= Engine.level2.item1ammount and item2.amount >= Engine.level2.item2ammount and item3.amount >= Engine.level2.item3ammount then
                Player.Functions.RemoveItem(Engine.components.item1, Engine.level2.item1ammount)
				Player.Functions.RemoveItem(Engine.components.item2, Engine.level2.item2ammount)
                Player.Functions.RemoveItem(Engine.components.item3, Engine.level2.item3ammount)
					Player.Functions.AddItem('engine_level_2', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_2'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 3 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= Engine.level3.item1ammount and item2.amount >= Engine.level3.item2ammount and item3.amount >= Engine.level3.item3ammount then
                Player.Functions.RemoveItem(Engine.components.item1, Engine.level3.item1ammount)
				Player.Functions.RemoveItem(Engine.components.item2, Engine.level3.item2ammount)
                Player.Functions.RemoveItem(Engine.components.item3, Engine.level3.item3ammount)
					Player.Functions.AddItem('engine_level_3', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_3'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 4 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= Engine.level4.item1ammount and item2.amount >= Engine.level4.item2ammount and item3.amount >= Engine.level4.item3ammount then
                Player.Functions.RemoveItem(Engine.components.item1, Engine.level4.item1ammount)
				Player.Functions.RemoveItem(Engine.components.item2, Engine.level4.item2ammount)
                Player.Functions.RemoveItem(Engine.components.item3, Engine.level4.item3ammount)
					Player.Functions.AddItem('engine_level_4', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_4'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 5 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
            if item1.amount >= Engine.level5.item1ammount and item2.amount >= Engine.level5.item2ammount and item3.amount >= Engine.level5.item3ammount and item4.amount >= Engine.level5.item4ammount then
                Player.Functions.RemoveItem(Engine.components.item1, Engine.level5.item1ammount)
				Player.Functions.RemoveItem(Engine.components.item2, Engine.level5.item2ammount)
                Player.Functions.RemoveItem(Engine.components.item3, Engine.level5.item3ammount)
				Player.Functions.RemoveItem(Engine.components.item4, Engine.level5.item4ammount)
					Player.Functions.AddItem('engine_level_5', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item3], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Engine.components.item4], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_5'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    end
end)

RegisterServerEvent("qb-AAA:server:craftSuspension")
AddEventHandler("qb-AAA:server:craftSuspension", function(level)
	print(level)
	print("reached server")
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName(Suspension.components.item1)
    local item2 = Player.Functions.GetItemByName(Suspension.components.item2)
    local item3 = Player.Functions.GetItemByName(Suspension.components.item3)
    local item4 = Player.Functions.GetItemByName(Suspension.components.item4)

    if level == 1 then
		print("reached level 1")
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= Suspension.level1.item1ammount and item2.amount >= Suspension.level1.item2ammount and item3.amount >= Suspension.level1.item3ammount then
                Player.Functions.RemoveItem(Suspension.components.item1, Suspension.level1.item1ammount)
				Player.Functions.RemoveItem(Suspension.components.item2, Suspension.level1.item2ammount)
                Player.Functions.RemoveItem(Suspension.components.item3, Suspension.level1.item3ammount)
					Player.Functions.AddItem('suspension_level_1', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_1'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 2 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= Suspension.level2.item1ammount and item2.amount >= Suspension.level2.item2ammount and item3.amount >= Suspension.level2.item3ammount then
                Player.Functions.RemoveItem(Suspension.components.item1, Suspension.level2.item1ammount)
				Player.Functions.RemoveItem(Suspension.components.item2, Suspension.level2.item2ammount)
                Player.Functions.RemoveItem(Suspension.components.item3, Suspension.level2.item3ammount)
					Player.Functions.AddItem('suspension_level_2', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_2'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 3 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= Suspension.level3.item1ammount and item2.amount >= Suspension.level3.item2ammount and item3.amount >= Suspension.level3.item3ammount then
                Player.Functions.RemoveItem(Suspension.components.item1, Suspension.level3.item1ammount)
				Player.Functions.RemoveItem(Suspension.components.item2, Suspension.level3.item2ammount)
                Player.Functions.RemoveItem(Suspension.components.item3, Suspension.level3.item3ammount)
					Player.Functions.AddItem('suspension_level_3', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_3'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 4 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= Suspension.level4.item1ammount and item2.amount >= Suspension.level4.item2ammount and item3.amount >= Suspension.level4.item3ammount then
                Player.Functions.RemoveItem(Suspension.components.item1, Suspension.level4.item1ammount)
				Player.Functions.RemoveItem(Suspension.components.item2, Suspension.level4.item2ammount)
                Player.Functions.RemoveItem(Suspension.components.item3, Suspension.level4.item3ammount)
					Player.Functions.AddItem('suspension_level_4', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_4'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 5 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
            if item1.amount >= Suspension.level5.item1ammount and item2.amount >= Suspension.level5.item2ammount and item3.amount >= Suspension.level5.item3ammount and item4.amount >= Suspension.level5.item4ammount then
                Player.Functions.RemoveItem(Suspension.components.item1, Suspension.level5.item1ammount)
				Player.Functions.RemoveItem(Suspension.components.item2, Suspension.level5.item2ammount)
                Player.Functions.RemoveItem(Suspension.components.item3, Suspension.level5.item3ammount)
				Player.Functions.RemoveItem(Suspension.components.item4, Suspension.level5.item4ammount)
					Player.Functions.AddItem('suspension_level_5', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item3], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Suspension.components.item4], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_5'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    end
end)


RegisterServerEvent("qb-AAA:server:craftbrakes")
AddEventHandler("qb-AAA:server:craftbrakes", function(level)
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName(brakes.components.item1)
    local item2 = Player.Functions.GetItemByName(brakes.components.item2)
    local item3 = Player.Functions.GetItemByName(brakes.components.item3)
    local item4 = Player.Functions.GetItemByName(brakes.components.item4)

    if level == 1 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= brakes.level1.item1ammount and item2.amount >= brakes.level1.item2ammount and item3.amount >= brakes.level1.item3ammount then
                Player.Functions.RemoveItem(brakes.components.item1, brakes.level1.item1ammount)
				Player.Functions.RemoveItem(brakes.components.item2, brakes.level1.item2ammount)
                Player.Functions.RemoveItem(brakes.components.item3, brakes.level1.item3ammount)
					Player.Functions.AddItem('brakes_level_1', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_1'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 2 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= brakes.level2.item1ammount and item2.amount >= brakes.level2.item2ammount and item3.amount >= brakes.level2.item3ammount then
                Player.Functions.RemoveItem(brakes.components.item1, brakes.level2.item1ammount)
				Player.Functions.RemoveItem(brakes.components.item2, brakes.level2.item2ammount)
                Player.Functions.RemoveItem(brakes.components.item3, brakes.level2.item3ammount)
					Player.Functions.AddItem('brakes_level_2', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_2'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 3 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= brakes.level3.item1ammount and item2.amount >= brakes.level3.item2ammount and item3.amount >= brakes.level3.item3ammount then
                Player.Functions.RemoveItem(brakes.components.item1, brakes.level3.item1ammount)
				Player.Functions.RemoveItem(brakes.components.item2, brakes.level3.item2ammount)
                Player.Functions.RemoveItem(brakes.components.item3, brakes.level3.item3ammount)
					Player.Functions.AddItem('brakes_level_3', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_3'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 4 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= brakes.level4.item1ammount and item2.amount >= brakes.level4.item2ammount and item3.amount >= brakes.level4.item3ammount then
                Player.Functions.RemoveItem(brakes.components.item1, brakes.level4.item1ammount)
				Player.Functions.RemoveItem(brakes.components.item2, brakes.level4.item2ammount)
                Player.Functions.RemoveItem(brakes.components.item3, brakes.level4.item3ammount)
					Player.Functions.AddItem('brakes_level_4', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_4'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 5 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
            if item1.amount >= brakes.level5.item1ammount and item2.amount >= brakes.level5.item2ammount and item3.amount >= brakes.level5.item3ammount and item4.amount >= brakes.level5.item4ammount then
                Player.Functions.RemoveItem(brakes.components.item1, brakes.level5.item1ammount)
				Player.Functions.RemoveItem(brakes.components.item2, brakes.level5.item2ammount)
                Player.Functions.RemoveItem(brakes.components.item3, brakes.level5.item3ammount)
				Player.Functions.RemoveItem(brakes.components.item4, brakes.level5.item4ammount)
					Player.Functions.AddItem('brakes_level_5', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item3], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[brakes.components.item4], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_5'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    end
end)

RegisterServerEvent("qb-AAA:server:crafttransmission")
AddEventHandler("qb-AAA:server:crafttransmission", function(level)
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName(transmission.components.item1)
    local item2 = Player.Functions.GetItemByName(transmission.components.item2)
    local item3 = Player.Functions.GetItemByName(transmission.components.item3)
    local item4 = Player.Functions.GetItemByName(transmission.components.item4)

    if level == 1 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= transmission.level1.item1ammount and item2.amount >= transmission.level1.item2ammount and item3.amount >= transmission.level1.item3ammount then
                Player.Functions.RemoveItem(transmission.components.item1, transmission.level1.item1ammount)
				Player.Functions.RemoveItem(transmission.components.item2, transmission.level1.item2ammount)
                Player.Functions.RemoveItem(transmission.components.item3, transmission.level1.item3ammount)
					Player.Functions.AddItem('trans_level_1', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_1'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 2 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= transmission.level2.item1ammount and item2.amount >= transmission.level2.item2ammount and item3.amount >= transmission.level2.item3ammount then
                Player.Functions.RemoveItem(transmission.components.item1, transmission.level2.item1ammount)
				Player.Functions.RemoveItem(transmission.components.item2, transmission.level2.item2ammount)
                Player.Functions.RemoveItem(transmission.components.item3, transmission.level2.item3ammount)
					Player.Functions.AddItem('trans_level_2', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_2'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 3 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= transmission.level3.item1ammount and item2.amount >= transmission.level3.item2ammount and item3.amount >= transmission.level3.item3ammount then
                Player.Functions.RemoveItem(transmission.components.item1, transmission.level3.item1ammount)
				Player.Functions.RemoveItem(transmission.components.item2, transmission.level3.item2ammount)
                Player.Functions.RemoveItem(transmission.components.item3, transmission.level3.item3ammount)
					Player.Functions.AddItem('trans_level_3', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_3'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 4 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= transmission.level4.item1ammount and item2.amount >= transmission.level4.item2ammount and item3.amount >= transmission.level4.item3ammount then
                Player.Functions.RemoveItem(transmission.components.item1, transmission.level4.item1ammount)
				Player.Functions.RemoveItem(transmission.components.item2, transmission.level4.item2ammount)
                Player.Functions.RemoveItem(transmission.components.item3, transmission.level4.item3ammount)
					Player.Functions.AddItem('trans_level_4', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_4'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 5 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
            if item1.amount >= transmission.level5.item1ammount and item2.amount >= transmission.level5.item2ammount and item3.amount >= transmission.level5.item3ammount and item4.amount >= transmission.level5.item4ammount then
                Player.Functions.RemoveItem(transmission.components.item1, transmission.level5.item1ammount)
				Player.Functions.RemoveItem(transmission.components.item2, transmission.level5.item2ammount)
                Player.Functions.RemoveItem(transmission.components.item3, transmission.level5.item3ammount)
				Player.Functions.RemoveItem(transmission.components.item4, transmission.level5.item4ammount)
					Player.Functions.AddItem('trans_level_5', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item3], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[transmission.components.item4], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_5'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    end
end)

RegisterServerEvent("qb-AAA:server:craftarmour")
AddEventHandler("qb-AAA:server:craftarmour", function(level)
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName(armour.components.item1)
    local item2 = Player.Functions.GetItemByName(armour.components.item2)
    local item3 = Player.Functions.GetItemByName(armour.components.item3)
    local item4 = Player.Functions.GetItemByName(armour.components.item4)

    if level == 1 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= armour.level1.item1ammount and item2.amount >= armour.level1.item2ammount and item3.amount >= armour.level1.item3ammount then
                Player.Functions.RemoveItem(armour.components.item1, armour.level1.item1ammount)
				Player.Functions.RemoveItem(armour.components.item2, armour.level1.item2ammount)
                Player.Functions.RemoveItem(armour.components.item3, armour.level1.item3ammount)
					Player.Functions.AddItem('armour_level_1', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_1'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 2 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= armour.level2.item1ammount and item2.amount >= armour.level2.item2ammount and item3.amount >= armour.level2.item3ammount then
                Player.Functions.RemoveItem(armour.components.item1, armour.level2.item1ammount)
				Player.Functions.RemoveItem(armour.components.item2, armour.level2.item2ammount)
                Player.Functions.RemoveItem(armour.components.item3, armour.level2.item3ammount)
					Player.Functions.AddItem('armour_level_2', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_2'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 3 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= armour.level3.item1ammount and item2.amount >= armour.level3.item2ammount and item3.amount >= armour.level3.item3ammount then
                Player.Functions.RemoveItem(armour.components.item1, armour.level3.item1ammount)
				Player.Functions.RemoveItem(armour.components.item2, armour.level3.item2ammount)
                Player.Functions.RemoveItem(armour.components.item3, armour.level3.item3ammount)
					Player.Functions.AddItem('armour_level_3', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_3'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 4 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil then
            if item1.amount >= armour.level4.item1ammount and item2.amount >= armour.level4.item2ammount and item3.amount >= armour.level4.item3ammount then
                Player.Functions.RemoveItem(armour.components.item1, armour.level4.item1ammount)
				Player.Functions.RemoveItem(armour.components.item2, armour.level4.item2ammount)
                Player.Functions.RemoveItem(armour.components.item3, armour.level4.item3ammount)
					Player.Functions.AddItem('armour_level_4', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item3], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_4'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    elseif level == 5 then
        if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
            if item1.amount >= armour.level5.item1ammount and item2.amount >= armour.level5.item2ammount and item3.amount >= armour.level5.item3ammount and item4.amount >= armour.level5.item4ammount then
                Player.Functions.RemoveItem(armour.components.item1, armour.level5.item1ammount)
				Player.Functions.RemoveItem(armour.components.item2, armour.level5.item2ammount)
                Player.Functions.RemoveItem(armour.components.item3, armour.level5.item3ammount)
				Player.Functions.RemoveItem(armour.components.item4, armour.level5.item4ammount)
					Player.Functions.AddItem('armour_level_5', 1)
			    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item1], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item2], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item3], "remove")
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[armour.components.item4], "remove")
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_5'], "add")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
            end
        else 
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    end
end)

RegisterServerEvent("qb-AAA:server:raceharness")
AddEventHandler("qb-AAA:server:raceharness", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName(raceharness.components.item1)
    local item2 = Player.Functions.GetItemByName(raceharness.components.item2)
    local item3 = Player.Functions.GetItemByName(raceharness.components.item3)
    if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
        if item1.amount >= raceharness[level].item1ammount and item2.amount >= raceharness[level].item2ammount and item3.amount >= raceharness[level].item3ammount then
            Player.Functions.RemoveItem(raceharness.components.item1, raceharness[level].item1ammount)
            Player.Functions.RemoveItem(raceharness.components.item2, raceharness[level].item2ammount)
            Player.Functions.RemoveItem(raceharness.components.item3, raceharness[level].item3ammount)
                Player.Functions.AddItem('harness', 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[raceharness.components.item1], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[raceharness.components.item2], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[raceharness.components.item3], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['harness'], "add")
        else
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    else 
        TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
    end
end)

RegisterServerEvent("qb-AAA:server:tunerchip")
AddEventHandler("qb-AAA:server:tunerchip", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName(tunerchip.components.item1)
    local item2 = Player.Functions.GetItemByName(tunerchip.components.item2)
    local item3 = Player.Functions.GetItemByName(tunerchip.components.item3)
    if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
        if item1.amount >= tunerchip[level].item1ammount and item2.amount >= tunerchip[level].item2ammount and item3.amount >= tunerchip[level].item3ammount then
            Player.Functions.RemoveItem(tunerchip.components.item1, tunerchip[level].item1ammount)
            Player.Functions.RemoveItem(tunerchip.components.item2, tunerchip[level].item2ammount)
            Player.Functions.RemoveItem(tunerchip.components.item3, tunerchip[level].item3ammount)
                Player.Functions.AddItem('tunerlaptop', 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[tunerchip.components.item1], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[tunerchip.components.item2], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[tunerchip.components.item3], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['tunerlaptop'], "add")
        else
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    else 
        TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
    end
end)

RegisterServerEvent("qb-AAA:server:nitrous")
AddEventHandler("qb-AAA:server:nitrous", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName(nitrous.components.item1)
    local item2 = Player.Functions.GetItemByName(nitrous.components.item2)
    local item3 = Player.Functions.GetItemByName(nitrous.components.item3)
    if item1 ~= nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
        if item1.amount >= nitrous[level].item1ammount and item2.amount >= nitrous[level].item2ammount and item3.amount >= nitrous[level].item3ammount then
            Player.Functions.RemoveItem(nitrous.components.item1, nitrous[level].item1ammount)
            Player.Functions.RemoveItem(nitrous.components.item2, nitrous[level].item2ammount)
            Player.Functions.RemoveItem(nitrous.components.item3, nitrous[level].item3ammount)
                Player.Functions.AddItem('nitrous', 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[nitrous.components.item1], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[nitrous.components.item2], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[nitrous.components.item3], "remove")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['nitrous'], "add")
        else
            TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
        end
    else 
        TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
    end
end)


--transmission
RegisterServerEvent("AAA:server:checktransmissioncar")
AddEventHandler("AAA:server:checktransmissioncar", function(myCar)
	local src = source
	print(myCar.plate)
    if IsVehicleOwned(myCar.plate) then
        -- exports.oxmysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
		-- 	print(json.encode(result))
		-- 	local data = json.encode(result)
		print("is owned")
		TriggerClientEvent("AAA:client:checkTransmissionupgrades", src)
	end
end)
--engine
RegisterServerEvent("AAA:server:checkenginecar")
AddEventHandler("AAA:server:checkenginecar", function(myCar)
	local src = source
	print(myCar.plate)
    if IsVehicleOwned(myCar.plate) then
        -- exports.oxmysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
		-- 		print(json.encode(result))
		-- 		local data = json.encode(result)
		print("is owned")
		TriggerClientEvent("AAA:client:checkEngineupgrades", src)
	end
end)
--armour
RegisterServerEvent("AAA:server:checkarmourcar")
AddEventHandler("AAA:server:checkarmourcar", function(myCar)
	local src = source
	print(myCar.plate)
    if IsVehicleOwned(myCar.plate) then
        -- exports.oxmysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
		-- 		print(json.encode(result))
		-- 		local data = json.encode(result)
		print("is owned")
		TriggerClientEvent("AAA:client:checkarmourupgrades", src)
	end
end)
--brake
RegisterServerEvent("AAA:server:checkBrakecar")
AddEventHandler("AAA:server:checkBrakecar", function(myCar)
	local src = source
	print(myCar.plate)
    if IsVehicleOwned(myCar.plate) then
        -- exports.oxmysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
		-- 		print(json.encode(result))
		-- 		local data = json.encode(result)
		print("is owned")
		TriggerClientEvent("AAA:client:checkBrakesupgrades", src)
	end
end)
--suspension 
RegisterServerEvent("AAA:server:checksuspensioncar")
AddEventHandler("AAA:server:checksuspensioncar", function(myCar)
	local src = source
	print(myCar.plate)
    if IsVehicleOwned(myCar.plate) then
        -- exports.oxmysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
		-- 		print(json.encode(result))
		-- 		local data = json.encode(result)
		print("is owned")
		TriggerClientEvent("AAA:client:checkSuspensionupgrades", src)
	end
end)



-- Armour Installs and Removal of Item
RegisterServerEvent("qb-AAA:server:installarmour1")
AddEventHandler("qb-AAA:server:installarmour1", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('armour_level_1')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('armour_level_1', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_1'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradearmour", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installarmour2")
AddEventHandler("qb-AAA:server:installarmour2", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('armour_level_2')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('armour_level_2', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_2'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradearmour", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installarmour3")
AddEventHandler("qb-AAA:server:installarmour3", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('armour_level_3')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('armour_level_3', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_3'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradearmour", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installarmour4")
AddEventHandler("qb-AAA:server:installarmour4", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('armour_level_4')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('armour_level_4', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_4'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradearmour", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installarmour5")
AddEventHandler("qb-AAA:server:installarmour5", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('armour_level_5')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('armour_level_5', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_5'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradearmour", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

-- Engine Installs and Removal of Item
RegisterServerEvent("qb-AAA:server:installengine1")
AddEventHandler("qb-AAA:server:installengine1", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('engine_level_1')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('engine_level_1', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_1'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradeengine", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installengine2")
AddEventHandler("qb-AAA:server:installengine2", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('engine_level_2')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('engine_level_2', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_2'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradeengine", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installengine3")
AddEventHandler("qb-AAA:server:installengine3", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('engine_level_3')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('engine_level_3', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_3'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradeengine", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installengine4")
AddEventHandler("qb-AAA:server:installengine4", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('engine_level_4')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('engine_level_4', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_4'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradeengine", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installengine5")
AddEventHandler("qb-AAA:server:installengine5", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('engine_level_5')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('engine_level_5', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_5'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradeengine", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

-- Brakes Installs and Removal of Item
RegisterServerEvent("qb-AAA:server:installbrakes1")
AddEventHandler("qb-AAA:server:installbrakes1", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('brakes_level_1')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('brakes_level_1', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_1'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradebrakes", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installbrakes2")
AddEventHandler("qb-AAA:server:installbrakes2", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('brakes_level_2')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('brakes_level_2', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_2'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradebrakes", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installbrakes3")
AddEventHandler("qb-AAA:server:installbrakes3", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('brakes_level_3')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('brakes_level_3', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_3'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradebrakes", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installbrakes4")
AddEventHandler("qb-AAA:server:installbrakes4", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('brakes_level_4')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('brakes_level_4', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_4'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradebrakes", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installbrakes5")
AddEventHandler("qb-AAA:server:installbrakes5", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('brakes_level_5')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('brakes_level_5', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_5'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradebrakes", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

-- suspension Installs and Removal of Item
RegisterServerEvent("qb-AAA:server:installsuspension1")
AddEventHandler("qb-AAA:server:installsuspension1", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('suspension_level_1')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('suspension_level_1', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_1'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradesuspension", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installsuspension2")
AddEventHandler("qb-AAA:server:installsuspension2", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('suspension_level_2')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('suspension_level_2', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_2'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradesuspension", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installsuspension3")
AddEventHandler("qb-AAA:server:installsuspension3", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('suspension_level_3')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('suspension_level_3', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_3'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradesuspension", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installsuspension4")
AddEventHandler("qb-AAA:server:installsuspension4", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('suspension_level_4')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('suspension_level_4', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_4'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradesuspension", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installsuspension5")
AddEventHandler("qb-AAA:server:installsuspension5", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('suspension_level_5')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('suspension_level_5', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_5'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradesuspension", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

-- transmission Installs and Removal of Item
RegisterServerEvent("qb-AAA:server:installtrans1")
AddEventHandler("qb-AAA:server:installtrans1", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('trans_level_1')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('trans_level_1', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_1'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradetrans", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installtrans2")
AddEventHandler("qb-AAA:server:installtrans2", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('trans_level_2')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('trans_level_2', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_2'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradetrans", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installtrans3")
AddEventHandler("qb-AAA:server:installtrans3", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('trans_level_3')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('trans_level_3', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_3'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradetrans", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installtrans4")
AddEventHandler("qb-AAA:server:installtrans4", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('trans_level_4')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('trans_level_4', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_4'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradetrans", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:installtrans5")
AddEventHandler("qb-AAA:server:installtrans5", function(data)
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('trans_level_5')
    if item1 ~= nil then
		if item1.amount >= 1 then 
            Player.Functions.RemoveItem('trans_level_5', 1)---
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_5'], "remove")
			TriggerClientEvent("qb-AAA:client:newupgradetrans", src)
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("aaa:updateVehicle")
AddEventHandler("aaa:updateVehicle", function(myCar)
	local src = source
	print(myCar.plate)
	print("final step")
	print(json.encode(myCar))
    if IsVehicleOwned(myCar.plate) then
        exports.oxmysql:execute('UPDATE player_vehicles SET mods=@mods WHERE plate=@plate', {['@mods'] = json.encode(myCar), ['@plate'] = myCar.plate})
    end
end)

-- mechanic (Hayes)
-- RegisterServerEvent("aaa:updateShop")
-- AddEventHandler("aaa:updateShop", function()
-- 	local xPlayer = QBCore.Functions.GetPlayer(source)
-- 	local result =  exports.oxmysql:executeSync('SELECT level FROM mechanic_shops WHERE shopname=@shopname', {['@shopname'] = xPlayer.PlayerData.job.name}, function(result)
-- 			print(result)
-- 		TriggerClientEvent("aaa:client:updateshop", result)
-- 	end)
-- end)

function IsVehicleOwned(plate)
    local retval = false
    local result = exports.oxmysql:scalarSync('SELECT plate FROM player_vehicles WHERE plate=@plate', {['@plate'] = plate})
    if result then
        retval = true
    end
    return retval
end