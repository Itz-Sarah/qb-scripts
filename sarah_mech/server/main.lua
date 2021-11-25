RegisterServerEvent("qb-AAA:server:enginelv1")
AddEventHandler("qb-AAA:server:enginelv1", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_metal', 6)---
					        Player.Functions.RemoveItem('reinforced_aluminum', 3)---
                            Player.Functions.RemoveItem('refined_copper', 12)---
					        Player.Functions.AddItem('engine_level_1', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_1'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:enginelv2")
AddEventHandler("qb-AAA:server:enginelv2", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_metal', 12)---
					        Player.Functions.RemoveItem('reinforced_aluminum', 6)---
                            Player.Functions.RemoveItem('refined_copper', 24)---
					        Player.Functions.AddItem('engine_level_2', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_2'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:enginelv3")
AddEventHandler("qb-AAA:server:enginelv3", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_metal', 18)---
					        Player.Functions.RemoveItem('reinforced_aluminum', 9)---
                            Player.Functions.RemoveItem('refined_copper', 36)---
					        Player.Functions.AddItem('engine_level_3', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_3'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:enginelv4")
AddEventHandler("qb-AAA:server:enginelv4", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_metal', 25)---
					        Player.Functions.RemoveItem('reinforced_aluminum', 16)---
                            Player.Functions.RemoveItem('refined_copper', 48)---
					        Player.Functions.AddItem('engine_level_4', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_4'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)


RegisterServerEvent("qb-AAA:server:enginelv5")
AddEventHandler("qb-AAA:server:enginelv5", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	local item4 = Player.Functions.GetItemByName('hardened_steel')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
				if item4 ~= nil then
			    	if item2.amount >= 1 then 
				    	if item1.amount >= 1 then 
                       		if item3.amount >= 1 then 
								if item4.amount >= 1 then 
					        		Player.Functions.RemoveItem('reinforced_metal', 70)---
					        		Player.Functions.RemoveItem('reinforced_aluminum', 30)---
                            		Player.Functions.RemoveItem('hardened_steel', 30)---
									Player.Functions.RemoveItem('refined_copper', 70)---
					        		Player.Functions.AddItem('engine_level_5', 1)--
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
									TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['engine_level_5'], "add")
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

RegisterServerEvent("qb-AAA:server:suspensionlv1")
AddEventHandler("qb-AAA:server:suspensionlv1", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('refined_lead')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_metal', 7)---
					        Player.Functions.RemoveItem('refined_lead', 4)---
                            Player.Functions.RemoveItem('refined_copper', 9)---
					        Player.Functions.AddItem('suspension_level_1', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_lead'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_1'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:suspensionlv2")
AddEventHandler("qb-AAA:server:suspensionlv2", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('refined_lead')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_metal', 14)---
					        Player.Functions.RemoveItem('refined_lead', 8)---
                            Player.Functions.RemoveItem('refined_copper', 18)---
					        Player.Functions.AddItem('suspension_level_2', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_lead'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_2'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:suspensionlv3")
AddEventHandler("qb-AAA:server:suspensionlv3", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('refined_lead')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_metal', 18)---
					        Player.Functions.RemoveItem('refined_lead', 12)---
                            Player.Functions.RemoveItem('refined_copper', 22)---
					        Player.Functions.AddItem('suspension_level_3', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_lead'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_3'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)


RegisterServerEvent("qb-AAA:server:suspensionlv4")
AddEventHandler("qb-AAA:server:suspensionlv4", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	local item4 = Player.Functions.GetItemByName('hardened_steel')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
				if item4 ~= nil then
			    	if item2.amount >= 1 then 
				    	if item1.amount >= 1 then 
                       		if item3.amount >= 1 then 
								if item4.amount >= 1 then 
					        		Player.Functions.RemoveItem('reinforced_metal', 70)---
					        		Player.Functions.RemoveItem('reinforced_aluminum', 30)---
                            		Player.Functions.RemoveItem('hardened_steel', 30)---
									Player.Functions.RemoveItem('refined_copper', 70)---
					        		Player.Functions.AddItem('suspension_level_4', 1)--
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
									TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_4'], "add")
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

RegisterServerEvent("qb-AAA:server:suspensionlv5")
AddEventHandler("qb-AAA:server:suspensionlv5", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	local item4 = Player.Functions.GetItemByName('hardened_steel')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
				if item4 ~= nil then
			    	if item2.amount >= 1 then 
				    	if item1.amount >= 1 then 
                       		if item3.amount >= 1 then 
								if item4.amount >= 1 then 
					        		Player.Functions.RemoveItem('reinforced_metal', 90)---
					        		Player.Functions.RemoveItem('reinforced_aluminum', 40)---
                            		Player.Functions.RemoveItem('hardened_steel', 40)---
									Player.Functions.RemoveItem('refined_copper', 90)---
					        		Player.Functions.AddItem('suspension_level_5', 1)--
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
									TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['suspension_level_5'], "add")
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


RegisterServerEvent("qb-AAA:server:brakeslv1")
AddEventHandler("qb-AAA:server:brakeslv1", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('refined_lead')
    local item3 = Player.Functions.GetItemByName('refined_zinc')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('hardened_steel', 8)---
					        Player.Functions.RemoveItem('refined_lead', 12)---
                            Player.Functions.RemoveItem('refined_zinc', 12)---
					        Player.Functions.AddItem('brakes_level_1', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_lead'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_zinc'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_1'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:brakeslv2")
AddEventHandler("qb-AAA:server:brakeslv2", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('refined_lead')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('hardened_steel', 18)---
					        Player.Functions.RemoveItem('refined_lead', 24)---
                            Player.Functions.RemoveItem('refined_zinc', 24)---
					        Player.Functions.AddItem('brakes_level_2', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_lead'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_zinc'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_2'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:brakeslv3")
AddEventHandler("qb-AAA:server:brakeslv3", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('hardened_steel')
    local item2 = Player.Functions.GetItemByName('refined_lead')
    local item3 = Player.Functions.GetItemByName('refined_zinc')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('hardened_steel', 24)---
					        Player.Functions.RemoveItem('refined_lead', 36)---
                            Player.Functions.RemoveItem('refined_zinc', 36)---
					        Player.Functions.AddItem('brakes_level_3', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_lead'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_zinc'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_3'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)


RegisterServerEvent("qb-AAA:server:brakeslv4")
AddEventHandler("qb-AAA:server:brakeslv4", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('refined_lead')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	local item4 = Player.Functions.GetItemByName('hardened_steel')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
				if item4 ~= nil then
			    	if item2.amount >= 1 then 
				    	if item1.amount >= 1 then 
                       		if item3.amount >= 1 then 
								if item4.amount >= 1 then 
					        		Player.Functions.RemoveItem('reinforced_metal', 70)---
					        		Player.Functions.RemoveItem('refined_lead', 30)---
                            		Player.Functions.RemoveItem('hardened_steel', 30)---
									Player.Functions.RemoveItem('refined_copper', 70)---
					        		Player.Functions.AddItem('brakes_level_4', 1)--
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_lead'], "remove")
                            		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
									TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_4'], "add")
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

RegisterServerEvent("qb-AAA:server:brakeslv5")
AddEventHandler("qb-AAA:server:brakeslv5", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	local item4 = Player.Functions.GetItemByName('hardened_steel')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
				if item4 ~= nil then
			    	if item2.amount >= 1 then 
				    	if item1.amount >= 1 then 
                       		if item3.amount >= 1 then 
								if item4.amount >= 1 then 
					        		Player.Functions.RemoveItem('reinforced_metal', 90)---
					        		Player.Functions.RemoveItem('reinforced_aluminum', 50)---
                            		Player.Functions.RemoveItem('hardened_steel', 40)---
									Player.Functions.RemoveItem('refined_copper', 90)---
					        		Player.Functions.AddItem('brakes_level_5', 1)--
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
									TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['brakes_level_5'], "add")
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

RegisterServerEvent("qb-AAA:server:translv1")
AddEventHandler("qb-AAA:translv1", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('hardened_steel')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 5)---
					        Player.Functions.RemoveItem('hardened_steel', 8)---
                            Player.Functions.RemoveItem('refined_copper', 12)---
					        Player.Functions.AddItem('trans_level_1', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_1'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:translv2")
AddEventHandler("qb-AAA:translv2", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('hardened_steel')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 9)---
					        Player.Functions.RemoveItem('hardened_steel', 15)---
                            Player.Functions.RemoveItem('refined_copper', 20)---
					        Player.Functions.AddItem('trans_level_2', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_2'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:translv3")
AddEventHandler("qb-AAA:translv3", function()
	local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('hardened_steel')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 15)---
					        Player.Functions.RemoveItem('hardened_steel', 13)---
                            Player.Functions.RemoveItem('refined_copper', 30)---
					        Player.Functions.AddItem('trans_level_3', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_3'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:translv4")
AddEventHandler("qb-AAA:translv4", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	local item4 = Player.Functions.GetItemByName('hardened_steel')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
				if item4 ~= nil then
			    	if item2.amount >= 1 then 
				    	if item1.amount >= 1 then 
                       		if item3.amount >= 1 then 
								if item4.amount >= 1 then 
					        		Player.Functions.RemoveItem('reinforced_metal', 70)---
					        		Player.Functions.RemoveItem('reinforced_aluminum', 30)---
                            		Player.Functions.RemoveItem('hardened_steel', 30)---
									Player.Functions.RemoveItem('refined_copper', 70)---
					        		Player.Functions.AddItem('trans_level_4', 1)--
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
									TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_4'], "add")
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

RegisterServerEvent("qb-AAA:server:translv5")
AddEventHandler("qb-AAA:translv5", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_metal')
    local item2 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item3 = Player.Functions.GetItemByName('refined_copper')
	local item4 = Player.Functions.GetItemByName('hardened_steel')
	if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
				if item4 ~= nil then
			    	if item2.amount >= 1 then 
				    	if item1.amount >= 1 then 
                       		if item3.amount >= 1 then 
								if item4.amount >= 1 then 
					        		Player.Functions.RemoveItem('reinforced_metal', 90)---
					        		Player.Functions.RemoveItem('reinforced_aluminum', 40)---
                            		Player.Functions.RemoveItem('hardened_steel', 40)---
									Player.Functions.RemoveItem('refined_copper', 120)---
					        		Player.Functions.AddItem('trans_level_5', 1)--
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
                            		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
									TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trans_level_5'], "add")
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

RegisterServerEvent("qb-AAA:server:armourlv1")
AddEventHandler("qb-AAA:armourlv1", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('reinforced_metal')
    local item3 = Player.Functions.GetItemByName('hardened_steel')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 8)---
					        Player.Functions.RemoveItem('reinforced_metal', 8)---
                            Player.Functions.RemoveItem('hardened_steel', 8)---
					        Player.Functions.AddItem('armour_level_1', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_1'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:armourlv2")
AddEventHandler("qb-AAA:armourlv2", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('reinforced_metal')
    local item3 = Player.Functions.GetItemByName('hardened_steel')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 15)---
					        Player.Functions.RemoveItem('reinforced_metal', 15)---
                            Player.Functions.RemoveItem('hardened_steel', 15)---
					        Player.Functions.AddItem('armour_level_2', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_2'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:armourlv3")
AddEventHandler("qb-AAA:armourlv3", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('reinforced_metal')
    local item3 = Player.Functions.GetItemByName('hardened_steel')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 30)---
					        Player.Functions.RemoveItem('reinforced_metal', 30)---
                            Player.Functions.RemoveItem('hardened_steel', 30)---
					        Player.Functions.AddItem('armour_level_3', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_3'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:armourlv4")
AddEventHandler("qb-AAA:armourlv4", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('reinforced_metal')
    local item3 = Player.Functions.GetItemByName('hardened_steel')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 40)---
					        Player.Functions.RemoveItem('reinforced_metal', 40)---
                            Player.Functions.RemoveItem('hardened_steel', 40)---
					        Player.Functions.AddItem('armour_level_4', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_4'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:armourlv5")
AddEventHandler("qb-AAA:armourlv5", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('reinforced_metal')
    local item3 = Player.Functions.GetItemByName('hardened_steel')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 90)---
					        Player.Functions.RemoveItem('reinforced_metal', 90)---
                            Player.Functions.RemoveItem('hardened_steel', 90)---
					        Player.Functions.AddItem('armour_level_5', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_metal'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hardened_steel'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['armour_level_5'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:raceharness")
AddEventHandler("qb-AAA:raceharness", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('thatch')
    local item3 = Player.Functions.GetItemByName('rolling_paper')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 4)---
					        Player.Functions.RemoveItem('thatch', 8)---
                            Player.Functions.RemoveItem('leather', 8)---
					        Player.Functions.AddItem('harness', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['thatch'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leather'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['harness'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:tunerchip")
AddEventHandler("qb-AAA:tunerchip", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('security_card_01')
    local item2 = Player.Functions.GetItemByName('trojan_usb')
    local item3 = Player.Functions.GetItemByName('electronickit')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('security_card_01', 2)---
					        Player.Functions.RemoveItem('trojan_usb', 4)---
                            Player.Functions.RemoveItem('electronickit', 7)---
					        Player.Functions.AddItem('tunerlaptop', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['security_card_01'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['trojan_usb'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['electronickit'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['tunerlaptop'], "add")
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
		else
			TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, 'You don\'t have the right items', "error")
	end
end)

RegisterServerEvent("qb-AAA:server:nitrous")
AddEventHandler("qb-AAA:nitrous", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item1 = Player.Functions.GetItemByName('reinforced_aluminum')
    local item2 = Player.Functions.GetItemByName('refined_copper')
    local item3 = Player.Functions.GetItemByName('aluminumoxide')
    if item1 ~= nil then
		if item2 ~= nil then
            if item3 ~= nil then
			    if item2.amount >= 1 then 
				    if item1.amount >= 1 then 
                        if item3.amount >= 1 then 
					        Player.Functions.RemoveItem('reinforced_aluminum', 8)---
					        Player.Functions.RemoveItem('refined_copper', 12)---
                            Player.Functions.RemoveItem('aluminumoxide', 20)---
					        Player.Functions.AddItem('nitrous', 1)--
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['reinforced_aluminum'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refined_copper'], "remove")
                            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['aluminumoxide'], "remove")
					        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['nitrous'], "add")
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
        -- exports.ghmattimysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
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
        -- exports.ghmattimysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
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
        -- exports.ghmattimysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
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
        -- exports.ghmattimysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
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
        -- exports.ghmattimysql:execute('SELECT mods FROM player_vehicles WHERE plate=@plate', {['@plate'] = myCar.plate}, function(result)
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




        exports.ghmattimysql:execute('UPDATE player_vehicles SET mods=@mods WHERE plate=@plate', {['@mods'] = json.encode(myCar), ['@plate'] = myCar.plate})
    end
end)

-- mechanic (Hayes)
RegisterServerEvent("aaa:updateShop")
AddEventHandler("aaa:updateShop", function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	print("Shop level")
	local result = exports.ghmattimysql:executeSync('SELECT level FROM mechanic_shops WHERE shopname=@shopname', {['@shopname'] = xPlayer.PlayerData.job.name} function(result)
			print(result)
		TriggerClientEvent("aaa:client:updateshop", result)
	end)
end)

function IsVehicleOwned(plate)
    local retval = false
    local result = exports.ghmattimysql:scalarSync('SELECT plate FROM player_vehicles WHERE plate=@plate', {['@plate'] = plate})
    if result then
        retval = true
    end
    return retval
end