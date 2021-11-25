local QBCore = exports['qb-core']:GetCoreObject()
local currentHouseGarage = nil
local hasGarageKey = nil
local currentGarage = nil
local OutsideVehicles = {}
local PlayerData = {}
local PlayerGang = {}
local PlayerJob = {}
local zones = {}
local PlayerData = QBCore.Functions.GetPlayerData()
local inParking = false
local inGarageRange = false
local inGarage = false

-- 

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerGang = PlayerData.gang
    PlayerJob = PlayerData.job
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerGang = gang
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('qb-garages:client:setHouseGarage', function(house, hasKey)
    currentHouseGarage = house
    hasGarageKey = hasKey
end)

RegisterNetEvent('qb-garages:client:houseGarageConfig', function(garageConfig)
    HouseGarages = garageConfig
end)

RegisterNetEvent('qb-garages:client:addHouseGarage', function(house, garageInfo)
    HouseGarages[house] = garageInfo
end)

-- Functions

local DrawText3Ds = function(x, y, z, text)
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

local function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function MenuGarage()
    exports['qb-menu']:openMenu({
        {
            header = "Public Garage",
            isMenuHeader = true
        },
        {
            header = "My Vehicles",
            txt = "Vehicle List",
            params = {
                event = "qb-garages:client:VehicleList"
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

local function PDMenuGarage()
    exports['qb-menu']:openMenu({
        {
            header = "Public Garage",
            isMenuHeader = true
        },
        {
            header = "My Vehicles",
            txt = "Vehicle List",
            params = {
                event = "qb-garages:client:PDVehicleList"
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

local function GangMenuGarage()
    exports['qb-menu']:openMenu({
        {
            header = "Gang Garage",
            isMenuHeader = true
        },
        {
            header = "My Vehicles",
            txt = "Gang Vehicle List",
            params = {
                event = "qb-garages:client:GangVehicleList"
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

local function JobMenuGarage()
    exports['qb-menu']:openMenu({
        {
            header = "Job Garage",
            isMenuHeader = true
        },
        {
            header = "My Vehicles",
            txt = "Job Vehicle List",
            params = {
                event = "qb-garages:client:JobVehicleList"
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

local function MenuDepot()
    exports['qb-menu']:openMenu({
        {
            header = "Impound",
            isMenuHeader = true
        },
        {
            header = "Depot Vehicles",
            txt = "Depot List",
            params = {
                event = "qb-garages:client:DepotList"
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

local function MenuHouseGarage(house)
    exports['qb-menu']:openMenu({
        {
            header = "House Garage",
            isMenuHeader = true
        },
        {
            header = "My Vehicles",
            txt = "Vehicle List",
            params = {
                event = "qb-garages:client:HouseGarage",
                args = house
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

local function ClearMenu()
	TriggerEvent("qb-menu:closeMenu")
end

local function closeMenuFull()
    currentGarage = nil
    ClearMenu()
end

local function doCarDamage(currentVehicle, veh)
	smash = false
	damageOutside = false
	damageOutside2 = false
	local engine = veh.engine + 0.0
	local body = veh.body + 0.0
	if engine < 200.0 then
		engine = 200.0
    end

    if engine > 1000.0 then
        engine = 1000.0
    end

	if body < 150.0 then
		body = 150.0
	end
	if body < 900.0 then
		smash = true
	end

	if body < 800.0 then
		damageOutside = true
	end

	if body < 500.0 then
		damageOutside2 = true
	end

    Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)
	if smash then
		SmashVehicleWindow(currentVehicle, 0)
		SmashVehicleWindow(currentVehicle, 1)
		SmashVehicleWindow(currentVehicle, 2)
		SmashVehicleWindow(currentVehicle, 3)
		SmashVehicleWindow(currentVehicle, 4)
	end
	if damageOutside then
		SetVehicleDoorBroken(currentVehicle, 1, true)
		SetVehicleDoorBroken(currentVehicle, 6, true)
		SetVehicleDoorBroken(currentVehicle, 4, true)
	end
	if damageOutside2 then
		SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
	end
	if body < 1000 then
		SetVehicleBodyHealth(currentVehicle, 985.1)
	end
end

local function CheckPlayers(vehicle)
    for i = -1, 5,1 do
        seat = GetPedInVehicleSeat(vehicle,i)
        if seat ~= 0 then
            TaskLeaveVehicle(seat,vehicle,0)
            SetVehicleDoorsLocked(vehicle)
            Wait(1500)
            QBCore.Functions.DeleteVehicle(vehicle)
        end
   end
end

-- Events

RegisterNetEvent('qb-garages:client:takeOutDepot', function(vehicle)
    if OutsideVehicles and next(OutsideVehicles) then
        if OutsideVehicles[vehicle.plate] then
            local Engine = GetVehicleEngineHealth(OutsideVehicles[vehicle.plate])
            QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
                QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                    QBCore.Functions.SetVehicleProperties(veh, properties)
                    enginePercent = round(vehicle.engine / 10, 0)
                    bodyPercent = round(vehicle.body / 10, 0)
                    currentFuel = vehicle.fuel

                    if vehicle.plate then
                        DeleteVehicle(OutsideVehicles[vehicle.plate])
                        OutsideVehicles[vehicle.plate] = veh
                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                    end

                    SetVehicleNumberPlateText(veh, vehicle.plate)
                    SetEntityHeading(veh, Depots[currentGarage].takeVehicle.w)
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                    SetEntityAsMissionEntity(veh, true, true)
                    doCarDamage(veh, vehicle)
                    TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    closeMenuFull()
                    SetVehicleEngineOn(veh, true, true)
                end, vehicle.plate)
                TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
            end, Depots[currentGarage].spawnPoint, true)
            SetTimeout(250, function()
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
            end)
        else
            QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
                QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                    QBCore.Functions.SetVehicleProperties(veh, properties)
                    enginePercent = round(vehicle.engine / 10, 0)
                    bodyPercent = round(vehicle.body / 10, 0)
                    currentFuel = vehicle.fuel

                    if vehicle.plate then
                        OutsideVehicles[vehicle.plate] = veh
                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                    end

                    SetVehicleNumberPlateText(veh, vehicle.plate)
                    SetEntityHeading(veh, Depots[currentGarage].takeVehicle.w)
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                    SetEntityAsMissionEntity(veh, true, true)
                    doCarDamage(veh, vehicle)
                    TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    closeMenuFull()
                    SetVehicleEngineOn(veh, true, true)
                end, vehicle.plate)
                TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
            end, Depots[currentGarage].spawnPoint, true)
            SetTimeout(250, function()
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
            end)
        end
    else
        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                QBCore.Functions.SetVehicleProperties(veh, properties)
                enginePercent = round(vehicle.engine / 10, 0)
                bodyPercent = round(vehicle.body / 10, 0)
                currentFuel = vehicle.fuel

                if vehicle.plate then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, Depots[currentGarage].takeVehicle.w)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicle)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                closeMenuFull()
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
            TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
        end, Depots[currentGarage].spawnPoint, true)
        SetTimeout(250, function()
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
        end)
    end
end)

RegisterNetEvent("qb-garages:client:HouseGarage", function(house)
    QBCore.Functions.TriggerCallback("qb-garage:server:GetHouseVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify("You have no vehicles in your garage", "error", 5000)
        else
            local MenuHouseGarageOptions = {
                {
                    header = "Garage: "..HouseGarages[house].label,
                    isMenuHeader = true
                },
            }

            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = HouseGarages[house].label

                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garaged"
                elseif v.state == 2 then
                    v.state = "Impound"
                end

                MenuHouseGarageOptions[#MenuHouseGarageOptions+1] = {
                    header = vname.." ["..v.depotprice.."]",
                    txt = "Plate: "..v.plate.."<br>Fuel: "..currentFuel.." | Engine: "..enginePercent.." | Body: "..bodyPercent,
                    params = {
                        event = "qb-garages:client:TakeOutHouseGarage",
                        args = v
                    }
                }
            end

            MenuHouseGarageOptions[#MenuHouseGarageOptions+1] = {
                header = "Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuHouseGarageOptions)
        end
    end, house)
end)

RegisterNetEvent("qb-garages:client:DepotList", function()
    QBCore.Functions.TriggerCallback("qb-garage:server:GetDepotVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify("There are no vehicles in the Impound", "error", 5000)
        else
            local MenuDepotOptions = {
                {
                    header = "Depot: "..Depots[currentGarage].label,
                    isMenuHeader = true
                },
            }
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                vname = QBCore.Shared.Vehicles[v.vehicle].name

                if v.state == 0 then
                    v.state = "Impound"
                end

                MenuDepotOptions[#MenuDepotOptions+1] = {
                    header = vname.." ["..v.depotprice.."]",
                    txt = "Plate: "..v.plate.."<br>Fuel: "..currentFuel.." | Engine: "..enginePercent.." | Body: "..bodyPercent,
                    params = {
                        event = "qb-garages:client:TakeOutDepotVehicle",
                        args = v
                    }
                }
            end

            MenuDepotOptions[#MenuDepotOptions+1] = {
                header = "Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuDepotOptions)
        end
    end)
end)

RegisterNetEvent("qb-garages:client:VehicleList", function()
    QBCore.Functions.TriggerCallback("qb-garage:server:GetUserVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify("You have no vehicles in this garage", "error", 5000)
            inParking = false
        else
            local MenuPublicGarageOptions = {
                {
                    header = "Garage: "..Garages[currentGarage].label,
                    isMenuHeader = true
                },
            }
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = Garages[v.garage].label
                vname = QBCore.Shared.Vehicles[v.vehicle].name

                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garaged"
                elseif v.state == 2 then
                    v.state = "Impound"
                end

                MenuPublicGarageOptions[#MenuPublicGarageOptions+1] = {
                    header = vname.." ["..v.plate.."]",
                    txt = "State: "..v.state.." <br>Fuel: "..currentFuel.." | Engine: "..enginePercent.." | Body: "..bodyPercent,
                    params = {
                        event = "qb-garages:client:takeOutPublicGarage123",
                        args = v,
                    }
                }
            end

            MenuPublicGarageOptions[#MenuPublicGarageOptions+1] = {
                header = "Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuPublicGarageOptions)
        end
    end, currentGarage)
end)

RegisterNetEvent("qb-garages:client:PDVehicleList", function()
    QBCore.Functions.TriggerCallback("qb-garage:server:GetPDVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify("You have no vehicles in this garage", "error", 5000)
            inParking = false
        else
            local MenuPublicGarageOptions = {
                {
                    header = "Garage: "..Garages[currentGarage].label,
                    isMenuHeader = true
                },
            }
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = Garages[v.garage].label
                vname = QBCore.Shared.Vehicles[v.vehicle].name

                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garaged"
                elseif v.state == 2 then
                    v.state = "Impound"
                end

                MenuPublicGarageOptions[#MenuPublicGarageOptions+1] = {
                    header = vname.." ["..v.plate.."]",
                    txt = "State: "..v.state.." <br>Fuel: "..currentFuel.." | Engine: "..enginePercent.." | Body: "..bodyPercent,
                    params = {
                        event = "qb-garages:client:takeOutPublicGarage123",
                        args = v,
                    }
                }
            end

            MenuPublicGarageOptions[#MenuPublicGarageOptions+1] = {
                header = "Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuPublicGarageOptions)
        end
    end, currentGarage)
end)

RegisterNetEvent("qb-garages:client:GangVehicleList", function()
    QBCore.Functions.TriggerCallback("qb-garage:server:GetUserVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify("You have no vehicles in this garage", "error", 5000)
        else
            local MenuGangGarageOptions = {
                {
                    header = "Garage: "..GangGarages[currentGarage].label,
                    isMenuHeader = true
                },
            }
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = GangGarages[v.garage].label
                vname = QBCore.Shared.Vehicles[v.vehicle].name

                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garaged"
                elseif v.state == 2 then
                    v.state = "Impound"
                end

                MenuGangGarageOptions[#MenuGangGarageOptions+1] = {
                    header = vname.." ["..v.plate.."]",
                    txt = "State: "..v.state.."<br>Fuel: "..currentFuel.." | Engine: "..enginePercent.." | Body: "..bodyPercent,
                    params = {
                        event = "qb-garages:client:takeOutGangGarage",
                        args = v
                    }
                }
            end

            MenuGangGarageOptions[#MenuGangGarageOptions+1] = {
                header = "Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuGangGarageOptions)
        end
    end, currentGarage)
end)

RegisterNetEvent('qb-garages:client:takeOutmaybePublicGarage', function(vehicle)
    print("maybe just maybe")
    print(vehicle.plate)
    TriggerEvent('qb-garages:server:GetPubliceVehiclecoords', vehicle)
end)

RegisterNetEvent("qb-garages:client:JobVehicleList", function()
    QBCore.Functions.TriggerCallback("qb-garage:server:GetUserVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify("You have no vehicles in this garage", "error", 5000)
        else
            local MenuJobGarageOptions = {
                {
                    header = "Garage: "..JobGarages[currentGarage].label,
                    isMenuHeader = true
                },
            }
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = JobGarages[v.garage].label
                vname = QBCore.Shared.Vehicles[v.vehicle].name

                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garaged"
                elseif v.state == 2 then
                    v.state = "Impound"
                end

                MenuJobGarageOptions[#MenuJobGarageOptions+1] = {
                    header = vname.." ["..v.plate.."]",
                    txt = "State: "..v.state.."<br>Fuel: "..currentFuel.." | Engine: "..enginePercent.." | Body: "..bodyPercent,
                    params = {
                        event = "qb-garages:client:takeOutJobGarage",
                        args = v
                    }
                }
            end

            MenuJobGarageOptions[#MenuJobGarageOptions+1] = {
                header = "Close",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuJobGarageOptions)
        end
    end, currentGarage)
end)

RegisterNetEvent('qb-garages:client:takeOutPublicGarage123', function(vehicle)
    print("we made it this far")
    local coordsx = vehicle.coordsx
    local coordsy = vehicle.coordsy
    local coordsz = vehicle.coordsz
    local heading = vehicle.heading
    print(coordsx)
    print(coordsy)
    print(coordsz)
    print(heading)

    local vehiclespawncoords = vector4(coordsx, coordsy, coordsz, heading)
    print(vehiclespawncoords)

    if vehicle.state == "Garaged" then
            enginePercent = round(vehicle.engine / 10, 1)
            bodyPercent = round(vehicle.body / 10, 1)
            currentFuel = vehicle.fuel 
    

        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                QBCore.Functions.SetVehicleProperties(veh, properties)
                enginePercent = round(vehicle.engine / 10, 1)
                bodyPercent = round(vehicle.body / 10, 1)
                currentFuel = vehicle.fuel

                if vehicle.plate then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, heading)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicle)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                closeMenuFull()
                inParking = false
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, false)
            end, vehicle.plate)
        end, vehiclespawncoords , true)

    elseif vehicle.state == "Out" then
        QBCore.Functions.Notify("Is your vehicle in the Depot", "error", 2500)
    elseif vehicle.state == "Impound" then
        QBCore.Functions.Notify("This vehicle was impounded by the Police", "error", 4000)
    end
end)

RegisterNetEvent('qb-garages:client:takeOutGangGarage', function(vehicle)
    if vehicle.state == "Garaged" then
        enginePercent = round(vehicle.engine / 10, 1)
        bodyPercent = round(vehicle.body / 10, 1)
        currentFuel = vehicle.fuel
        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)

                if vehicle.plate then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                QBCore.Functions.SetVehicleProperties(veh, properties)
                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, GangGarages[currentGarage].spawnPoint.w)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                doCarDamage(veh, vehicle)
                SetEntityAsMissionEntity(veh, true, true)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                closeMenuFull()
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)

        end, GangGarages[currentGarage].spawnPoint, true)
    elseif vehicle.state == "Out" then
        QBCore.Functions.Notify("Is your vehicle in the Depot", "error", 2500)
    elseif vehicle.state == "Impound" then
        QBCore.Functions.Notify("This vehicle was impounded by the Police", "error", 4000)
    end
end)

RegisterNetEvent('qb-garages:client:takeOutJobGarage', function(vehicle)
    if vehicle.state == "Garaged" then
        enginePercent = round(vehicle.engine / 10, 1)
        bodyPercent = round(vehicle.body / 10, 1)
        currentFuel = vehicle.fuel
        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                if vehicle.plate then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end
                QBCore.Functions.SetVehicleProperties(veh, properties)
                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, JobGarages[currentGarage].spawnPoint.w)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                doCarDamage(veh, vehicle)
                SetEntityAsMissionEntity(veh, true, true)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                closeMenuFull()
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
        end, JobGarages[currentGarage].spawnPoint, true)
    elseif vehicle.state == "Out" then
        QBCore.Functions.Notify("Is your vehicle in the Depot", "error", 2500)
    elseif vehicle.state == "Impound" then
        QBCore.Functions.Notify("This vehicle was impounded by the Police", "error", 4000)
    end
end)

RegisterNetEvent('qb-garages:client:TakeOutDepotVehicle', function(vehicle)
    if vehicle.state == "Impound" then
        TriggerServerEvent("qb-garage:server:PayDepotPrice", vehicle)
        Wait(1000)
    end
end)

RegisterNetEvent('qb-garages:client:TakeOutHouseGarage', function(vehicle)
    if vehicle.state == "Garaged" then
        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                QBCore.Functions.SetVehicleProperties(veh, properties)
                enginePercent = round(vehicle.engine / 10, 1)
                bodyPercent = round(vehicle.body / 10, 1)
                currentFuel = vehicle.fuel

                if vehicle.plate then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, HouseGarages[currentHouseGarage].takeVehicle.h)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicle)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                closeMenuFull()
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
        end, HouseGarages[currentHouseGarage].takeVehicle, true)
    end
end)

-- Threads
--take out car
--locals add poly zone and set to false

-- local inCustom = false

-- local custom = PolyZone:Create({
--     vector2(-753.03454589844, -241.64151000977),
--     vector2(-789.14318847656, -256.58615112305),
--     vector2(-819.00756835938, -207.26348876953),
--     vector2(-787.56329345703, -188.1063079834)
--   }, {
--     name="custom",
--     minZ = 30.110122680664,
--     maxZ = 40.413436889648
-- })

-- copy function for each garage

-- custom:onPlayerInOut(function(isPointInside)
--     if isPointInside then
--         ClosestShop = 'custom'
--         inCustom = true


-- Zones
-- park car
-- copy function for each parking
local MotelParking = PolyZone:Create({
  vector2(265.86239624023, -343.80505371094),
  vector2(295.11672973633, -354.71923828125),
  vector2(304.46438598633, -329.01119995117),
  vector2(267.82836914063, -315.83883666992),
  vector2(260.58352661133, -335.17050170898),
  vector2(267.65142822266, -337.8298034668)
 }, {
  name="Motel Parking",
 -- minZ = 45.01985168457,
 -- maxZ = 47.357849121094
})

local CaeserParking24 = PolyZone:Create({
    vector2(76.296051025391, 7.5785202980042),
    vector2(81.965225219727, 23.176607131958),
    vector2(55.523742675781, 33.175758361816),
    vector2(49.849540710449, 16.828224182129)
  }, {
    name="Caeser Parking 24",
  --  minZ = 68.70344543457,
   -- maxZ = 70.453727722168
})

local MissionRowOutsideParking = PolyZone:Create({
    vector2(433.34548950195, -1030.1658935547),
    vector2(452.96817016602, -1027.7421875),
    vector2(455.25714111328, -1013.4075927734),
    vector2(450.0446472168, -1011.2117919922),
    vector2(433.99407958984, -1011.4733886719),
    vector2(428.14852905273, -1014.2004394531),
    vector2(428.47473144531, -1030.6109619141)
  }, {
    name="MissionRowOutsideParking",
  --  minZ = 28.473108291626,
   -- maxZ = 30.974321365356
})

local Lagunus = PolyZone:Create({
    vector2(358.69171142578, 302.30133056641),
    vector2(349.74206542969, 271.67446899414),
    vector2(387.77053833008, 257.84002685547),
    vector2(399.72442626953, 290.71618652344)
  }, {
    name="Lagunus",
   -- minZ = 103.00985717773,
  --  maxZ = 105.89134216309
})

local MissionRowInside = PolyZone:Create({
    vector2(448.24655151367, -998.49005126953),
    vector2(423.15756225586, -999.19409179688),
    vector2(423.26751708984, -974.35900878906),
    vector2(447.93667602539, -972.98748779297)
  }, {
    name="MissionRowInside",
  --  minZ = 25.69997215271,
  --  maxZ = 30.699991226196
})

local AirportParking = PolyZone:Create({
    vector2(-779.84381103516, -2023.8579101563),
    vector2(-770.45916748047, -2016.8271484375),
    vector2(-762.57049560547, -2008.1785888672),
    vector2(-757.87561035156, -2001.6168212891),
    vector2(-753.97149658203, -1994.4556884766),
    vector2(-750.88555908203, -1983.3775634766),
    vector2(-749.30743408203, -1974.7628173828),
    vector2(-746.96173095703, -1966.8524169922),
    vector2(-740.97198486328, -1962.7532958984),
    vector2(-732.42370605469, -1962.7298583984),
    vector2(-726.94287109375, -1965.6750488281),
    vector2(-724.92614746094, -1969.5866699219),
    vector2(-715.30981445313, -2012.7785644531),
    vector2(-710.77490234375, -2032.1837158203),
    vector2(-704.81512451172, -2044.3669433594),
    vector2(-701.91320800781, -2045.7495117188),
    vector2(-687.43481445313, -2040.2180175781),
    vector2(-671.80059814453, -2044.1634521484),
    vector2(-661.50842285156, -2048.2038574219),
    vector2(-653.45355224609, -2048.1752929688),
    vector2(-647.3798828125, -2045.3465576172),
    vector2(-632.34478759766, -2030.5638427734),
    vector2(-616.62982177734, -2046.2805175781),
    vector2(-652.86743164063, -2081.5656738281),
    vector2(-658.14196777344, -2083.1342773438),
    vector2(-665.93695068359, -2082.3642578125),
    vector2(-672.80401611328, -2082.0881347656),
    vector2(-679.87829589844, -2083.2036132813),
    vector2(-687.04577636719, -2085.4150390625),
    vector2(-695.01031494141, -2087.6420898438),
    vector2(-702.75323486328, -2088.0910644531),
    vector2(-708.36560058594, -2085.9338378906),
    vector2(-714.02062988281, -2087.7546386719),
    vector2(-731.46368408203, -2074.3833007813),
    vector2(-743.12127685547, -2069.45703125),
    vector2(-758.56195068359, -2065.9916992188),
    vector2(-787.31781005859, -2037.5233154297)
  }, {
    name="Airport Parking",
  --  minZ = 8.8676834106445,
  --  maxZ = 11.0418672561646
})

local SanAndreasParking = PolyZone:Create({
    vector2(-359.55313110352, -824.53228759766),
    vector2(-361.12268066406, -825.14129638672),
    vector2(-318.40744018555, -829.68267822266),
    vector2(-291.55633544922, -833.69195556641),
    vector2(-279.06967163086, -798.32598876953),
    vector2(-274.61849975586, -785.65002441406),
    vector2(-276.64810180664, -782.01818847656),
    vector2(-274.60778808594, -778.87432861328),
    vector2(-264.87408447266, -752.43908691406),
    vector2(-268.80847167969, -751.08148193359),
    vector2(-254.86366271973, -711.42327880859),
    vector2(-267.35974121094, -707.05334472656),
    vector2(-269.34512329102, -701.30694580078),
    vector2(-286.84979248047, -694.07055664063),
    vector2(-304.26467895508, -737.61352539063),
    vector2(-309.97897338867, -735.91693115234),
    vector2(-304.20037841797, -719.55688476563),
    vector2(-337.97915649414, -707.45123291016),
    vector2(-356.50448608398, -707.30010986328),
    vector2(-356.31127929688, -717.79876708984),
    vector2(-361.03131103516, -718.01782226563),
    vector2(-360.89041137695, -726.85260009766),
    vector2(-363.35586547852, -730.53515625),
    vector2(-363.35897827148, -760.61651611328),
    vector2(-363.53686523438, -794.27947998047),
    vector2(-360.95697021484, -794.16094970703),
    vector2(-361.07516479492, -807.24420166016),
    vector2(-361.04382324219, -816.68121337891),
    vector2(-360.89526367188, -823.49914550781),
    vector2(-360.80990600586, -825.33227539063)
  }, {
    name="San Andreas Parking",
 --   minZ = 31.462802886963,
  --  maxZ = 34.276351928711
})

local BeachParking = PolyZone:Create({
    vector2(-1187.5522460938, -1513.935546875),
    vector2(-1165.8736572266, -1497.5943603516),
    vector2(-1166.3350830078, -1489.0583496094),
    vector2(-1184.4129638672, -1461.095703125),
    vector2(-1211.2407226563, -1480.8394775391),
    vector2(-1194.5378417969, -1515.4354248047),
    vector2(-1191.3916015625, -1515.6772460938)
  }, {
    name="Beach Parking",
  --  minZ = 4.3358726501465,
  --  maxZ = 6.3443021774292
})

local pillbox = PolyZone:Create({
    vector2(198.61552429199, -806.37121582031),
    vector2(228.87341308594, -722.15283203125),
    vector2(273.9963684082, -739.96246337891),
    vector2(271.06604003906, -748.24377441406),
    vector2(271.99118041992, -748.66528320313),
    vector2(258.39205932617, -786.82366943359),
    vector2(252.90176391602, -784.82293701172),
    vector2(240.26406860352, -821.53881835938)
  }, {
    name="pillbox",
  --  minZ = 30.137311935425,
  --  maxZ = 34.964107513428
})

local SpanishAveParking = PolyZone:Create({
    vector2(-1208.5736083984, -726.71478271484),
    vector2(-1190.3421630859, -714.76916503906),
    vector2(-1180.4741210938, -725.60675048828),
    vector2(-1172.6975097656, -719.47229003906),
    vector2(-1156.5445556641, -739.68310546875),
    vector2(-1142.3211669922, -729.28790283203),
    vector2(-1114.7531738281, -761.04400634766),
    vector2(-1134.7858886719, -778.76770019531),
    vector2(-1157.4504394531, -749.97473144531),
    vector2(-1168.1322021484, -757.69219970703),
    vector2(-1182.0783691406, -754.00274658203)
  }, {
    name="Spanish Ave Parking",
  --  minZ = 17.659103393555,
  --  maxZ = 31.544996261597
})

local CS24P = PolyZone:Create({
    vector2(-480.82702636719, -820.30169677734),
    vector2(-439.94390869141, -821.59979248047),
    vector2(-440.41958618164, -794.41271972656),
    vector2(-444.81353759766, -721.79382324219),
    vector2(-474.9267578125, -722.80798339844),
    vector2(-475.89868164063, -732.02062988281),
    vector2(-480.34576416016, -733.81866455078)
  }, {
    name="CS24P ",
  --  minZ = 30.414772033691,
  --  maxZ = 32.625413894653
})

local TheMotorHotelParking = PolyZone:Create({
    vector2(1095.6680908203, 2666.7048339844),
    vector2(1095.8447265625, 2659.4814453125),
    vector2(1107.7730712891, 2659.7583007813),
    vector2(1108.5886230469, 2651.8427734375),
    vector2(1114.2390136719, 2651.6691894531),
    vector2(1114.0950927734, 2644.3432617188),
    vector2(1139.5988769531, 2644.6552734375),
    vector2(1140.1472167969, 2666.5729980469)
  }, {
    name="The Motor Hotel Parking",
  --  minZ = 37.996173858643,
  --  maxZ = 39.161014556885
})

local PaletoPDPublicParking = PolyZone:Create({
    vector2(-431.17498779297, 6030.2026367188),
    vector2(-441.40447998047, 6022.9526367188),
    vector2(-446.55432128906, 6027.5112304688),
    vector2(-443.86236572266, 6035.7875976563),
    vector2(-457.08862304688, 6050.7236328125),
    vector2(-454.56433105469, 6054.203125),
    vector2(-445.00036621094, 6059.54296875)
  }, {
    name="PaletoPDPublicParking",
  --  minZ = 31.340490341187,
  --  maxZ = 33.490110397339
})

local PaletoPDCopParking = PolyZone:Create({
    vector2(-450.41549682617, 6041.3818359375),
    vector2(-460.89514160156, 6051.8618164063),
    vector2(-488.197265625, 6024.3623046875),
    vector2(-448.86779785156, 5987.6567382813),
    vector2(-442.69967651367, 5993.7602539063),
    vector2(-463.31719970703, 6015.2109375),
    vector2(-470.01446533203, 6022.2094726563)
  }, {
    name="PaletoPDCopParking",
  --  minZ = 31.340469360352,
  --  maxZ = 33.345071792603
})

local BellFarmsParking = PolyZone:Create({
    vector2(85.549736022949, 6396.8779296875),
    vector2(67.171463012695, 6414.4780273438),
    vector2(49.899848937988, 6398.572265625),
    vector2(33.183372497559, 6381.7021484375),
    vector2(26.060064315796, 6374.99609375),
    vector2(3.059506893158, 6350.71875),
    vector2(-3.5612578392029, 6344.919921875),
    vector2(-8.8073139190674, 6338.8408203125),
    vector2(-23.786981582642, 6324.26171875),
    vector2(-19.55489730835, 6317.3120117188),
    vector2(3.7789566516876, 6320.9350585938),
    vector2(6.5865225791931, 6314.708984375),
    vector2(17.868654251099, 6321.12890625),
    vector2(28.761400222778, 6327.0932617188),
    vector2(40.418071746826, 6333.8129882813),
    vector2(52.195190429688, 6340.03515625),
    vector2(68.758804321289, 6355.40234375),
    vector2(83.483337402344, 6362.9018554688),
    vector2(94.082153320313, 6367.9702148438),
    vector2(104.65406799316, 6373.0029296875),
    vector2(107.93032073975, 6375.2509765625),
    vector2(103.84215545654, 6382.2041015625)
  }, {
    name="BellFarmsParking",
  --  minZ = 31.215185165405,
  --  maxZ = 33.405820846558
})

local MissionRowOutsideParking1 = PolyZone:Create({
    vector2(433.62310791016, -1030.1923828125),
    vector2(433.16839599609, -1023.9428100586),
    vector2(451.28527832031, -1022.2470703125),
    vector2(451.87698364258, -1027.8736572266)
  }, {
    name="MissionRowOutsideParking 1",
  --  minZ = 28.448457717896,
  --  maxZ = 30.884798049927
})

local MotelParking1 = PolyZone:Create({
    vector2(262.42095947266, -332.9377746582),
    vector2(268.38781738281, -335.5866394043),
    vector2(274.73587036133, -318.29260253906),
    vector2(268.16625976563, -315.79858398438)
  }, {
    name="MotelParking1",
  --  minZ = 44.919864654541,
  --  maxZ = 47.019943237305
})

local MotelParking2 = PolyZone:Create({
    vector2(280.94256591797, -321.03280639648),
    vector2(292.74417114258, -325.11834716797),
    vector2(285.54544067383, -345.14068603516),
    vector2(273.5719909668, -340.91931152344)
  }, {
    name="Motel parking 2",
  --  minZ = 44.919834136963,
   -- maxZ = 46.924541473389
})

local MotelParking3 = PolyZone:Create({
    vector2(295.70269775391, -352.46307373047),
    vector2(304.40347290039, -328.98559570313),
    vector2(297.89190673828, -327.04510498047),
    vector2(289.84713745117, -350.40686035156)
  }, {
    name="Motel Parking 3",
   -- minZ = 44.919952392578,
   -- maxZ = 46.019950866699
})

local CeasersParking1 = PolyZone:Create({
    vector2(51.923835754395, 17.648403167725),
    vector2(64.299026489258, 13.025731086731),
    vector2(66.608177185059, 18.108009338379),
    vector2(54.031169891357, 23.578735351563)
  }, {
    name="Caser parking 24 1",
    --minZ = 69.074020385742,
    --maxZ = 71.907264709473
})

local languaes1 = PolyZone:Create({
    vector2(393.95904541016, 292.26312255859),
    vector2(392.58404541016, 288.00936889648),
    vector2(372.63235473633, 292.64321899414),
    vector2(373.97186279297, 297.99127197266)
  }, {
    name="lagunes 1",
    --minZ = 102.97693634033,
    --maxZ = 103.32189178467
})

local languaes2 = PolyZone:Create({
    vector2(369.67980957031, 287.953125),
    vector2(367.88192749023, 282.62493896484),
    vector2(379.58187866211, 278.37142944336),
    vector2(381.98361206055, 283.47427368164)
  }, {
    name="languse 2",
    --minZ = 103.06531524658,
    --maxZ = 103.31354522705
})

local languaes3 = PolyZone:Create({
    vector2(391.91040039063, 286.9775390625),
    vector2(397.43206787109, 285.20465087891),
    vector2(390.55581665039, 266.31872558594),
    vector2(385.40628051758, 268.22796630859)
  }, {
    name="languses 3",
    --minZ = 102.95412445068,
    --maxZ = 103.00989532471
})

local languaes4 = PolyZone:Create({
    vector2(382.38540649414, 266.12814331055),
    vector2(380.07745361328, 260.72305297852),
    vector2(356.93521118164, 269.3737487793),
    vector2(356.38046264648, 269.92050170898),
    vector2(358.43786621094, 274.86444091797)
  }, {
    name="languses 4",
    --minZ = 103.00714111328,
   -- maxZ = 103.15104675293
})

local languaes5 = PolyZone:Create({
  vector2(365.26013183594, 275.45550537109),
  vector2(377.17907714844, 270.77206420898),
  vector2(379.16525268555, 276.6598815918),
  vector2(366.86627197266, 280.96417236328)
    }, {
  name="languase 5",
  --minZ = 103.04013061523,
  --maxZ = 105.26792144775
})

local languaes6 = PolyZone:Create({
    vector2(358.56546020508, 279.84838867188),
    vector2(353.384765625, 281.7444152832),
    vector2(359.16525268555, 296.20770263672),
    vector2(363.64474487305, 294.73867797852)
  }, {
    name="languese 6",
    --minZ = 103.31546783447,
    --maxZ = 105.55397796631
})

local MissionRowInside1 = PolyZone:Create({
    vector2(448.06500244141, -984.53723144531),
    vector2(448.03210449219, -998.86090087891),
    vector2(435.32705688477, -998.58282470703),
    vector2(434.98876953125, -984.1064453125)
  }, {
    name="missionrowinside 1",
    --minZ = 25.699981689453,
    --maxZ = 30.699991226196
})

local MissionRowInside2 = PolyZone:Create({
    vector2(428.0012512207, -998.74536132813),
    vector2(428.18530273438, -974.37200927734),
    vector2(423.15548706055, -974.46954345703),
    vector2(423.40225219727, -999.56695556641)
  }, {
    name="MissionRowInside 2",
    --minZ = 25.699987411499,
    --maxZ = 30.700012207031
})

local AirportParking1 = PolyZone:Create({
    vector2(-779.68084716797, -2023.5711669922),
    vector2(-775.96789550781, -2028.8706054688),
    vector2(-766.50665283203, -2021.6611328125),
    vector2(-758.04284667969, -2012.4245605469),
    vector2(-750.80627441406, -2002.4533691406),
    vector2(-746.89666748047, -1992.7200927734),
    vector2(-744.63177490234, -1982.7261962891),
    vector2(-741.61315917969, -1967.9842529297),
    vector2(-747.96643066406, -1968.1911621094),
    vector2(-750.20318603516, -1976.4107666016),
    vector2(-751.62707519531, -1983.0920410156),
    vector2(-753.96356201172, -1992.5489501953),
    vector2(-756.56048583984, -1998.4914550781),
    vector2(-760.80413818359, -2004.8679199219),
    vector2(-766.94763183594, -2011.9185791016),
    vector2(-773.5625, -2019.0469970703)
  }, {
    name="Airport Parking 1",
    --minZ = 8.8681621551514,
    --maxZ = 11.0040006637573
})

local AirportParking2 = PolyZone:Create({
    vector2(-779.25805664063, -2036.6064453125),
    vector2(-783.34967041016, -2040.51953125),
    vector2(-758.50817871094, -2065.49609375),
    vector2(-753.82238769531, -2061.7841796875)
  }, {
    name="Airport Parking 2",
    --minZ = 8.874119758606,
    --maxZ = 10.9170370101929
})

local AirportParking3 = PolyZone:Create({
    vector2(-745.99261474609, -2067.6022949219),
    vector2(-743.21252441406, -2061.5629882813),
    vector2(-733.11224365234, -2065.6479492188),
    vector2(-722.24340820313, -2071.8979492188),
    vector2(-710.52087402344, -2081.193359375),
    vector2(-704.18145751953, -2081.0375976563),
    vector2(-700.64465332031, -2082.2570800781),
    vector2(-695.72143554688, -2081.7563476563),
    vector2(-688.44812011719, -2079.3786621094),
    vector2(-681.93621826172, -2077.4091796875),
    vector2(-674.33941650391, -2075.9282226563),
    vector2(-667.82037353516, -2076.2856445313),
    vector2(-661.06970214844, -2076.6105957031),
    vector2(-657.42407226563, -2076.5646972656),
    vector2(-649.95684814453, -2070.9885253906),
    vector2(-643.4921875, -2064.5202636719),
    vector2(-620.96850585938, -2042.1281738281),
    vector2(-616.22869873047, -2047.2292480469),
    vector2(-648.65710449219, -2078.8449707031),
    vector2(-656.27545166016, -2082.4555664063),
    vector2(-662.19506835938, -2082.95703125),
    vector2(-672.18853759766, -2082.1606445313),
    vector2(-680.22503662109, -2083.4392089844),
    vector2(-686.90899658203, -2085.2399902344),
    vector2(-694.48767089844, -2088.0646972656),
    vector2(-702.73175048828, -2088.6342773438),
    vector2(-713.38244628906, -2087.3549804688)
  }, {
    name="Airport Parking 3",
    --minZ = 8.8677034378052,
    --maxZ = 10.9908027648926
})

local AirportParking4 = PolyZone:Create({
    vector2(-746.13098144531, -2003.6955566406),
    vector2(-732.23223876953, -2003.5301513672),
    vector2(-732.01770019531, -2036.1198730469),
    vector2(-709.08331298828, -2057.9133300781),
    vector2(-683.72991943359, -2056.0737304688),
    vector2(-682.4111328125, -2069.8452148438),
    vector2(-707.15521240234, -2072.8217773438),
    vector2(-719.71447753906, -2067.2241210938),
    vector2(-742.34649658203, -2045.8615722656),
    vector2(-746.02685546875, -2035.2707519531)
  }, {
    name="Airport Parking 4",
    --minZ = 8.8686008453369,
   -- maxZ = 10.9227914810181
})

local AirportParking5 = PolyZone:Create({
    vector2(-733.05694580078, -1967.2381591797),
    vector2(-726.10534667969, -1965.8542480469),
    vector2(-719.76971435547, -1993.7819824219),
    vector2(-713.93481445313, -2020.3634033203),
    vector2(-710.46533203125, -2033.7465820313),
    vector2(-704.20709228516, -2046.5823974609),
    vector2(-687.19555664063, -2040.9039306641),
    vector2(-685.20202636719, -2046.3798828125),
    vector2(-702.19152832031, -2052.9702148438),
    vector2(-710.10284423828, -2048.9755859375),
    vector2(-713.80773925781, -2042.9691162109),
    vector2(-716.97430419922, -2035.1428222656)
  }, {
    name="Airport Parking 5",
   -- minZ = 8.8681640625,
    --maxZ = 11.0415096282959
})

local SanAndreasParking2 = PolyZone:Create({
    vector2(-354.00408935547, -777.83227539063),
    vector2(-354.03051757813, -730.65600585938),
    vector2(-360.28100585938, -730.62664794922),
    vector2(-360.33676147461, -777.75677490234)
  }, {
    name="San Andreas Parking 2",
   -- minZ = 33.967697143555,
    --maxZ = 35.96854019165
})

local SanAndreasParking3 = PolyZone:Create({
    vector2(-345.40045166016, -769.52075195313),
    vector2(-345.73028564453, -747.52008056641),
    vector2(-325.36224365234, -747.412109375),
    vector2(-287.22903442383, -761.39562988281),
    vector2(-289.10189819336, -767.78564453125),
    vector2(-325.71252441406, -754.83764648438),
    vector2(-338.0185546875, -754.23864746094),
    vector2(-338.34957885742, -769.18603515625)
  }, {
    name="San Andreas Parking 3",
  --  minZ = 33.968280792236,
  --  maxZ = 35.971035003662
})

local SanAndreasParking4 = PolyZone:Create({
    vector2(-315.75881958008, -765.50512695313),
    vector2(-292.10989379883, -774.14251708984),
    vector2(-294.45983886719, -781.40075683594),
    vector2(-318.28189086914, -772.70770263672)
  }, {
    name="San Andreas Parking 4",
  --  minZ = 33.964511871338,
  --  maxZ = 35.964538574219
})

local SanAndreasParking5 = PolyZone:Create({
    vector2(-305.38140869141, -744.98840332031),
    vector2(-276.57083129883, -755.42877197266),
    vector2(-274.8854675293, -749.93029785156),
    vector2(-303.19430541992, -739.57104492188)
  }, {
    name="San Andreas Parking 5",
  --  minZ = 33.96459197998,
  --  maxZ = 35.964645385742
})

local SanAndreasParking6 = PolyZone:Create({
    vector2(-275.115234375, -758.67504882813),
    vector2(-281.17590332031, -775.49694824219),
    vector2(-275.29415893555, -777.36260986328),
    vector2(-269.2223815918, -760.91778564453)
  }, {
    name="San Andreas Parking 6",
  --  minZ = 33.964488983154,
  --  maxZ = 35.964530944824
})

local SanAndreasParking7 = PolyZone:Create({
    vector2(-353.90487670898, -777.76983642578),
    vector2(-354.07138061523, -730.52984619141),
    vector2(-360.00628662109, -730.56695556641),
    vector2(-360.23568725586, -777.75354003906)
  }, {
    name="San Andreas Parking 7",
    --minZ = 38.779792785645,
    --maxZ = 38.782707214355
})

local SanAndreasParking8 = PolyZone:Create({
    vector2(-345.20379638672, -769.36279296875),
    vector2(-345.41244506836, -748.06085205078),
    vector2(-325.13809204102, -747.63000488281),
    vector2(-287.15679931641, -761.52355957031),
    vector2(-289.38424682617, -767.72552490234),
    vector2(-327.45330810547, -754.068359375),
    vector2(-338.63436889648, -754.01330566406),
    vector2(-338.55584716797, -769.23370361328)
  }, {
    name="San Andreas Parking 8",
    --minZ = 38.779781341553,
    --maxZ = 38.780612945557
})

local SanAndreasParking9 = PolyZone:Create({
    vector2(-312.41940307617, -742.64178466797),
    vector2(-276.65084838867, -755.27215576172),
    vector2(-274.73025512695, -749.88629150391),
    vector2(-310.20748901367, -737.06243896484)
  }, {
    name="San Andreas Parking 9",
    --minZ = 38.779300689697,
    --maxZ = 38.780578613281
})

local SanAndreasParking10 = PolyZone:Create({
    vector2(-269.18032836914, -760.65399169922),
    vector2(-275.14068603516, -758.60949707031),
    vector2(-281.24548339844, -775.56091308594),
    vector2(-275.54064941406, -777.59967041016)
  }, {
    name="San Andreas Parking 10",
    --minZ = 38.779804229736,
    --maxZ = 38.779811859131
})

local SanAndreasParking11 = PolyZone:Create({
    vector2(-292.38845825195, -775.20782470703),
    vector2(-315.9501953125, -766.69512939453),
    vector2(-318.09088134766, -772.80267333984),
    vector2(-294.43209838867, -781.42010498047)
  }, {
    name="San Andreas Parking 11",
    --minZ = 38.779777526855,
    --maxZ = 38.779788970947
})

local SanAndreasParking12 = PolyZone:Create({
    vector2(-360.2073059082, -777.79125976563),
    vector2(-360.00988769531, -730.57165527344),
    vector2(-352.73104858398, -730.41986083984),
    vector2(-352.5901184082, -777.55364990234)
  }, {
    name="San Andreas Parking 12",
    --minZ = 43.608016967773,
    --maxZ = 43.608283996582
})

local SanAndreasParking13 = PolyZone:Create({
    vector2(-345.2239074707, -769.20172119141),
    vector2(-345.30990600586, -748.10357666016),
    vector2(-325.24655151367, -747.68499755859),
    vector2(-287.28863525391, -761.59063720703),
    vector2(-289.44326782227, -767.65478515625),
    vector2(-327.46643066406, -753.94830322266),
    vector2(-338.67810058594, -754.13153076172),
    vector2(-338.60293579102, -769.20275878906)
  }, {
    name="San Andreas Parking 13",
    --minZ = 43.605667114258,
    --maxZ = 43.606025695801
})

local SanAndreasParking14 = PolyZone:Create({
    vector2(-312.42095947266, -742.57775878906),
    vector2(-276.77972412109, -755.28161621094),
    vector2(-274.85205078125, -749.94421386719),
    vector2(-310.2522277832, -736.94409179688)
  }, {
    name="San Andreas Parking 14",
    --minZ = 43.605640411377,
    --maxZ = 43.605690002441
})

local SanAndreasParking15 = PolyZone:Create({
    vector2(-275.08963012695, -758.66101074219),
    vector2(-281.13671875, -775.51623535156),
    vector2(-275.42486572266, -777.52197265625),
    vector2(-269.13290405273, -760.81677246094)
  }, {
    name="San Andreas Parking 15",
    --minZ = 43.605079650879,
    --maxZ = 43.60604095459
})

local SanAndreasParking16 = PolyZone:Create({
    vector2(-292.50006103516, -775.15179443359),
    vector2(-316.01083374023, -766.76318359375),
    vector2(-318.33776855469, -772.72564697266),
    vector2(-294.68041992188, -781.29772949219)
  }, {
    name="San Andreas Parking 16",
    --minZ = 43.605045318604,
    --maxZ = 43.606037139893
})

local SanAndreasParking17 = PolyZone:Create({
    vector2(-353.92462158203, -777.61627197266),
    vector2(-360.21536254883, -777.6494140625),
    vector2(-360.01110839844, -730.59484863281),
    vector2(-354.0807800293, -730.58416748047)
  }, {
    name="San Andreas Parking 17",
    --minZ = 48.424243927002,
    --maxZ = 48.424285888672
})

local SanAndreasParking18 = PolyZone:Create({
    vector2(-345.24502563477, -769.37158203125),
    vector2(-345.23910522461, -748.04235839844),
    vector2(-325.19827270508, -747.79736328125),
    vector2(-287.24639892578, -761.53802490234),
    vector2(-289.42288208008, -767.61785888672),
    vector2(-327.33575439453, -753.99768066406),
    vector2(-338.66412353516, -754.10345458984),
    vector2(-338.71798706055, -769.25006103516)
  }, {
    name="San Andreas Parking 18",
    --minZ = 48.42419052124,
    --maxZ = 48.424308776855
})

local SanAndreasParking19 = PolyZone:Create({
    vector2(-312.35113525391, -742.45416259766),
    vector2(-276.66949462891, -755.275390625),
    vector2(-274.74807739258, -749.87341308594),
    vector2(-310.25299072266, -736.94616699219)
  }, {
    name="San Andreas Parking 19",
    --minZ = 48.424228668213,
    --maxZ = 48.424243927002
})

local SanAndreasParking20 = PolyZone:Create({
    vector2(-269.15176391602, -760.81774902344),
    vector2(-275.07067871094, -758.71789550781),
    vector2(-281.12643432617, -775.61676025391),
    vector2(-275.26434326172, -777.37579345703)
  }, {
    name="San Andreas Parking 20",
    --minZ = 48.424304962158,
    --maxZ = 48.424331665039
})

local SanAndreasParking21 = PolyZone:Create({
    vector2(-292.40045166016, -774.98699951172),
    vector2(-294.56097412109, -781.37286376953),
    vector2(-318.39920043945, -772.63641357422),
    vector2(-315.98187255859, -766.63403320313)
  }, {
    name="San Andreas Parking 21",
    --minZ = 48.424282073975,
    --maxZ = 48.424327850342
})

local SanAndreasParking22 = PolyZone:Create({
    vector2(-290.56228637695, -776.07501220703),
    vector2(-316.98645019531, -766.55969238281),
    vector2(-318.74179077148, -772.22113037109),
    vector2(-318.29867553711, -772.63568115234),
    vector2(-307.04525756836, -776.73645019531),
    vector2(-292.37503051758, -782.22772216797)
  }, {
    name="San Andreas Parking 22",
    --minZ = 53.245643615723,
    --maxZ = 53.246578216553
})

local SanAndreasParking23 = PolyZone:Create({
    vector2(-275.82489013672, -756.74737548828),
    vector2(-273.75473022461, -750.37707519531),
    vector2(-282.3620300293, -747.22497558594),
    vector2(-306.36175537109, -738.46783447266),
    vector2(-308.70153808594, -744.77325439453)
  }, {
    name="San Andreas Parking 23",
    --minZ = 53.246578216553,
    --maxZ = 53.246715545654
})

local SanAndreasParking24 = PolyZone:Create({
    vector2(-287.42666625977, -768.31628417969),
    vector2(-327.37368774414, -753.85662841797),
    vector2(-325.11297607422, -747.82257080078),
    vector2(-285.3916015625, -762.32446289063)
  }, {
    name="San Andreas Parking 24",
    --minZ = 53.246555328369,
    --maxZ = 53.246700286865
})

local SanAndreasParking25 = PolyZone:Create({
    vector2(-338.96597290039, -769.20172119141),
    vector2(-338.95404052734, -746.61358642578),
    vector2(-345.32043457031, -746.70178222656),
    vector2(-345.33502197266, -769.17565917969)
  }, {
    name="San Andreas Parking 25",
    --minZ = 53.246574401855,
    --maxZ = 53.333408355713
})

local SanAndreasParking26 = PolyZone:Create({
    vector2(-354.19143676758, -778.43450927734),
    vector2(-354.44863891602, -729.85272216797),
    vector2(-359.96051025391, -730.04516601563),
    vector2(-360.28210449219, -778.42596435547)
  }, {
    name="SanAndreasParking26",
    --minZ = 53.246528625488,
    --maxZ = 53.246723175049
})

local SanAndreasParking27 = PolyZone:Create({
    vector2(-349.73330688477, -721.09808349609),
    vector2(-349.70721435547, -708.07641601563),
    vector2(-354.70401000977, -708.17193603516),
    vector2(-355.26806640625, -708.76000976563),
    vector2(-355.06860351563, -721.17724609375)
  }, {
    name="SanAndreasParking27",
    --minZ = 53.24426651001,
    --maxZ = 53.246711730957
})

local SanAndreasParking28 = PolyZone:Create({
    vector2(-341.39617919922, -721.66040039063),
    vector2(-329.91909790039, -725.61175537109),
    vector2(-328.28033447266, -721.25561523438),
    vector2(-339.73223876953, -717.11486816406)
  }, {
    name="SanAndreasParking28",
    --minZ = 53.246669769287,
    --maxZ = 53.246688842773
})

local BeachParking1 = PolyZone:Create({
    vector2(-1188.5880126953, -1513.7158203125),
    vector2(-1193.423828125, -1517.0302734375),
    vector2(-1197.8098144531, -1510.9393310547),
    vector2(-1192.8874511719, -1507.1123046875),
    vector2(-1211.2604980469, -1480.8500976563),
    vector2(-1205.5009765625, -1477.6813964844),
    vector2(-1200.6424560547, -1484.4447021484),
    vector2(-1195.8033447266, -1491.3038330078),
    vector2(-1191.0617675781, -1498.2373046875),
    vector2(-1187.6468505859, -1503.9957275391),
    vector2(-1191.5272216797, -1507.3692626953)
  }, {
    name="Beach Parking 1",
    --minZ = 4.3405466079712,
    --maxZ = 6.3502855300903
})

local BeachParking2 = PolyZone:Create({
    vector2(-1184.1514892578, -1499.029296875),
    vector2(-1202.1166992188, -1474.443359375),
    vector2(-1190.4711914063, -1466.248046875),
    vector2(-1172.9240722656, -1491.4997558594)
  }, {
    name="Beach Parking 2",
    --minZ = 4.3431429862976,
    --maxZ = 4.3796701431274
})

local pillbox2 = PolyZone:Create({
    vector2(238.81196594238, -815.24847412109),
    vector2(253.76219177246, -773.76318359375),
    vector2(243.0632019043, -769.68096923828),
    vector2(228.35070800781, -810.95623779297)
  }, {
    name="pillbox 2",
    --minZ = 30.206420898438,
    --maxZ = 30.747560501099
})

local pillbox3 = PolyZone:Create({
    vector2(222.22161865234, -811.78350830078),
    vector2(237.15512084961, -770.7900390625),
    vector2(226.32571411133, -766.50646972656),
    vector2(211.89610290527, -804.79174804688),
    vector2(218.14985656738, -806.49835205078),
    vector2(216.90817260742, -809.36755371094)
  }, {
    name="pillbox 3",
    --minZ = 30.58837890625,
    --maxZ = 30.882966995239
})

local pillbox4 = PolyZone:Create({
    vector2(202.70770263672, -801.77655029297),
    vector2(216.81240844727, -763.44378662109),
    vector2(222.24479675293, -764.93273925781),
    vector2(208.61071777344, -803.89868164063)
  }, {
    name="pillbox 4",
    --minZ = 30.814994812012,
    --maxZ = 31.071933746338
})

local pillbox5 = PolyZone:Create({
    vector2(244.9615020752, -760.41143798828),
    vector2(246.44366455078, -756.03973388672),
    vector2(266.63250732422, -762.74066162109),
    vector2(264.65963745117, -767.25482177734)
  }, {
    name="pillbox 5",
    --minZ = 30.822988510132,
    --maxZ = 31.024322509766
})

local pillbox6 = PolyZone:Create({
    vector2(269.85986328125, -753.59814453125),
    vector2(271.75930786133, -748.69714355469),
    vector2(244.9280090332, -740.00238037109),
    vector2(242.5871887207, -743.20935058594),
    vector2(242.60935974121, -743.54504394531),
    vector2(242.32933044434, -744.00219726563)
  }, {
    name="pillbox 6",
    --minZ = 30.817783355713,
    --maxZ = 30.821775436401
})

local pillbox7 = PolyZone:Create({
    vector2(256.88702392578, -743.80187988281),
    vector2(232.95283508301, -735.79577636719),
    vector2(230.91920471191, -742.00836181641),
    vector2(254.57716369629, -750.20684814453)
  }, {
    name="pillbox 7",
    --minZ = 34.54052734375,
    --maxZ = 34.641860961914
})

local pillbox8 = PolyZone:Create({
    vector2(261.63272094727, -756.26684570313),
    vector2(268.25296020508, -758.44891357422),
    vector2(264.52670288086, -768.97912597656),
    vector2(238.29261779785, -759.79223632813),
    vector2(240.51571655273, -753.65130615234),
    vector2(257.8293762207, -759.61242675781),
    vector2(256.01385498047, -764.95135498047),
    vector2(258.56576538086, -765.26550292969)
  }, {
    name="pillbox 8",
    --minZ = 34.634056091309,
    --maxZ = 34.653301239014
})

local pillbox9 = PolyZone:Create({
    vector2(231.64839172363, -750.09844970703),
    vector2(222.09922790527, -746.85131835938),
    vector2(219.37872314453, -753.01000976563),
    vector2(228.49440002441, -756.64721679688)
  }, {
    name="pillbox 9",
    --minZ = 34.627666473389,
    --maxZ = 34.697273254395
})

local SpanishAveParking1 = PolyZone:Create({
    vector2(-1179.9799804688, -745.34020996094),
    vector2(-1190.3740234375, -732.36901855469),
    vector2(-1198.0330810547, -728.83715820313),
    vector2(-1202.7825927734, -722.79730224609),
    vector2(-1208.15234375, -727.23907470703),
    vector2(-1198.6531982422, -739.24078369141),
    vector2(-1195.7330322266, -736.95690917969),
    vector2(-1185.9440917969, -749.12225341797)
  }, {
    name="Spanish Ave Parking 1",
    --minZ = 19.799869537354,
    --maxZ = 21.415777206421
})

local SpanishAveParking2 = PolyZone:Create({
    vector2(-1140.8332519531, -737.90478515625),
    vector2(-1122.3271484375, -758.87847900391),
    vector2(-1127.5850830078, -761.10174560547),
    vector2(-1126.9228515625, -763.87768554688),
    vector2(-1132.7327880859, -766.44567871094),
    vector2(-1150.3746337891, -744.91265869141),
    vector2(-1146.1845703125, -743.24255371094),
    vector2(-1146.2449951172, -741.08361816406),
    vector2(-1146.1279296875, -739.98468017578)
  }, {
    name="Spanish Ave Parking 2",
    --minZ = 18.514072418213,
    --maxZ = 20.195274353027
})

local DumboPrivateParking = PolyZone:Create({
    vector2(172.41151428223, -3257.6096191406),
    vector2(159.18898010254, -3257.5520019531),
    vector2(159.37518310547, -3207.4111328125),
    vector2(171.79356384277, -3207.1623535156)
  }, {
    name="Dumbo Private Parking",
    --minZ = 5.7718005180359,
    --maxZ = 6.0103311538696
})

local CS24P1 = PolyZone:Create({
    vector2(-448.18661499023, -818.72802734375),
    vector2(-448.36352539063, -795.90655517578),
    vector2(-439.89593505859, -795.37426757813),
    vector2(-440.87460327148, -819.44616699219)
  }, {
    name="CS24P 1",
    --minZ = 30.548234939575,
    --maxZ = 30.789539337158
})

local CS24P2 = PolyZone:Create({
    vector2(-456.93185424805, -819.42614746094),
    vector2(-456.94827270508, -793.77484130859),
    vector2(-469.46243286133, -793.61297607422),
    vector2(-470.59768676758, -795.57153320313),
    vector2(-470.1123046875, -818.96868896484)
  }, {
    name="CS24P 2",
    --minZ = 30.513870239258,
    --maxZ = 30.616718292236
})

local CS24P3 = PolyZone:Create({
    vector2(-473.75335693359, -818.84899902344),
    vector2(-474.24169921875, -790.83062744141),
    vector2(-474.26165771484, -739.02923583984),
    vector2(-480.31762695313, -739.42590332031),
    vector2(-480.54718017578, -765.30352783203),
    vector2(-480.56713867188, -779.8095703125),
    vector2(-480.46173095703, -791.49835205078),
    vector2(-480.6630859375, -799.22906494141),
    vector2(-480.42175292969, -807.54125976563),
    vector2(-480.82843017578, -817.71124267578),
    vector2(-480.56845092773, -818.89093017578)
  }, {
    name="CS24P 3",
    --minZ = 30.420289993286,
    --maxZ = 30.716329574585
})

local CS24P4 = PolyZone:Create({
    vector2(-467.90844726563, -786.47839355469),
    vector2(-468.57592773438, -762.40985107422),
    vector2(-454.34060668945, -762.55773925781),
    vector2(-454.58544921875, -785.98162841797),
    vector2(-454.79946899414, -786.47943115234)
  }, {
    name="CS24P 4",
    --minZ = 30.560699462891,
    --maxZ = 30.562213897705
})

local CS24P5 = PolyZone:Create({
    vector2(-449.04022216797, -780.13745117188),
    vector2(-449.24176025391, -763.05908203125),
    vector2(-443.41348266602, -762.60034179688),
    vector2(-443.1787109375, -779.29846191406)
  }, {
    name="CS24P5",
    --minZ = 30.5621509552,
    --maxZ = 30.595952987671
})

local CS24P6 = PolyZone:Create({
    vector2(-449.48196411133, -762.49627685547),
    vector2(-443.65701293945, -762.09100341797),
    vector2(-443.17852783203, -779.25561523438),
    vector2(-448.70956420898, -779.51281738281),
    vector2(-449.35479736328, -769.92517089844)
  }, {
    name="CS24P 6",
    --minZ = 35.381549835205,
    --maxZ = 35.416236877441
}) 

local CS24P7 = PolyZone:Create({
    vector2(-455.04119873047, -786.3203125),
    vector2(-454.49514770508, -761.95745849609),
    vector2(-468.32247924805, -761.59582519531),
    vector2(-468.3186340332, -787.05767822266),
    vector2(-456.8122253418, -786.91668701172),
    vector2(-455.39636230469, -786.86334228516)
  }, {
    name="CS24P 7",
    --minZ = 35.381538391113,
    --maxZ = 35.381538391113
})

local CS24P8 = PolyZone:Create({
    vector2(-480.55688476563, -791.53002929688),
    vector2(-474.25689697266, -791.69110107422),
    vector2(-474.50854492188, -739.7158203125),
    vector2(-480.3893737793, -739.76062011719)
  }, {
    name="CS24P 8",
    --minZ = 35.381565093994,
    --maxZ = 35.415515899658
})

local CS24P9 = PolyZone:Create({
    vector2(-443.44223022461, -762.90222167969),
    vector2(-443.25473022461, -779.62127685547),
    vector2(-448.98574829102, -779.42156982422),
    vector2(-449.09356689453, -763.21710205078)
  }, {
    name="CS24P 9",
    --minZ = 40.200126647949,
    --maxZ = 40.234222412109
})

local CS24P10 = PolyZone:Create({
    vector2(-454.63491821289, -762.75042724609),
    vector2(-454.46655273438, -786.73022460938),
    vector2(-468.11575317383, -786.72863769531),
    vector2(-468.4729309082, -763.16473388672)
  }, {
    name="CS24P 10",
    --minZ = 40.200130462646,
    --maxZ = 40.200180053711
})

local CS24P11 = PolyZone:Create({
    vector2(-480.46145629883, -791.58276367188),
    vector2(-480.54360961914, -739.64642333984),
    vector2(-474.40390014648, -739.63781738281),
    vector2(-474.52090454102, -791.67297363281)
  }, {
    name="CS24P 11",
    --minZ = 40.200931549072,
    --maxZ = 40.231758117676
})

local CS24P12 = PolyZone:Create({
    vector2(-449.50604248047, -762.48516845703),
    vector2(-443.46160888672, -762.9443359375),
    vector2(-443.27276611328, -779.11938476563),
    vector2(-443.92236328125, -780.28363037109),
    vector2(-448.93432617188, -779.42333984375)
  }, {
    name="CS24P 12",
    --minZ = 45.018699645996,
    --maxZ = 45.052928924561
})

local CS24P13 = PolyZone:Create({
    vector2(-454.45806884766, -763.1611328125),
    vector2(-454.6826171875, -786.24035644531),
    vector2(-468.42791748047, -786.38922119141),
    vector2(-468.30276489258, -763.29315185547)
  }, {
    name="CS24P 13",
  --  minZ = 45.018703460693,
   -- maxZ = 47.019462585449
})

local CS24P14 = PolyZone:Create({
    vector2(-474.55889892578, -786.07678222656),
    vector2(-480.45974731445, -786.57257080078),
    vector2(-480.55392456055, -739.22912597656),
    vector2(-474.77157592773, -739.50720214844)
  }, {
    name="CS24P 15",
 --  minZ = 45.019462585449,
  --  maxZ = 47.181423187256
})

local BCSOSandy = PolyZone:Create({
    vector2(1843.8614501953, 3673.41796875),
    vector2(1867.0836181641, 3686.8591308594),
    vector2(1869.6781005859, 3682.2658691406),
    vector2(1856.8000488281, 3674.5773925781),
    vector2(1853.4616699219, 3673.2233886719),
    vector2(1846.7916259766, 3669.8696289063),
    vector2(1838.1514892578, 3664.7907714844),
    vector2(1821.5932617188, 3655.0141601563),
    vector2(1818.8382568359, 3653.4965820313),
    vector2(1815.9530029297, 3657.8728027344)
  }, {
    name="BCSO Sandy",
  --  minZ = 33.610916137695,
 --  maxZ = 35.225692749023
})

local SandyGarage = PolyZone:Create({
    vector2(1723.8095703125, 3704.9079589844),
    vector2(1721.7536621094, 3709.6647949219),
    vector2(1731.6293945313, 3713.771484375),
    vector2(1734.3031005859, 3708.7258300781)
  }, {
    name="Sandy Garage",
 --   minZ = 34.156940460205,
  --  maxZ = 36.192741394043
})

local TheMotorHotelParking1 = PolyZone:Create({
    vector2(1133.9959716797, 2650.5703125),
    vector2(1114.5877685547, 2651.2177734375),
    vector2(1114.7681884766, 2660.435546875),
    vector2(1108.7362060547, 2660.2990722656),
    vector2(1108.1730957031, 2666.8498535156),
    vector2(1095.2833251953, 2666.1840820313),
    vector2(1095.2768554688, 2659.7866210938),
    vector2(1107.6246337891, 2659.7585449219),
    vector2(1108.6318359375, 2651.7607421875),
    vector2(1113.6881103516, 2650.8967285156),
    vector2(1114.1630859375, 2644.2333984375),
    vector2(1137.4008789063, 2644.7331542969),
    vector2(1137.5037841797, 2650.5737304688)
  }, {
    name="The Motor Hotel Parking 1",
  --  minZ = 37.981761932373,
  --  maxZ = 39.142883300781
})

local PaletoPDPublicParking1 = PolyZone:Create({
    vector2(-430.20080566406, 6030.6455078125),
    vector2(-436.25631713867, 6026.5024414063),
    vector2(-441.00201416016, 6022.8588867188),
    vector2(-445.67309570313, 6027.2729492188),
    vector2(-441.59078979492, 6030.8911132813),
    vector2(-433.69445800781, 6035.4702148438)
  }, {
    name="PaletoPDPublicParking 1",
  --  minZ = 31.340475082397,
  --  maxZ = 33.49010848999
})

local PaletoPDPublicParking2 = PolyZone:Create({
    vector2(-452.52087402344, 6046.5107421875),
    vector2(-457.05667114258, 6051.0126953125),
    vector2(-451.3408203125, 6055.3969726563),
    vector2(-445.43078613281, 6059.052734375),
    vector2(-444.44418334961, 6059.5102539063),
    vector2(-442.05166625977, 6053.814453125),
    vector2(-445.8532409668, 6052.3393554688),
    vector2(-449.62503051758, 6050.017578125)
  }, {
    name="PaletoPDPublicParking2",
  --  minZ = 31.340547561646,
  --  maxZ = 33.48219871521
})

local PaletoPDCopParking1 = PolyZone:Create({
    vector2(-450.41061401367, 6041.3818359375),
    vector2(-454.47418212891, 6037.3452148438),
    vector2(-465.18350219727, 6047.6098632813),
    vector2(-460.75238037109, 6051.7202148438)
  }, {
    name="PaletoPDCopParking 1",
   -- minZ = 31.3404712677,
   -- maxZ = 33.340530395508
})

local PaletoPDCopParking2 = PolyZone:Create({
    vector2(-464.74755859375, 6039.396484375),
    vector2(-469.46701049805, 6043.3256835938),
    vector2(-486.8303527832, 6025.0546875),
    vector2(-482.83065795898, 6021.4262695313)
  }, {
    name="PaletoPDCopParking 2",
  --  minZ = 31.340480804443,
  --  maxZ = 33.340547561646
})

local PaletoPDCopParking3 = PolyZone:Create({
    vector2(-466.86358642578, 6012.5581054688),
    vector2(-460.00289916992, 6011.6943359375),
    vector2(-458.38412475586, 6010.1743164063),
    vector2(-458.37997436523, 6007.9145507813),
    vector2(-455.60299682617, 6007.376953125),
    vector2(-454.83459472656, 6006.3989257813),
    vector2(-454.94985961914, 6004.1401367188),
    vector2(-451.91354370117, 6003.4868164063),
    vector2(-451.21109008789, 6002.3295898438),
    vector2(-451.22662353516, 6000.9956054688),
    vector2(-451.04644775391, 6000.29296875),
    vector2(-448.09301757813, 5999.7817382813),
    vector2(-447.83242797852, 5996.9033203125),
    vector2(-444.54940795898, 5996.3701171875),
    vector2(-444.29776000977, 5996.1616210938),
    vector2(-443.65731811523, 5994.9228515625),
    vector2(-444.3583984375, 5992.4912109375),
    vector2(-444.53372192383, 5991.9770507813),
    vector2(-451.50964355469, 5992.7080078125),
    vector2(-451.91735839844, 5996.1791992188),
    vector2(-455.14028930664, 5996.5864257813),
    vector2(-455.39260864258, 5999.7807617188),
    vector2(-458.66778564453, 6000.1499023438),
    vector2(-459.05966186523, 6003.2709960938),
    vector2(-462.36450195313, 6003.744140625),
    vector2(-462.67584228516, 6006.9985351563),
    vector2(-466.33489990234, 6007.5180664063)
  }, {
    name="PaletoPDCopParking 3",
 --   minZ = 31.339296340942,
  --  maxZ = 33.490102767944
})

local BellFarmsParking1 = PolyZone:Create({
    vector2(80.865425109863, 6392.0004882813),
    vector2(85.885070800781, 6397.15625),
    vector2(73.580703735352, 6408.4174804688),
    vector2(68.820976257324, 6404.6293945313),
    vector2(63.957447052002, 6412.0166015625),
    vector2(55.244457244873, 6402.8354492188),
    vector2(59.262004852295, 6396.2036132813),
    vector2(54.458641052246, 6392.0493164063),
    vector2(48.957523345947, 6399.4428710938),
    vector2(33.085803985596, 6381.0737304688),
    vector2(36.006240844727, 6375.701171875),
    vector2(31.653337478638, 6371.1245117188),
    vector2(25.876815795898, 6375.0708007813),
    vector2(5.3598918914795, 6351.9819335938),
    vector2(6.8689441680908, 6347.9555664063),
    vector2(7.6734914779663, 6346.0180664063),
    vector2(6.275975227356, 6342.876953125),
    vector2(4.1574535369873, 6342.1948242188),
    vector2(3.1821091175079, 6340.361328125),
    vector2(-0.3757421374321, 6346.9956054688),
    vector2(-23.39965057373, 6324.2373046875),
    vector2(-20.303003311157, 6318.3369140625),
    vector2(-8.8006067276001, 6327.958984375),
    vector2(3.6127920150757, 6340.3208007813),
    vector2(10.294389724731, 6346.7817382813),
    vector2(19.215450286865, 6355.4990234375),
    vector2(26.149526596069, 6362.87890625),
    vector2(32.608577728271, 6371.1391601563),
    vector2(38.993019104004, 6376.5913085938),
    vector2(44.910839080811, 6382.4409179688),
    vector2(52.49044418335, 6390.2563476563),
    vector2(68.156585693359, 6404.177734375)
  }, {
    name="BellFarmsParking 1",
 --   minZ = 31.225755691528,
 --   maxZ = 33.457717895508
})

local BellFarmsParking2 = PolyZone:Create({
    vector2(67.146621704102, 6383.1870117188),
    vector2(70.130683898926, 6378.29296875),
    vector2(61.266815185547, 6370.6572265625),
    vector2(57.707023620605, 6367.1752929688),
    vector2(49.235294342041, 6358.6083984375),
    vector2(43.335643768311, 6357.0170898438),
    vector2(26.05838394165, 6341.6962890625),
    vector2(25.224885940552, 6340.9965820313),
    vector2(21.190156936646, 6346.7368164063),
    vector2(21.757165908813, 6347.8188476563),
    vector2(40.713642120361, 6364.1889648438),
    vector2(56.535778045654, 6376.1528320313),
    vector2(66.462326049805, 6383.7377929688)
  }, {
    name="BellFarmsParking2",
 --   minZ = 31.239835739136,
 --   maxZ = 33.324457168579
})

local BellFarmsParking3 = PolyZone:Create({
    vector2(40.022041320801, 6341.0590820313),
    vector2(41.448318481445, 6334.0625),
    vector2(31.394607543945, 6328.2319335938),
    vector2(18.46763420105, 6320.927734375),
    vector2(10.900608062744, 6316.6811523438),
    vector2(6.5460391044617, 6314.6850585938),
    vector2(4.4622092247009, 6321.5361328125),
    vector2(9.0334644317627, 6324.0986328125),
    vector2(14.668836593628, 6327.4536132813),
    vector2(22.099266052246, 6331.3208007813),
    vector2(29.884428024292, 6335.2368164063),
    vector2(35.943309783936, 6338.6396484375)
  }, {
    name="BellFarmsParking3",
 --   minZ = 31.200012207031,
  --  maxZ = 33.234733581543
})

local BellFarmsParking4 = PolyZone:Create({
    vector2(68.855346679688, 6356.16015625),
    vector2(67.181701660156, 6363.568359375),
    vector2(70.668975830078, 6364.982421875),
    vector2(74.529197692871, 6366.6137695313),
    vector2(81.595008850098, 6370.2919921875),
    vector2(82.076347351074, 6370.5385742188),
    vector2(83.47599029541, 6363.84765625),
    vector2(93.882957458496, 6368.2387695313),
    vector2(91.996047973633, 6374.962890625),
    vector2(96.367736816406, 6377.146484375),
    vector2(100.124168396, 6378.693359375),
    vector2(103.29439544678, 6380.1284179688),
    vector2(104.81761932373, 6373.6782226563),
    vector2(99.525024414063, 6371.1083984375),
    vector2(94.034210205078, 6368.4008789063),
    vector2(84.02172088623, 6364.3120117188)
  }, {
    name="BellFarmsParking4",
 --   minZ = 31.225774765015,
 --   maxZ = 33.2327003479
})

MissionRowOutsideParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
MotelParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
MotelParking2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
MotelParking3:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CeasersParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
languaes1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
languaes2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
languaes3:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
languaes4:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
languaes5:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
languaes6:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
MissionRowInside1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
MissionRowInside2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
AirportParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
AirportParking2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
AirportParking3:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)

--putDist <= 15 and

AirportParking4:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
AirportParking5:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking3:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking4:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking5:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking6:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking7:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking8:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking9:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking10:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking11:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking12:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking13:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking14:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking15:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking16:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking17:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking18:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking19:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking20:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking21:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking22:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking23:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking24:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking25:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking26:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking27:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SanAndreasParking28:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
BeachParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
BeachParking2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
pillbox2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
pillbox3:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
pillbox4:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
pillbox5:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
pillbox6:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
pillbox7:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
pillbox8:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
pillbox9:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SpanishAveParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SpanishAveParking2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
DumboPrivateParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P3:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P4:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P5:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P6:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P7:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P8:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P9:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P10:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P11:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P12:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P13:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
CS24P14:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
BCSOSandy:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
SandyGarage:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
TheMotorHotelParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
PaletoPDPublicParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
PaletoPDPublicParking2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
PaletoPDCopParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
PaletoPDCopParking2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
PaletoPDCopParking3:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
BellFarmsParking1:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
BellFarmsParking2:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
BellFarmsParking3:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
BellFarmsParking4:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inParking = true
        if inParking and IsPedInAnyVehicle(ped) then
            RegisterNetEvent('qb-garages:client:parkpersonalcar')
            AddEventHandler('qb-garages:client:parkpersonalcar', function()
                    print(inGarageRange)
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned and inParking then
                                for k, v in pairs(Garages) do
                                    local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                                    if putDist <= 35 and inParking then
                                        local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                        local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                        local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                        local vehiclepos = GetEntityCoords(curVeh)
                                        local vehicleheading = GetEntityHeading(curVeh)
                                            CheckPlayers(curVeh)
                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehiclecoords', vehiclepos, plate)
                                        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleheading', vehicleheading, plate)
                                        inParking = false
                                    end
                                end
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                inParking = false
                            else
                                QBCore.Functions.Notify("Vehicle not owned or in a parking spot", "error", 3500)
                            end
                        end, plate)
            end)
        end
    else
        inParking = false
        inGarageRange = false
    end
end)
MotelParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)

pillbox:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
CaeserParking24:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
MissionRowOutsideParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)

Lagunus:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
MissionRowInside:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        -- QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 15 then
                                PDMenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        -- QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
AirportParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
SanAndreasParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 15 then
                                MenuGarage()
                                currentGarage = police
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
BeachParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
SpanishAveParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
DumboPrivateParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
CS24P:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
BCSOSandy:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 15 then
                                PDMenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
SandyGarage:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
TheMotorHotelParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
PaletoPDPublicParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
PaletoPDCopParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 15 then
                                PDMenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)
BellFarmsParking:onPlayerInOut(function(isPointInside)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if isPointInside then
        inGarage = true
        QBCore.Functions.Notify("You Have entered a public Garage", "primary", 4500)
        if inGarage then
            RegisterNetEvent('qb-garages:client:takeoutpersonalcar')
            AddEventHandler('qb-garages:client:takeoutpersonalcar', function()
                print(inGarageRange)
                if inGarage and inGarageRange then
                    for k, v in pairs(Garages) do
                        local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
                            if putDist <= 45 then
                                MenuGarage()
                                currentGarage = k
                                inGarage = false
                            end
                    end
                end
            end)
        end
    else
        inGarage = false
        inGarageRange = false
        QBCore.Functions.Notify("You Have left a public Garage", "primary", 4500)
    end
end)

CreateThread(function()
    Wait(1000)
    while true do
        Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for k, v in pairs(Garages) do
            local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))
            if putDist <= 75 then
                inGarageRange = true
            end
        end
        if not inGarageRange then
            Wait(1000)
        end
    end
end)



CreateThread(function()
    Wait(1000)
    while true do
        Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false
        if PlayerGang.name then Name = PlayerGang.name end
         for k, v in pairs(GangGarages) do
            if PlayerGang.name == GangGarages[k].job then
                local takeDist = #(pos - vector3(GangGarages[Name].takeVehicle.x, GangGarages[Name].takeVehicle.y, GangGarages[Name].takeVehicle.z))
                if takeDist <= 15 then
                    inGarageRange = true
                    DrawMarker(2, GangGarages[Name].takeVehicle.x, GangGarages[Name].takeVehicle.y, GangGarages[Name].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                    if takeDist <= 1.5 then
                        if not IsPedInAnyVehicle(ped) then
                            DrawText3Ds(GangGarages[Name].takeVehicle.x, GangGarages[Name].takeVehicle.y, GangGarages[Name].takeVehicle.z + 0.5, '~g~E~w~ - Garage')
                            if IsControlJustPressed(0, 38) then
                                GangMenuGarage()
                                currentGarage = Name
                            end
                        else
                            DrawText3Ds(GangGarages[Name].takeVehicle.x, GangGarages[Name].takeVehicle.y, GangGarages[Name].takeVehicle.z, GangGarages[Name].label)
                        end
                    end
                    if takeDist >= 4 then
                        closeMenuFull()
                    end
                end
                local putDist = #(pos - vector3(GangGarages[Name].putVehicle.x, GangGarages[Name].putVehicle.y, GangGarages[Name].putVehicle.z))
                if putDist <= 25 and IsPedInAnyVehicle(ped) then
                    inGarageRange = true
                    DrawMarker(2, GangGarages[Name].putVehicle.x, GangGarages[Name].putVehicle.y, GangGarages[Name].putVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, false, true, false, false, false)
                    if putDist <= 1.5 then
                        DrawText3Ds(GangGarages[Name].putVehicle.x, GangGarages[Name].putVehicle.y, GangGarages[Name].putVehicle.z + 0.5, '~g~E~w~ - Park Vehicle')
                        if IsControlJustPressed(0, 38) then
                            local curVeh = GetVehiclePedIsIn(ped)
                            local plate = GetVehicleNumberPlateText(curVeh)
                            QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                                if owned then
                                    local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                    local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                    local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                    local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                    CheckPlayers(curVeh)
                                    Wait(500)
                                    if DoesEntityExist(curVeh) then
                                        QBCore.Functions.Notify("Vehicle not stored, please check if is someone inside the car.", "error", 4500)
                                    else
                                    TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, Name)
                                    TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, Name)
                                    TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                    QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                end
                                else
                                    QBCore.Functions.Notify("Vehicle not owned", "error", 3500)
                                end
                            end, plate)
                        end
                    end
                end
            end
        end
        if not inGarageRange then
            Wait(1000)
        end
    end
end)

CreateThread(function()
    Wait(1000)
    while true do
        Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false
        if PlayerJob.name then Name = PlayerJob.name end
         for k, v in pairs(JobGarages) do
            if PlayerJob.name == JobGarages[k].job then
                local takeDist = #(pos - vector3(JobGarages[Name].takeVehicle.x, JobGarages[Name].takeVehicle.y, JobGarages[Name].takeVehicle.z))
                if takeDist <= 15 then
                    inGarageRange = true
                    DrawMarker(2, JobGarages[Name].takeVehicle.x, JobGarages[Name].takeVehicle.y, JobGarages[Name].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                    if takeDist <= 1.5 then
                        if not IsPedInAnyVehicle(ped) then
                            DrawText3Ds(JobGarages[Name].takeVehicle.x, JobGarages[Name].takeVehicle.y, JobGarages[Name].takeVehicle.z + 0.5, '~g~E~w~ - Garage')
                            if IsControlJustPressed(0, 38) then
                                JobMenuGarage()
                                currentGarage = Name
                            end
                        else
                            DrawText3Ds(JobGarages[Name].takeVehicle.x, JobGarages[Name].takeVehicle.y, JobGarages[Name].takeVehicle.z, JobGarages[Name].label)
                        end
                    end
                    if takeDist >= 4 then
                        closeMenuFull()
                    end
                end
                local putDist = #(pos - vector3(JobGarages[Name].putVehicle.x, JobGarages[Name].putVehicle.y, JobGarages[Name].putVehicle.z))
                if putDist <= 25 and IsPedInAnyVehicle(ped) then
                    inGarageRange = true
                    DrawMarker(2, JobGarages[Name].putVehicle.x, JobGarages[Name].putVehicle.y, JobGarages[Name].putVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, false, true, false, false, false)
                    if putDist <= 1.5 then
                        DrawText3Ds(JobGarages[Name].putVehicle.x, JobGarages[Name].putVehicle.y, JobGarages[Name].putVehicle.z + 0.5, '~g~E~w~ - Park Vehicle')
                        if IsControlJustPressed(0, 38) then
                            local curVeh = GetVehiclePedIsIn(ped)
                            local plate = GetVehicleNumberPlateText(curVeh)
                            QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                                if owned then
                                    local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                    local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                    local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                    local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                    CheckPlayers(curVeh)
                                    Wait(500)
                                    if DoesEntityExist(curVeh) then
                                        QBCore.Functions.Notify("Vehicle not stored, please check if is someone inside the car.", "error", 4500)
                                    else
                                    TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, Name)
                                    TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, Name)
                                    TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                    if plate then
                                        OutsideVehicles[plate] = veh
                                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                    end
                                    QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                end
                                else
                                    QBCore.Functions.Notify("Vehicle not owned", "error", 3500)
                                end
                            end, plate)
                        end
                    end
                end
            end
        end
        if not inGarageRange then
            Wait(1000)
        end
    end
end)

CreateThread(function()
    while true do
        sleep = 1000
        if LocalPlayer.state['isLoggedIn'] then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            inGarageRange = false
            if HouseGarages and currentHouseGarage then
                if hasGarageKey and HouseGarages[currentHouseGarage] and HouseGarages[currentHouseGarage].takeVehicle and HouseGarages[currentHouseGarage].takeVehicle.x then
                    local takehouseDist = #(pos - vector3(HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z))
                    if takehouseDist <= 15 then
                        sleep = 5
                        inGarageRange = true
                        DrawMarker(2, HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                        if takehouseDist < 2.0 then
                            if not IsPedInAnyVehicle(ped) then
                                DrawText3Ds(HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z + 0.5, '~g~E~w~ - Garage')
                                if IsControlJustPressed(0, 38) then
                                    MenuHouseGarage(currentHouseGarage)

                                end
                            elseif IsPedInAnyVehicle(ped) then
                                DrawText3Ds(HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z + 0.5, '~g~E~w~ - To Park')
                                if IsControlJustPressed(0, 38) then
                                    local curVeh = GetVehiclePedIsIn(ped)
                                    local plate = GetVehicleNumberPlateText(curVeh)
                                    QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleHouseOwner', function(owned)
                                        if owned then
                                            local bodyDamage = round(GetVehicleBodyHealth(curVeh), 1)
                                            local engineDamage = round(GetVehicleEngineHealth(curVeh), 1)
                                            local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                                            local vehProperties = QBCore.Functions.GetVehicleProperties(curVeh)
                                                CheckPlayers(curVeh)
                                            if DoesEntityExist(curVeh) then
                                                    QBCore.Functions.Notify("The Vehicle wasn't deleted, please check if is someone inside the car.", "error", 4500)
                                            else
                                            TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, currentHouseGarage)
                                            TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, currentHouseGarage)
                                            TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', vehProperties)
                                            QBCore.Functions.DeleteVehicle(curVeh)
                                            if plate then
                                                OutsideVehicles[plate] = veh
                                                TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                            end
                                            QBCore.Functions.Notify("Vehicle Parked", "primary", 4500)
                                        end
                                        else
                                            QBCore.Functions.Notify("Vehicle not owned", "error", 3500)
                                        end

                                    end, plate, currentHouseGarage)
                                end
                            end
                        end
                        if takehouseDist > 1.99 then
                            closeMenuFull()
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    Wait(1000)
    while true do
        Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false
        for k, v in pairs(Depots) do
            local depottakeDist = #(pos - vector3(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z))
            if depottakeDist <= 15 then
                inGarageRange = true
                DrawMarker(2, Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                if depottakeDist <= 1.5 then
                    if not IsPedInAnyVehicle(ped) then
                        DrawText3Ds(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z + 0.5, '~g~E~w~ - Garage')
                        if IsControlJustPressed(0, 38) then
                            MenuDepot()
                            currentGarage = k
                        end
                    end
                end
                if depottakeDist >= 4 then
                    closeMenuFull()
                end
            end
        end
        if not inGarageRange then
            Wait(5000)
        end
    end
end)

CreateThread(function()
    for k, v in pairs(Garages) do
        if v.showBlip then
            local Garage = AddBlipForCoord(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z)
            SetBlipSprite (Garage, 357)
            SetBlipDisplay(Garage, 4)
            SetBlipScale  (Garage, 0.65)
            SetBlipAsShortRange(Garage, true)
            SetBlipColour(Garage, 3)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Garages[k].label)
            EndTextCommandSetBlipName(Garage)
        end
    end

    for k, v in pairs(Depots) do
        if v.showBlip then
            local Depot = AddBlipForCoord(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z)
            SetBlipSprite (Depot, 68)
            SetBlipDisplay(Depot, 4)
            SetBlipScale  (Depot, 0.7)
            SetBlipAsShortRange(Depot, true)
            SetBlipColour(Depot, 5)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Depots[k].label)
            EndTextCommandSetBlipName(Depot)
        end
    end
end)