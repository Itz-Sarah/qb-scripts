isLoggedIn = true
PlayerJob = {}

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "popsdiner" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("qb-popsdiner:MurderMeal")
AddEventHandler("qb-popsdiner:MurderMeal", function()
		local randomToy = math.random(1,10)
		--remove box
		TriggerServerEvent('QBCore:Server:RemoveItem', "pops-dailydeal", 1)
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "pops-ulsterfry", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "burger-softdrink", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "burger-fries", 1)

		if randomToy < 4 then

			QBCore.Functions.Notify("No toy in Box Looool", "error")

		elseif randomToy == 4 then

			TriggerServerEvent('QBCore:Server:AddItem', "burger-toy1", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-toy1"], "add")

		elseif randomToy < 10 and randomToy > 4 then

			QBCore.Functions.Notify("No toy in Box Looool", "error")

		elseif randomToy == 10 then

			TriggerServerEvent('QBCore:Server:AddItem', "burger-toy2", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-toy2"], "add")
		else
            QBCore.Functions.Notify("No toy in Box Looool", "error")
        end
end)

RegisterNetEvent("qb-popsdiner:CreateMurderMeal")
AddEventHandler("qb-popsdiner:CreateMurderMeal", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-popsdiner:server:get:ingredientMurderMeal', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("pickup_sla", "Making A Special..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-heartstopper", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-softdrink", 1)


					TriggerServerEvent('QBCore:Server:AddItem', "pops-dailydeal", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pops-dailydeal"], "add")

                    QBCore.Functions.Notify("You made a A Daily Special", "success")
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-popsdiner:BleederBurger")
AddEventHandler("qb-popsdiner:BleederBurger", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-popsdiner:server:get:ingredientBurger', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("pickup_sla", "Making a dagwood..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pops-dagwood", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pops-dagwood"], "add")
                    QBCore.Functions.Notify("You made a Dagwood", "success")
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-popsdiner:MoneyShot")
AddEventHandler("qb-popsdiner:MoneyShot", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-popsdiner:server:get:ingredientBurger', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("pickup_sla", "Making a Sloppy Joe..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pops-slopyjoe", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pops-slopyjoe"], "add")
                    QBCore.Functions.Notify("You made a Sloppy Joe", "success")
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-popsdiner:HeartStopper")
AddEventHandler("qb-popsdiner:HeartStopper", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-popsdiner:server:get:ingredientBurger', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("pickup_sla", "Making Burgers..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pops-ulsterfry", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pops-ulsterfry"], "add")
                    QBCore.Functions.Notify("You made a Ulsterfry", "success")
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)


RegisterNetEvent("qb-popsdiner:Torpedo")
AddEventHandler("qb-popsdiner:Torpedo", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-popsdiner:server:get:ingredientTorpedo', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("pickup_sla", "Making A Rare Steak..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pops-steak", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pops-steak"], "add")
                    QBCore.Functions.Notify("You made a Steak and Chips", "success")
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("qb-popsdiner:MeatFree")
AddEventHandler("qb-popsdiner:MeatFree", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-popsdiner:server:get:ingredientMeatfree', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("pickup_sla", "Making A Taste Green Salad..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "pops-salad", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pops-salad"], "add")
                    QBCore.Functions.Notify("You made a Green Salad.", "success")
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					QBCore.Functions.Notify("Cancelled..", "error")
					Working = false
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)



RegisterNetEvent("qb-popsdiner:SoftDrink")
AddEventHandler("qb-popsdiner:SoftDrink", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeSoftDrink()
        else
            QBCore.Functions.Notify("You don't have any soda syrup..", "error")
        end
      end, 'burger-sodasyrup')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-popsdiner:mShake")
AddEventHandler("qb-popsdiner:mShake", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeMShake()
        else
            QBCore.Functions.Notify("You don't have any Milkshake Formula..", "error")
        end
      end, 'burger-mshakeformula')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-popsdiner:Fries")
AddEventHandler("qb-popsdiner:Fries", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeFries()
        else
            QBCore.Functions.Notify("You don't have any potatoes..", "error")
        end
      end, 'burger-potato' )
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)


RegisterNetEvent("qb-popsdiner:PattyFry")
AddEventHandler("qb-popsdiner:PattyFry", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakePatty()
        else
            QBCore.Functions.Notify("You don't have any raw patties..", "error")
        end
      end, 'burger-raw')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)



RegisterNetEvent("qb-popsdiner:DutyB")
AddEventHandler("qb-popsdiner:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-popsdiner:Tray1")
AddEventHandler("qb-popsdiner:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "popsdinertray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "popsdinertray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-popsdiner:Tray4")
AddEventHandler("qb-popsdiner:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "popsdinertray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "popsdinertray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-popsdiner:Tray3")
AddEventHandler("qb-popsdiner:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "popsdinertray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "popsdinertray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-popsdiner:Storage")
AddEventHandler("qb-popsdiner:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "popsdinerstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "popsdinerstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-popsdiner:Storage2")
AddEventHandler("qb-popsdiner:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "popsdinerstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "popsdinerstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

-- Functions --
function MakeFries()
TriggerServerEvent('QBCore:Server:RemoveItem', "burger-potato", 1)
QBCore.Functions.Progressbar("pickup", "Frying the fries..", 4000, false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = false,
},{
    animDict = "amb@prop_human_bbq@male@base",
    anim = "base",
    flags = 8,
    }, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = { x = -0.005, y = 0.00, z = 0.00 },
        rotation = { x = 175.0, y = 160.0, z = 0.0 },
    }
)
Citizen.Wait(4000)
TriggerServerEvent('QBCore:Server:AddItem', "burger-fries", 4)
TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-fries"], "add")
QBCore.Functions.Notify("You made 4 fries", "success")
StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end


function MakePatty()
    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-raw", 1)
    QBCore.Functions.Progressbar("pickup", "Cooking the Patty..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    },{
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
        flags = 8,
    }, {
        model = "prop_cs_fork",
        bone = 28422,
        coords = { x = -0.005, y = 0.00, z = 0.00 },
        rotation = { x = 175.0, y = 160.0, z = 0.0 },
    }
)
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-meat", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-meat"], "add")
    QBCore.Functions.Notify("You cooked the meat", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function MakeSoftDrink()

    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-sodasyrup", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-softdrink", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-softdrink"], "add")
    QBCore.Functions.Notify("You made a Soda", "success")
    end


function MakeMShake()

    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-mshakeformula", 1)
    QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-mshake", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-mshake"], "add")
    QBCore.Functions.Notify("You made a Milkshake", "success")
    end


-- bt target -

Citizen.CreateThread(function()


    exports['qb-target']:AddBoxZone("Duty", vector3(1590.5, 6458.70, 26.22), 2, 1.2, {
        name = "Duty",
        heading = 65.29,
        debugPoly = false,
        minZ=26.4,
        maxZ=28.0,
    }, {
        options = {
            {
                event = "qb-popsdiner:DutyB",
                icon = "far fa-clipboard",
                label = "Clock On/Off",
                job = "popsdiner",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("popsdiner_tray_1", vector3(1590.37, 6455.45, 26.01), 0.5, 0.7, {
        name = "popsdiner_tray_1",
        heading = 150.13,
        debugPoly = false,
        minZ=26.2,
        maxZ=26.4,
    }, {
        options = {
            {
                event = "qb-popsdiner:Tray1",
                icon = "far fa-clipboard",
                label = "Tray 1",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("popsdiner_tray_2", vector3(1586.79, 6457.02, 26.01), 0.5, 0.7, {
        name="popsdiner_tray_2",
        heading=150.13,
        debugPoly=false,
        minZ=26.2,
        maxZ=26.4,
    }, {
        options = {
            {
                event = "qb-popsdiner:Tray4",
                icon = "far fa-clipboard",
                label = "Tray 2",
				-- job = "all",
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("popsdiner_tray_3", vector3(1593.35, 6454.04, 26.01), 0.5, 0.7, {
        name="popsdiner_tray_3",
        heading=150.13,
        debugPoly=false,
        minZ=26.2,
        maxZ=26.4,
    }, {
        options = {
            {
                event = "qb-popsdiner:Tray3",
                icon = "far fa-clipboard",
                label = "Tray 3",
				-- job = "all",
            },
        },
        distance = 3.5
    })


    exports['qb-target']:AddBoxZone("popsdinercooker", vector3(1595.65, 6455.33, 26.01), 1.6, 0.5, {
    name="popsdinercooker",
    heading=65.29,
    debugPoly=false,
    minZ=26.0,
    maxZ=26.4,
    }, {
        options = {
            {
                event = "qb-popsdiner:PattyFry",
                icon = "fas fa-hamburger",
                label = "Burger Cook Station",
                job = "popsdiner",
            },
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("popsdinerfryer", vector3(1593.95, 6456.02, 26.01), 1.3, 0.5, {
        name="popsdinerfryer",
        heading=65.29,
        debugPoly=false,
        minZ=26.0,
        maxZ=26.4,
        }, {
            options = {
                {
                    event = "qb-popsdiner:Fries",
                    icon = "fas fa-box",
                    label = "Make Fries",
                    job = "popsdiner",
                },
            },
        distance = 1.5
    })


    exports['qb-target']:AddBoxZone("popsdinerdrinks", vector3(1592.23, 6456.56, 26.01), 1.3, 0.3, {
        name="popsdinerdrinks",
        heading=65.29,
        debugPoly=false,
        minZ=26.0,
        maxZ=26.9,
        }, {
            options = {
                {
                    event = "nh-context:DrinkMenu2",
                    icon = "fas fa-filter",
                    label = "Make Some Drinks",
                    job = "popsdiner",
                },
            },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("popsdinerfridge", vector3(1585.92, 6459.62, 27.01), 1.6, 1, {
        name="popsdinerfridge",
        heading=65.29,
        debugPoly=false,
        minZ=26.0,
        maxZ=27.2,
        }, {
            options = {
                {
                    event = "nh-context:OrderMenu2",
                    icon = "fas fa-laptop",
                    label = "Order Ingredients!",
                    job = "popsdiner",
                },
            },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("popsdinerdisplay", vector3(1588.93, 6455.97, 26.01), 1.8, 0.7, {
        name="popsdinerdisplay",
        debugPoly=false,
        heading=65.29,
        minZ=25.2,
        maxZ=26.9,
        }, {
            options = {
                {
                    event = "qb-popsdiner:Storage",
                    icon = "fas fa-box",
                    label = "popsdiner Storage",
                    job = "popsdiner",
                },
            },
        distance = 3.0
    })


    exports['qb-target']:AddBoxZone("popsdinercraftburger", vector3(1587.83, 6458.7, 26.01), 1.4, 0.7, {
        name="popsdinercraftburger",
        debugPoly=false,
        heading=65.29,
        minZ=25.0,
        maxZ=27.8,
        }, {
            options = {
                {
                    event = "nh-context:Burgers2",
                    icon = "fas fa-cheeseburger",
                    label = "popsdiner Work Station",
                    job = "popsdiner",
                },
            },
        distance = 3.0
    })


    exports['qb-target']:AddBoxZone("popsdiner_register_1", vector3(1589.97, 6455.49, 25.79), 0.5, 0.4, {
        name="popsdiner_register_1",
        debugPoly=false,
        heading=159.17,
        minZ=26.0,
        maxZ=26.9,
        }, {
            options = {
                {
                    event = "qb-popsdiner:bill",
                    parms = "1",
                    icon = "fas fa-credit-card",
                    label = "Charge Customer",
                    job = "popsdiner",
                },
            },
        distance = 1.5
    })

end)


-- NH - Context --

RegisterNetEvent('nh-context:Burgers2', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Available Burgers |",
            txt = "",
        },
        {
            id = 1,
            header = "• Moneyshot Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-popsdiner:MoneyShot"
            }
        },
        {
            id = 2,
            header = "• Meat Free Burger",
            txt = "Bun , Tomato , Lettuce",
            params = {
                event = "qb-popsdiner:MeatFree"
            }
        },
        {
            id = 3,
            header = "• Bleeder Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-popsdiner:BleederBurger"
            }
        },
        {
            id = 4,
            header = "• The Heart Stopper",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-popsdiner:HeartStopper"
            }
        },
        {
            id = 5,
            header = "• Torpedo Roll",
            txt = "Bun , Cooked Meat",
            params = {
                event = "qb-popsdiner:Torpedo"
            }
        },
        {
            id = 6,
            header = "• Murder Meal",
            txt = "The Heart Stopper, Fries and SoftDrink",
            params = {
                event = "qb-popsdiner:CreateMurderMeal"
            }
        },
        {
            id = 7,
            header = "Close",
            txt = "",
            params = {
                event = "nh-context:closeMenu"
            }
        },
    })
end)


RegisterNetEvent('nh-context:OrderMenu2', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Fridge |",
            txt = "",
        },
        {
            id = 1,
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-popsdiner:shop"
            }
        },
        {
            id = 2,
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-popsdiner:Storage2"
            }
        },
        {
            id = 3,
            header = "Close",
            txt = "",
            params = {
                event = "nh-context:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('nh-context:DrinkMenu2', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Drink Menu |",
            txt = "",
        },
        {
            id = 1,
            header = "• Soft Drink",
            txt = "Soda Syrup",
            params = {
                event = "qb-popsdiner:SoftDrink"
            }
        },
        {
            id = 2,
            header = "• Milkshake",
            txt = "Milkshake Formula",
            params = {
                event = "qb-popsdiner:mShake"
            }
        },
        {
            id = 3,
            header = "Close",
            txt = "",
            params = {
                event = "nh-context:closeMenu"
            }
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-popsdiner:bill")
AddEventHandler("qb-popsdiner:bill", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then
            return
        end
        TriggerServerEvent("qb-popsdiner:bill:player", bill[1].input, bill[2].input)
    end
end)



RegisterNetEvent("qb-popsdiner:shop")
AddEventHandler("qb-popsdiner:shop", function()


    TriggerServerEvent("inventory:server:OpenInventory", "shop", "popsdiner", Config.Items)


end)



