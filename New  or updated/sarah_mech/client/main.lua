local QBCore = exports['qb-core']:GetCoreObject()

-- Instructions for use : 
    -- EVERYTHING TO BE DONE INCONFIG :) 

    -- Need help message me on discord Sarah#4321
    --area that are interactable
if target.set == "qb-target" then -- qb-target intergration change on config
    Citizen.CreateThread(function()
        for k, v in pairs(storage) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['qb-target']:AddBoxZone(storage[k].label, storage[k].coords, 3.8, 0.95, {
                    name= storage[k],
                    debugPoly= storage[k].debugPoly,
                    heading= storage[k].heading,
                    minZ= storage[k].minZ,
                    maxZ= storage[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "qb-AAA:Storage",
                                icon = "fas fa-box",
                                label = "Car Parts",
                                job = storage[k].job, 
                            },
                        },
                    distance = 3.0
                })
            end
        end
        for k, v in pairs(crafting1) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['qb-target']:AddBoxZone(crafting1[k].label, crafting1[k].coords, 1.6, 1, {
                    name= crafting1[k],
                    debugPoly= crafting1[k].debugPoly,
                    heading= crafting1[k].heading,
                    minZ= crafting1[k].minZ,
                    maxZ= crafting1[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "nh-context:benchengine",
                                icon = "fas fa-angle-double-right",
                                label = "Engine Upgrades",
                                job = crafting1[k].job,
                            },
                            {
                                event = "nh-context:benchSuspension",
                                icon = "fas fa-angle-double-right",
                                label = "Suspension Kits",
                                job = crafting1[k].job,
                            },
                            {
                                event = "nh-context:benchBrakes",
                                icon = "fas fa-angle-double-right",
                                label = "Brake Kits",
                                job = crafting1[k].job,
                            },
                            {
                                event = "nh-context:benchTransmission",
                                icon = "fas fa-angle-double-right",
                                label = "Transmission Kits",
                                job = crafting1[k].job,
                            },
                        },
                    distance = 3.0
                })
            end
        end
        for k, v in pairs(crafting2) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['qb-target']:AddBoxZone(crafting2[k].label, crafting2[k].coords, 1.6, 1, {
                    name= crafting2[k],
                    debugPoly= crafting2[k].debugPoly,
                    heading= crafting2[k].heading,
                    minZ= crafting2[k].minZ,
                    maxZ= crafting2[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "nh-context:benchengine2",
                                icon = "fas fa-angle-double-right",
                                label = "Engine Blocks",
                                job = crafting2[k].job,
                            },
                            {
                                event = "nh-context:benchSuspension2",
                                icon = "fas fa-angle-double-right",
                                label = "Suspension Kits",
                                job = crafting2[k].job,
                            },
                            {
                                event = "nh-context:benchBrakes2",
                                icon = "fas fa-angle-double-right",
                                label = "Brake Kits",
                                job = crafting2[k].job,
                            },
                            {
                                event = "nh-context:benchTransmission2",
                                icon = "fas fa-angle-double-right",
                                label = "Transmission Kits",
                                job = crafting2[k].job,
                            },
                        },
                    distance = 3.0
                })
            end
        end
        for k, v in pairs(crafting3) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['qb-target']:AddBoxZone(crafting3[k].label, crafting3[k].coords, 1.6, 1, {
                    name= crafting3[k],
                    debugPoly= crafting3[k].debugPoly,
                    heading= crafting3[k].heading,
                    minZ= crafting3[k].minZ,
                    maxZ= crafting3[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "nh-context:benchengine3",
                                icon = "fas fa-angle-double-right",
                                label = "Engine Blocks",
                                job = crafting3[k].job,
                            },
                            {
                                event = "nh-context:benchSuspension3",
                                icon = "fas fa-angle-double-right",
                                label = "Suspension Kits",
                                job = crafting3[k].job,
                            },
                            {
                                event = "nh-context:benchBrakes3",
                                icon = "fas fa-angle-double-right",
                                label = "Brake Kits",
                                job = crafting3[k].job,
                            },
                            {
                                event = "nh-context:benchTransmission3",
                                icon = "fas fa-angle-double-right",
                                label = "Transmission Kits",
                                job = crafting3[k].job,
                            },
                            {
                                event = "nh-context:benchArmour",
                                icon = "fas fa-angle-double-right",
                                label = "Armour Plating",
                                job = crafting3[k].job,
                            },
                        },
                    distance = 3.0
                })
            end
        end
        for k, v in pairs(crafting4) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['qb-target']:AddBoxZone(crafting4[k].label, crafting4[k].coords, 1.6, 1, {
                    name= crafting4[k],
                    debugPoly= crafting4[k].debugPoly,
                    heading= crafting4[k].heading,
                    minZ= crafting4[k].minZ,
                    maxZ= crafting4[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "nh-context:otherstuffies",
                                icon = "fas fa-angle-double-right",
                                label = "Racing Upgrades",
                                job = crafting4[k].job,
                            },
                            {
                                event = "nh-context:benchArmour2",
                                icon = "fas fa-angle-double-right",
                                label = "Armour Upgrades",
                                job = crafting4[k].job,
                            },
                        },
                    distance = 3.0
                })
            end
        end
    end)
elseif target.set == "bt-target" then -- bt-target intergration change on config
    Citizen.CreateThread(function()
        for k, v in pairs(storage) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['bt-target']:AddBoxZone(storage[k].label, storage[k].coords, 3.8, 0.95, {
                    name= storage[k],
                    debugPoly= storage[k].debugPoly,
                    heading= storage[k].heading,
                    minZ= storage[k].minZ,
                    maxZ= storage[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "qb-AAA:Storage",
                                icon = "fas fa-box",
                                label = "Car Parts",
                                
                            },
                        },
                    job = {storage[k].job}, 
                    distance = 3.0
                })
            end
        end
        for k, v in pairs(crafting1) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['bt-target']:AddBoxZone(crafting1[k].label, crafting1[k].coords, 1.6, 1, {
                    name= crafting1[k],
                    debugPoly= crafting1[k].debugPoly,
                    heading= crafting1[k].heading,
                    minZ= crafting1[k].minZ,
                    maxZ= crafting1[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "nh-context:benchengine",
                                icon = "fas fa-angle-double-right",
                                label = "Engine Upgrades",
                                
                            },
                            {
                                event = "nh-context:benchSuspension",
                                icon = "fas fa-angle-double-right",
                                label = "Suspension Kits",
                                
                            },
                            {
                                event = "nh-context:benchBrakes",
                                icon = "fas fa-angle-double-right",
                                label = "Brake Kits",
                                
                            },
                            {
                                event = "nh-context:benchTransmission",
                                icon = "fas fa-angle-double-right",
                                label = "Transmission Kits",
                                
                            },
                        },
                    job = {crafting1[k].job},
                    distance = 3.0
                })
            end
        end
        for k, v in pairs(crafting2) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['bt-target']:AddBoxZone(crafting2[k].label, crafting2[k].coords, 1.6, 1, {
                    name= crafting2[k],
                    debugPoly= crafting2[k].debugPoly,
                    heading= crafting2[k].heading,
                    minZ= crafting2[k].minZ,
                    maxZ= crafting2[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "nh-context:benchengine2",
                                icon = "fas fa-angle-double-right",
                                label = "Engine Blocks",
                                
                            },
                            {
                                event = "nh-context:benchSuspension2",
                                icon = "fas fa-angle-double-right",
                                label = "Suspension Kits",
                                
                            },
                            {
                                event = "nh-context:benchBrakes2",
                                icon = "fas fa-angle-double-right",
                                label = "Brake Kits",
                                
                            },
                            {
                                event = "nh-context:benchTransmission2",
                                icon = "fas fa-angle-double-right",
                                label = "Transmission Kits",
                                
                            },
                        },
                    job = {crafting2[k].job},
                    distance = 3.0
                })
            end
        end
        for k, v in pairs(crafting3) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['bt-target']:AddBoxZone(crafting3[k].label, crafting3[k].coords, 1.6, 1, {
                    name= crafting3[k],
                    debugPoly= crafting3[k].debugPoly,
                    heading= crafting3[k].heading,
                    minZ= crafting3[k].minZ,
                    maxZ= crafting3[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "nh-context:benchengine3",
                                icon = "fas fa-angle-double-right",
                                label = "Engine Blocks",
                                
                            },
                            {
                                event = "nh-context:benchSuspension3",
                                icon = "fas fa-angle-double-right",
                                label = "Suspension Kits",
                                
                            },
                            {
                                event = "nh-context:benchBrakes3",
                                icon = "fas fa-angle-double-right",
                                label = "Brake Kits",
                                
                            },
                            {
                                event = "nh-context:benchTransmission3",
                                icon = "fas fa-angle-double-right",
                                label = "Transmission Kits",
                                
                            },
                            {
                                event = "nh-context:benchArmour",
                                icon = "fas fa-angle-double-right",
                                label = "Armour Plating",
                                
                            },
                        },
                    job = {crafting3[k].job},
                    distance = 3.0
                })
            end
        end
        for k, v in pairs(crafting4) do
            if not IsPedInAnyVehicle(PlayerPedId()) then
                exports['bt-target']:AddBoxZone(crafting4[k].label, crafting4[k].coords, 1.6, 1, {
                    name= crafting4[k],
                    debugPoly= crafting4[k].debugPoly,
                    heading= crafting4[k].heading,
                    minZ= crafting4[k].minZ,
                    maxZ= crafting4[k].MaxZ,
                    }, {
                        options = {
                            {
                                event = "nh-context:otherstuffies",
                                icon = "fas fa-angle-double-right",
                                label = "Racing Upgrades",
                                
                            },
                            {
                                event = "nh-context:benchArmour2",
                                icon = "fas fa-angle-double-right",
                                label = "Armour Upgrades",
                                
                            },
                        },
                    job = {crafting4[k].job},
                    distance = 3.0
                })
            end
        end
    end)
end

-- level definition 
local level = 5

RegisterNetEvent("aaa:client:updateshop")
AddEventHandler("aaa:client:updateshop", function(result)
    if result ~= nil then
        if result == 1 then
            level = 5 
        elseif result == 2 then 
            level = 5 
        elseif result == 3 then 
            level = 5 
        elseif result == 4 then 
            level = 5 
        elseif result == 5 then 
            level = 5
        else 
            level = 5 
        end
    end
end)

-- Storage
RegisterNetEvent("qb-AAA:Storage")
AddEventHandler("qb-AAA:Storage", function()
    for k, v in pairs(storage) do
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local closeststorage = #(storage[k].coords - Playercoords)
        if closeststorage <= 5 then
            local storageunit = storage[k].label
                TriggerEvent("inventory:client:SetCurrentStash", storageunit)
                TriggerServerEvent("inventory:server:OpenInventory", "stash", storageunit, {
                    maxweight = 250000,
                    slots = 40,
                })
        end
    end
end)

------------------------ Don't touch below this point ----------------------
--benches
--tier 1 bench
    --ENGINE Upgrades
RegisterNetEvent('nh-context:benchengine', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 1 then
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Engine Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Engine",
            txt = "Meterials :"..Engine.level1.items,
            params = {
                event = "qb-AAA:enginelv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Engine",
            txt = "Meterials :"..Engine.level2.items,
            params = {
                event = "qb-AAA:enginelv2"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 1 bench
    --SUSPENSION Upgrades
RegisterNetEvent('nh-context:benchSuspension', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 1 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Suspension Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Suspension Kit",
            txt = "Meterials :"..Suspension.level1.items,
            params = {
                event = "qb-AAA:suspensionlv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Suspension Kit",
            txt = "Meterials :"..Suspension.level2.items,
            params = {
                event = "qb-AAA:suspensionlv2"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)


--tier 1 bench
    --BREAK Upgrades
RegisterNetEvent('nh-context:benchBrakes', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 1 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Brake Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Brake Kit",
            txt = "Meterials :"..brakes.level1.items,
            params = {
                event = "qb-AAA:brakeslv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Brake Kit",
            txt = "Meterials :"..brakes.level2.items,
            params = {
                event = "qb-AAA:brakeslv2"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 1 bench
    --TRANSMISSION Upgrades
RegisterNetEvent('nh-context:benchTransmission', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 1 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Transmission Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Transmission Kit",
            txt = "Meterials :"..transmission.level1.items,
            params = {
                event = "qb-AAA:translv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Transmission Kit",
            txt = "Meterials :"..transmission.level2.items,
            params = {
                event = "qb-AAA:translv2"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)
    
--tier 2 bench
    --ENGINE Upgrades
RegisterNetEvent('nh-context:benchengine2', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 2 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Engine Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 3: Engine Kit",
            txt = "Meterials :"..Engine.level3.items,
            params = {
                event = "qb-AAA:enginelv3"
            }
        },
        {
            id = 2,
            header = "Tier 4: Engine Kit",
            txt = "Meterials :"..Engine.level4.items,
            params = {
                event = "qb-AAA:enginelv4"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 2 bench
    --SUSPENSION Upgrades
RegisterNetEvent('nh-context:benchSuspension2', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 2 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Suspension Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 3: Suspension Kit",
            txt = "Meterials :"..Suspension.level3.items,
            params = {
                event = "qb-AAA:suspensionlv3"
            }
        },
        {
            id = 2,
            header = "Tier 4: Suspension Kit",
            txt = "Meterials :"..Suspension.level4.items,
            params = {
                event = "qb-AAA:suspensionlv4"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)


--tier 2 bench
    --BREAK Upgrades
RegisterNetEvent('nh-context:benchBrakes2', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 2 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Brake Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 3: Brake Kit",
            txt = "Meterials :"..brakes.level3.items,
            params = {
                event = "qb-AAA:brakeslv3"
            }
        },
        {
            id = 2,
            header = "Tier 4: Brake Kit",
            txt = "Meterials :"..brakes.level4.items,
            params = {
                event = "qb-AAA:brakeslv4"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 2 bench
    --TRANSMISSION Upgrades
RegisterNetEvent('nh-context:benchTransmission2', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 2 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Transmissionn Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 3: Transmission Kit",
            txt = "Meterials :"..transmission.level3.items,
            params = {
                event = "qb-AAA:translv3"
            }
        },
        {
            id = 2,
            header = "Tier 4: Transmission Kit",
            txt = "Meterials :"..transmission.level4.items,
            params = {
                event = "qb-AAA:translv4"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)



--tier 3 bench
    --ENGINE Upgrades
RegisterNetEvent('nh-context:benchengine3', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 3 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Engine Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "Tier 5: Engine",
            txt = "Meterials :"..Engine.level5.items,
            params = {
                event = "qb-AAA:enginelv5"
            }
        },
        {
            id = 2,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },

        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 3 bench
    --SUSPENSION Upgrades
RegisterNetEvent('nh-context:benchSuspension3', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 3 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Suspension Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "Tier 5: Suspension Kit",
            txt = "Meterials :"..Suspension.level5.items,
            params = {
                event = "qb-AAA:suspensionlv5"
            }
        },
        {
            id = 2,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)


--tier 3 bench
    --BREAK Upgrades
RegisterNetEvent('nh-context:benchBrakes3', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 3 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Brake Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "Tier 5: Brake Kit",
            txt = "Meterials :"..brakes.level5.items,
            params = {
                event = "qb-AAA:brakeslv5"
            }
        },
        {
            id = 2,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 3 bench
    --TRANSMISSION Upgrades
RegisterNetEvent('nh-context:benchTransmission3', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 3 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Transmission Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "Tier 5: Transmission Kit",
            txt = "Meterials :"..transmission.level5.items,
            params = {
                event = "qb-AAA:translv5"
            }
        },
        {
            id = 2,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 3 bench
    --Armour Upgrades
RegisterNetEvent('nh-context:benchArmour', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 3 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Armour Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Armour Plating",
            txt = "Meterials :"..armour.level1.items,
            params = {
                event = "qb-AAA:armourlv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Armour Plating",
            txt = "Meterials :"..armour.level2.items,
            params = {
                event = "qb-AAA:armourlv2"
            }
        },
        {
            id = 3,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)
    

--tier 4 bench
    --OTHER Upgrades
RegisterNetEvent('nh-context:otherstuffies', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 4 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Racing Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "NITROUS",
            txt = "Meterials :"..nitrous.level.items,
            params = {
                event = "qb-AAA:nitrous"
            }
        },
        {
            id = 2,
            header = "Tuner Chip",
            txt = "Meterials :"..tunerchip.level.items,
            params = {
                event = "qb-AAA:tunerchip"
            }
        },
        {
            id = 3,
            header = "Race Harness",
            txt = "Meterials :"..raceharness.level.items,
            params = {
                event = "qb-AAA:raceharness"
            }
        },
        {
            id = 4,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },

        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 5 bench
    --Special Upgrades
RegisterNetEvent('nh-context:benchSpecial', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    -- if level == 5 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Special Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Special",
            txt = "Special Upgrades",
            params = {
                event = ""
            }
        },
        {
            id = 2,
            header = "Close Menu",
            txt = "",
            params = {
                event = "nh-context:closeMenu",
            }
        },
        })
    -- else 
    --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    
end)

--tier 5 bench
    --Armour Upgrades
    RegisterNetEvent('nh-context:benchArmour2', function(data)
        TriggerServerEvent("aaa:updateShop", source)
        -- if level == 5 then 
        TriggerEvent('nh-context:sendMenu', {
            {
                id = 0,
                header = "Armour Upgrades",
                txt = "",
            },
            {
                id = 1,
                header = "Tier 3: Armour Plating",
                txt = "Meterials :"..armour.level3.items,
                params = {
                    event = "qb-AAA:armourlv3"
                }
            },
            {
                id = 2,
                header = "Tier 4: Armour Plating",
                txt = "Meterials :"..armour.level4.items,
                params = {
                    event = "qb-AAA:armourlv4"
                }
            },
            {
                id = 3,
                header = "Close Menu",
                txt = "",
                params = {
                    event = "nh-context:closeMenu",
                }
            },
            })
        -- else 
        --     TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
        
    end)
    
-- Pay
    RegisterNetEvent("sarah_mech:bill")
    AddEventHandler("sarah_mech:bill", function()
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
            TriggerServerEvent("qb-burgershot:bill:player", bill[1].input, bill[2].input)
        end
    end)

--
--Engine Upgrades
        RegisterNetEvent("qb-AAA:enginelv1")
        AddEventHandler("qb-AAA:enginelv1", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftengine", 1)
            end)
        end)

        RegisterNetEvent("qb-AAA:enginelv2")
        AddEventHandler("qb-AAA:enginelv2", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftengine", 2)
            end)
        end)

        RegisterNetEvent("qb-AAA:enginelv3")
        AddEventHandler("qb-AAA:enginelv3", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftengine", 3)
            end)
        end)

        RegisterNetEvent("qb-AAA:enginelv4")
        AddEventHandler("qb-AAA:enginelv4", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftengine", 4)
            end)
        end)

        RegisterNetEvent("qb-AAA:enginelv5")
        AddEventHandler("qb-AAA:enginelv5", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftengine", 5)
            end)
        end)
--
--Suspension Upgrades
        RegisterNetEvent("qb-AAA:suspensionlv1")
        AddEventHandler("qb-AAA:suspensionlv1", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent('qb-AAA:server:craftSuspension', 1)
            end)
        end)

        RegisterNetEvent("qb-AAA:suspensionlv2")
        AddEventHandler("qb-AAA:suspensionlv2", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftSuspension", 2)
            end)
            
        end)

        RegisterNetEvent("qb-AAA:suspensionlv3")
        AddEventHandler("qb-AAA:suspensionlv3", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftSuspension", 3)
            end)
        end)

        RegisterNetEvent("qb-AAA:suspensionlv4")
        AddEventHandler("qb-AAA:suspensionlv4", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftSuspension", 4)
            end)
        end)

        RegisterNetEvent("qb-AAA:suspensionlv5")
        AddEventHandler("qb-AAA:suspensionlv5", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftSuspension", 5)
            end)
        end)
--
--Brake Upgrades
        RegisterNetEvent("qb-AAA:brakeslv1")
        AddEventHandler("qb-AAA:brakeslv1", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftbrakes", 1)
            end)
        end)

        RegisterNetEvent("qb-AAA:brakeslv2")
        AddEventHandler("qb-AAA:brakeslv2", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftbrakes", 2)
            end)
        end)

        RegisterNetEvent("qb-AAA:brakeslv3")
        AddEventHandler("qb-AAA:brakeslv3", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftbrakes", 3)
            end)
        end)

        RegisterNetEvent("qb-AAA:brakeslv4")
        AddEventHandler("qb-AAA:brakeslv4", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftbrakes", 4)
            end)
        end)

        RegisterNetEvent("qb-AAA:brakeslv5")
        AddEventHandler("qb-AAA:brakeslv5", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftbrakes", 5)
            end)
        end)
--
--Transmission Upgrades
        RegisterNetEvent("qb-AAA:translv1")
        AddEventHandler("qb-AAA:translv1", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:crafttransmission", 1)
            end)
        end)

        RegisterNetEvent("qb-AAA:translv2")
        AddEventHandler("qb-AAA:translv2", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:crafttransmission", 2)
            end)
        end)

        RegisterNetEvent("qb-AAA:translv3")
        AddEventHandler("qb-AAA:translv3", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:crafttransmission", 3)
            end)
        end)

        RegisterNetEvent("qb-AAA:translv4")
        AddEventHandler("qb-AAA:translv4", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:crafttransmission", 4)
            end)
        end)

        RegisterNetEvent("qb-AAA:translv5")
        AddEventHandler("qb-AAA:translv5", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:crafttransmission", 5)
            end)
        end)
--
-- Armour Upgrades
        RegisterNetEvent("qb-AAA:armourlv1")
        AddEventHandler("qb-AAA:armourlv1", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftarmour", 1)
            end)
        end)

        RegisterNetEvent("qb-AAA:armourlv2")
        AddEventHandler("qb-AAA:armourlv2", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftarmour", 2)
            end)
        end)

        RegisterNetEvent("qb-AAA:armourlv3")
        AddEventHandler("qb-AAA:armourlv3", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftarmour", 3)
            end)
        end)

        RegisterNetEvent("qb-AAA:armourlv4")
        AddEventHandler("qb-AAA:armourlv4", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftarmour", 4)
            end)
        end)

        RegisterNetEvent("qb-AAA:armourlv5")
        AddEventHandler("qb-AAA:armourlv5", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:craftarmour", 5)
            end)
        end)
--
-- Other Upgrades
        RegisterNetEvent("qb-AAA:raceharness")
        AddEventHandler("qb-AAA:raceharness", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent('qb-AAA:server:raceharness')
            end)
        end)

        RegisterNetEvent("qb-AAA:tunerchip")
        AddEventHandler("qb-AAA:tunerchip", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent('qb-AAA:server:tunerchip')
            end)
        end)

        RegisterNetEvent("qb-AAA:client:nitrous")
        AddEventHandler("qb-AAA:nitrous", function()
            QBCore.Functions.Progressbar("grab_pills", "Crafting", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent('qb-AAA:server:nitrous')
            end)
        end)
--



-- Installations of Upgrades
    --Engine
    RegisterNetEvent("AAA:client:checkEngineupgrades")
    AddEventHandler("AAA:client:checkEngineupgrades", function(src)
        print("REACHED CLIENT")
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local car = QBCore.Functions.GetVehicleProperties(myCar)
        local engine = car.modEngine
        print(engine)

        if engine == -1 then 
            engine = 0
        elseif engine == 0 then
            engine = 1
        elseif engine == 1 then 
            engine = 2
        elseif engine == 2 then
            engine = 3 
        elseif engine == 3 then 
            engine = 4
        end

        if engine == 0 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 1", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installengine1", src)
            end)
        end

        if engine == 1 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 2", 25000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installengine2", src)
            end)
        end


        if engine == 2 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 3", 30000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installengine3", src)
            end)
        end

        if engine == 3 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 4", 40000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installengine4", src)
            end)
        end

        if engine == 4 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 5", 45000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installengine5", src)
            end)
        end
    end)

--Suspension

    RegisterNetEvent("AAA:client:checkSuspensionupgrades")
    AddEventHandler("AAA:client:checkSuspensionupgrades", function(src)
        print("REACHED CLIENT")
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local car = QBCore.Functions.GetVehicleProperties(myCar)
        local Suspension = car.modSuspension
        print(Suspension)

        if Suspension == -1 then 
            Suspension = 0
        elseif Suspension == 0 then
            Suspension = 1
        elseif Suspension == 1 then 
            Suspension = 2
        elseif Suspension == 2 then
            Suspension = 3 
        elseif Suspension == 3 then 
            Suspension = 4
        end

        if Suspension == 0 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 1", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installsuspension1", src)
            end)
        end

        if Suspension == 1 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 2", 25000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installsuspension2", src)
            end)
        end


        if Suspension == 2 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 3", 30000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installsuspension3", src)
            end)
        end

        if Suspension == 3 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 4", 40000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installsuspension4", src)
            end)
        end

        if Suspension == 4 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 5", 45000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installsuspension5", src)
            end)
        end
    end)

-- Transmission
    RegisterNetEvent("AAA:client:checkTransmissionupgrades")
    AddEventHandler("AAA:client:checkTransmissionupgrades", function(src)
        print("REACHED CLIENT")
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local car = QBCore.Functions.GetVehicleProperties(myCar)
        local Transmission = car.modTransmission 
        print(Transmission)

        if Transmission == -1 then 
            Transmission = 0
        elseif Transmission == 0 then
            Transmission = 1
        elseif Transmission == 1 then 
            Transmission = 2
        elseif Transmission == 2 then
            Transmission = 3 
        elseif Transmission == 3 then 
            Transmission = 4
        end

        if Transmission == 0 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 1", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installtrans1", src)
            end)
        end

        if Transmission == 1 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 2", 25000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installtrans2", src)
            end)
        end


        if Transmission == 2 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 3", 30000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installtrans3", src)
            end)
        end

        if Transmission == 3 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 4", 40000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installtrans4", src)
            end)
        end

        if Transmission == 4 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 5", 45000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installtrans5", src)
            end)
        end
    end)

--Brakes 
    RegisterNetEvent("AAA:client:checkBrakesupgrades")
    AddEventHandler("AAA:client:checkBrakesupgrades", function(src)
        print("REACHED CLIENT")
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local car = QBCore.Functions.GetVehicleProperties(myCar)
        local Brakes = car.modBrakes
        print(Brakes)

        if Brakes == -1 then 
            Brakes = 0
        elseif Brakes == 0 then
            Brakes = 1
        elseif Brakes == 1 then 
            Brakes = 2
        elseif Brakes == 2 then
            Brakes = 3 
        elseif Brakes == 3 then 
            Brakes = 4
        end

        if Brakes == 0 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 1", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installbrakes1", src)
            end)
        end

        if Brakes == 1 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 2", 25000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installbrakes2", src)
            end)
        end


        if Brakes == 2 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 3", 30000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installbrakes3", src)
            end)
        end

        if Brakes == 3 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 4", 40000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installbrakes4", src)
            end)
        end

        if Brakes == 4 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 5", 45000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installbrakes5", src)
            end)
        end
    end)

-- armour 
    RegisterNetEvent("AAA:client:checkarmourupgrades")
    AddEventHandler("AAA:client:checkarmourupgrades", function(src)
        print("REACHED CLIENT")
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local car = QBCore.Functions.GetVehicleProperties(myCar)
        local armour = car.modArmor
        print(armour)

        if armour == -1 then 
            armour = 0
        elseif armour == 0 then
            armour = 1
        elseif armour == 1 then 
            armour = 2
        elseif armour == 2 then
            armour = 3 
        elseif armour == 3 then 
            armour = 4
        end

        if armour == 0 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 1", 15000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installarmour1", src)
            end)
        end

        if armour == 1 then
            QBCore.Functions.Progressbar("grab_pills", "Installing level 2", 25000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installarmour2", src)
            end)
        end


        if armour == 2 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 3", 30000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installarmour3", src)
            end)
        end

        if armour == 3 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 4", 40000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installarmour4", src)
            end)
        end

        if armour == 4 then 
            QBCore.Functions.Progressbar("grab_pills", "Installing level 5", 45000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@gangops@facility@servers@",
                anim = "hotwire",
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
                TriggerServerEvent("qb-AAA:server:installarmour5", src)
            end)
        end
    end)
--

--FUNCTION TO SELECT DATABASE
    --engine
    RegisterNetEvent("qb-AAA:client:newupgradeengine")
    AddEventHandler("qb-AAA:client:newupgradeengine", function(data)
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local theCar = QBCore.Functions.GetVehicleProperties(myCar)
        local engine = theCar.modEngine
        
        if theCar ~= nil then
            if engine == -1 then
                print("engineupgrade")
                SetVehicleMod(myCar, 11, 0, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif engine == 0 then
                SetVehicleMod(myCar, 11, 1, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif engine == 1 then
                print("engineupgrade")
                SetVehicleMod(myCar, 11, 2, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif engine == 2 then
                print("engineupgrade")
                SetVehicleMod(myCar, 11, 3, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif engine == 3 then 
                print("engineupgrade")
                SetVehicleMod(myCar, 11, 4, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif engine >= 4 then 
                QBCore.Functions.Notify("This car is max level!")
            else 
                QBCore.Functions.Notify("This car is max level!")
            end            
        else
            QBCore.Functions.Notify("Theres no car nearby!")
        end
    end)
    -- trans
    RegisterNetEvent("qb-AAA:client:newupgradetrans")
    AddEventHandler("qb-AAA:client:newupgradetrans", function(data)
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local theCar = QBCore.Functions.GetVehicleProperties(myCar)
        local trans = theCar.modTransmission
        
        if myCar ~= nil then
            if trans == -1 then
                print("transupgrade")
                SetVehicleMod(myCar, 13, 0, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif trans == 0 then
                print("transupgrade")
                SetVehicleMod(myCar, 13, 1, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif trans == 1 then
                print("transupgrade")
                SetVehicleMod(myCar, 13, 2, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif trans == 2 then
                print("transupgrade")
                SetVehicleMod(myCar, 13, 3, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif trans == 3 then 
                print("transupgrade")
                SetVehicleMod(myCar, 13, 4, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif trans >= 4 then 
                QBCore.Functions.Notify("This car is max level!")
            else 
                QBCore.Functions.Notify("This car is max level!")
            end            
        else
            QBCore.Functions.Notify("Theres no car nearby!")
        end
    end)
    --suspension
    RegisterNetEvent("qb-AAA:client:newupgradesuspension")
    AddEventHandler("qb-AAA:client:newupgradesuspension", function(data)
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local theCar = QBCore.Functions.GetVehicleProperties(myCar)
        local suspension = theCar.modSuspension
        
        if myCar ~= nil then
            if suspension == -1 then
                print("suspensionupgrade")
                SetVehicleMod(myCar, 15, 0, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif suspension == 0 then
                print("suspensionupgrade")
                SetVehicleMod(myCar, 15, 1, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif suspension == 1 then
                print("suspensionupgrade")
                SetVehicleMod(myCar, 15, 2, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif suspension == 2 then
                print("suspensionupgrade")
                SetVehicleMod(myCar, 15, 3, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif suspension == 3 then 
                print("suspensionupgrade")
                SetVehicleMod(myCar, 15, 4, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif suspension >= 4 then 
                QBCore.Functions.Notify("This car is max level!")
            else 
                QBCore.Functions.Notify("This car is max level!")
            end            
        else
            QBCore.Functions.Notify("Theres no car nearby!")
        end
    end)
    --brakes
    RegisterNetEvent("qb-AAA:client:newupgradebrakes")
    AddEventHandler("qb-AAA:client:newupgradebrakes", function(data)
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local theCar = QBCore.Functions.GetVehicleProperties(myCar)
        local brakes = theCar.modBrakes
        
        if myCar ~= nil then
            if brakes == -1 then
                print("brakesupgrade")
                SetVehicleMod(myCar, 12, 0, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif brakes == 0 then
                print("brakesupgrade")
                SetVehicleMod(myCar, 12, 1, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif brakes == 1 then
                print("brakesupgrade")
                SetVehicleMod(myCar, 12, 2, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif brakes == 2 then
                print("brakesupgrade")
                SetVehicleMod(myCar, 12, 3, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif brakes == 3 then 
                print("brakesupgrade")
                SetVehicleMod(myCar, 12, 4, true)
                QmyCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif brakes >= 4 then 
                QBCore.Functions.Notify("This car is max level!")
            else 
                QBCore.Functions.Notify("This car is max level!")
            end            
        else
            QBCore.Functions.Notify("Theres no car nearby!")
        end
    end)
    --armour
    RegisterNetEvent("qb-AAA:client:newupgradearmour")
    AddEventHandler("qb-AAA:client:newupgradearmour", function(data)
        local src = source
        local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
        local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
        local theCar = QBCore.Functions.GetVehicleProperties(myCar)
        local armour = theCar.modArmor
        
        if myCar ~= nil then
            if armour == -1 then
                print("armourupgrade")
                SetVehicleMod(myCar, 16, 0, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif armour == 0 then
                print("armourupgrade")
                SetVehicleMod(myCar, 16, 1, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif armour == 1 then
                print("armourupgrade")
                SetVehicleMod(myCar, 16, 2, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif armour == 2 then
                print("armourupgrade")
                SetVehicleMod(myCar, 16, 3, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif armour == 3 then 
                print("armourupgrade")
                SetVehicleMod(myCar, 16, 4, true)
                myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
                theCar = QBCore.Functions.GetVehicleProperties(myCar)
                TriggerServerEvent("aaa:updateVehicle", theCar)
            elseif armour >= 4 then 
                QBCore.Functions.Notify("This car is max level!")
            else 
                QBCore.Functions.Notify("This car is max level!")
            end            
        else
            QBCore.Functions.Notify("Theres no car nearby!")
        end
    end)

--BT Target Triggers
        RegisterNetEvent("AAA:client:StartEngineUpgrade")
        AddEventHandler("AAA:client:StartEngineUpgrade", function()
            local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
            local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
            local theCar = QBCore.Functions.GetVehicleProperties(myCar)

            if theCar ~= nil then 
                TriggerServerEvent("AAA:server:checkenginecar", theCar)
            else 
                QBCore.Functions.Notify("Theres no car nearby!") 
            end
        end)

        RegisterNetEvent("AAA:client:StartTransUpgrade")
        AddEventHandler("AAA:client:StartTransUpgrade", function()
            local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
            local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
            local theCar = QBCore.Functions.GetVehicleProperties(myCar)

            if theCar ~= nil then 
                TriggerServerEvent("AAA:server:checktransmissioncar", theCar)
            else 
                QBCore.Functions.Notify("Theres no car nearby!") 
            end
        end)

        RegisterNetEvent("AAA:client:StartArmourUpgrade")
        AddEventHandler("AAA:client:StartArmourUpgrade", function()
            local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
            local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
            local theCar = QBCore.Functions.GetVehicleProperties(myCar)

            if theCar ~= nil then 
                TriggerServerEvent("AAA:server:checkarmourcar", theCar)
            else 
                QBCore.Functions.Notify("Theres no car nearby!") 
            end
        end)

        RegisterNetEvent("AAA:client:StartBrakerUpgrade")
        AddEventHandler("AAA:client:StartBrakerUpgrade", function()
            local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
            local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
            local theCar = QBCore.Functions.GetVehicleProperties(myCar)

            if theCar ~= nil then 
                TriggerServerEvent("AAA:server:checkBrakecar", theCar)
            else 
                QBCore.Functions.Notify("Theres no car nearby!") 
            end
        end)

        RegisterNetEvent("AAA:client:StartSuspensionUpgrade")
        AddEventHandler("AAA:client:StartSuspensionUpgrade", function()
            local Playercoords = GetEntityCoords(GetPlayerPed(-1), true)
            local myCar = QBCore.Functions.GetClosestVehicle(Playercoords)
            local theCar = QBCore.Functions.GetVehicleProperties(myCar)

            if theCar ~= nil then 
                TriggerServerEvent("AAA:server:checksuspensioncar", theCar)
            else 
                QBCore.Functions.Notify("Theres no car nearby!") 
            end
        end)