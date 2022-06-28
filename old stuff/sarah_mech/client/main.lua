
-- Instructions for use : 
    -- add bt target locations for new stores, no need to change anything else
        -- make sure to just update the vector3 and adjust heading and minz and maxz 
    -- for each business change the job = "" to what ever it needs to be
        --For each business you will need to update there storage, by doing this copy the export, change ("AAA") in there to what the company is called
        --remember to copy the event  it calls and change that too.
    -- rest of functions and events will all remain the same, Do not touch just add the copys of the following and place them in the first citizen thread:


    -- exports['qb-target']:AddBoxZone("AAA", vector3(1588.93, 6455.97, 26.01), 1.8, 0.7, { (CHANGE AAA TO COMPANY NAME)
    --     name="AAA", (CHANGE AAA TO COMPANY NAME)
    --     debugPoly=false,
    --     heading=65.29,
    --     minZ=25.2,
    --     maxZ=26.9,
    --     }, {
    --         options = {
    --             {
    --                 event = "qb-AAA:Storage", (CHANGE AAA TO COMPANY NAME)
    --                 icon = "fas fa-box",
    --                 label = "AAA Storage",
    --                 job = "mechanic", 
    --             },
    --         },
    --     distance = 3.0
    -- })

    -- exports['qb-target']:AddBoxZone("AAA_crafting_1", vector3(1589.97, 6455.49, 25.79), 0.5, 0.4, {
    --     name="AAA_crafting_1",
    --     debugPoly=false,
    --     heading=159.17,
    --     minZ=26.0,
    --     maxZ=26.9,
    --     }, {
    --         options = {
    --             {
    --                 event = "nh-context:benchengine",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Engine upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchSuspension",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Suspension upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchBrakes",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Brake upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchTransmission",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Transmission upgrades",
    --                 job = "mechanic",
    --             },
    --         },
    --     distance = 1.5
    -- })

    -- exports['qb-target']:AddBoxZone("AAA_crafting_2", vector3(1589.97, 6455.49, 25.79), 0.5, 0.4, {
    --     name="AAA_crafting_2",
    --     debugPoly=false,
    --     heading=159.17,
    --     minZ=26.0,
    --     maxZ=26.9,
    --     }, {
    --         options = {
    --             {
    --                 event = "nh-context:benchengine2",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Engine upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchSuspension2",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Suspension upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchBrakes2",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Brake upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchTransmission2",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Tramsmission upgrades",
    --                 job = "mechanic",
    --             },
    --         },
    --     distance = 1.5
    -- })

    -- exports['qb-target']:AddBoxZone("AAA_crafting_3", vector3(1589.97, 6455.49, 25.79), 0.5, 0.4, {
    --     name="AAA_crafting_3",
    --     debugPoly=false,
    --     heading=159.17,
    --     minZ=26.0,
    --     maxZ=26.9,
    --     }, {
    --         options = {
    --             {
    --                 event = "nh-context:benchengine3",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Engine upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchSuspension3",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Suspension upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchBrakes3",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Brake upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchTransmission3",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Tramsmission upgrades",
    --                 job = "mechanic",
    --             },
    --             {
    --                 event = "nh-context:benchArmour",
    --                 icon = "fas fa-angle-double-right",
    --                 label = "Armour upgrades",
    --                 job = "mechanic",
    --             },
    --         },
    --     distance = 1.5
    -- })

    -- Now add and event as seen below : 

            -- 
    --             RegisterNetEvent("qb-AAA:Storage")   (CHANGE AAA TO COMPANY NAME)
    --              AddEventHandler("qb-AAA:Storage", function()    (CHANGE AAA TO COMPANY NAME)
    --                   TriggerEvent("inventory:client:SetCurrentStash", "AAA")     (CHANGE AAA TO COMPANY NAME)
    --                   TriggerServerEvent("inventory:server:OpenInventory", "stash", "AAA", {   (CHANGE AAA TO COMPANY NAME)
    --                      maxweight = 250000,
    --                      slots = 40,
    --                   })
    --              end)
            --

--
--for any help message Sarah on discord @ Sarah#4321
--
-- Plan for mechanics : 
        -- Mechanic stores will always start with a tier 1 bench, If they spend money on upgrading there store, we will add the next teir bench 
        -- and so forth, eventually this will be coded so we dont need to get involved at all/
--
-- bt target
    --area that are interactable
Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("AAA", vector3(-1409.51, -438.81, 35.91), 3.8, 0.95, {
        name="AAA",
        debugPoly=false,
        heading=30,
        minZ=34.91,
        maxZ=36.91,
        }, {
            options = {
                {
                    event = "qb-AAA:Storage",
                    icon = "fas fa-box",
                    label = "Car Parts",
                    job = "mechanic",
                },
            },
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("AAA_crafting_1", vector3(-1406.42, -446.88, 35.91), 1.6, 1, {
        name="AAA_crafting_1",
        debugPoly=false,
        heading=122,
        minZ=34.91,
        maxZ=36.91,
        }, {
            options = {
                {
                    event = "nh-context:benchengine",
                    icon = "fas fa-angle-double-right",
                    label = "Engine Upgrades",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchSuspension",
                    icon = "fas fa-angle-double-right",
                    label = "Suspension Kits",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchBrakes",
                    icon = "fas fa-angle-double-right",
                    label = "Brake Kits",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchTransmission",
                    icon = "fas fa-angle-double-right",
                    label = "Transmission Kits",
                    job = "mechanic",
                },
            },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("AAA_crafting_2", vector3(-1408.23, -447.97, 35.91), 1.6, 1, {
        name="AAA_crafting_2",
        debugPoly=false,
        heading=122,
        minZ=34.91,
        maxZ=36.91,
        }, {
            options = {
                {
                    event = "nh-context:benchengine2",
                    icon = "fas fa-angle-double-right",
                    label = "Engine Blocks",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchSuspension2",
                    icon = "fas fa-angle-double-right",
                    label = "Suspension Kits",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchBrakes2",
                    icon = "fas fa-angle-double-right",
                    label = "Brake Kits",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchTransmission2",
                    icon = "fas fa-angle-double-right",
                    label = "Transmission Kits",
                    job = "mechanic",
                },
            },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("AAA_crafting_3", vector3(-1414.2, -451.75, 35.91), 1.6, 1, {
        name="AAA_crafting_3",
        debugPoly=false,
        heading=122,
        minZ=34.91,
        maxZ=36.91,
        }, {
            options = {
                {
                    event = "nh-context:benchengine3",
                    icon = "fas fa-angle-double-right",
                    label = "Engine Blocks",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchSuspension3",
                    icon = "fas fa-angle-double-right",
                    label = "Suspension Kits",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchBrakes3",
                    icon = "fas fa-angle-double-right",
                    label = "Brake Kits",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchTransmission3",
                    icon = "fas fa-angle-double-right",
                    label = "Transmission Kits",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchArmour",
                    icon = "fas fa-angle-double-right",
                    label = "Armour Plating",
                    job = "mechanic",
                },
            },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("AAA_crafting_4", vector3(-1416.09, -452.99, 35.91), 1.4, 1, {
        name="AAA_crafting_4",
        debugPoly=false,
        heading=122,
        minZ=34.91,
        maxZ=36.91,
        }, {
            options = {
                {
                    event = "nh-context:otherstuffies",
                    icon = "fas fa-angle-double-right",
                    label = "Racing Upgrades",
                    job = "mechanic",
                },
                {
                    event = "nh-context:benchArmour2",
                    icon = "fas fa-angle-double-right",
                    label = "Armour Upgrades",
                    job = "mechanic",
                },
            },
        distance = 1.5
    })
    
    exports['qb-target']:AddBoxZone("AAA_crafting_5", vector3(-1421.65, -456.44, 35.91), 3.6, 1, {
        name="AAA_crafting_5",
        debugPoly=false,
        heading=122,
        minZ=34.91,
        maxZ=36.91,
        }, {
            options = {
                {
                    event = "",
                    icon = "fas fa-angle-double-right",
                    label = "Special Upgrades",
                    job = "mechanic",
                },
            },
        distance = 1.5
    })
end)

-- level definition 
local level = 5

RegisterNetEvent("aaa:client:updateshop")
AddEventHandler("aaa:client:updateshop", function(result)
    if result ~= nil then
        if result == 1 then
            level = 1 
        elseif result == 2 then 
            level = 2 
        elseif result == 3 then 
            level = 3 
        elseif result == 4 then 
            level = 4 
        elseif result == 5 then 
            level = 5
        else 
            level = 1 
        end
    end
end)

-- Storage
    --Each store will have a single store container, add below this function 
RegisterNetEvent("qb-AAA:Storage")
AddEventHandler("qb-AAA:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "AAA")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "AAA", {
        maxweight = 250000,
        slots = 40,
    })
end)

------------------------ Don't touch below this point ----------------------
--benches
--tier 1 bench
    --ENGINE Upgrades
RegisterNetEvent('nh-context:benchengine', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 1 then
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Engine Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Engine",
            txt = "Refined copper, Reinforced Aluminum, Reinforced Metal",
            params = {
                event = "qb-AAA:enginelv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Engine",
            txt = "Refined copper, Reinforced Aluminum, Reinforced Metal",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 1 bench
    --SUSPENSION Upgrades
RegisterNetEvent('nh-context:benchSuspension', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 1 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Suspension Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Suspension Kit",
            txt = "Refined Copper, Refined Lead, Reinforced Metal",
            params = {
                event = "qb-AAA:suspensionlv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Suspension Kit",
            txt = "Refined Copper, Refined Lead, Reinforced Metal",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)


--tier 1 bench
    --BREAK Upgrades
RegisterNetEvent('nh-context:benchBrakes', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 1 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Brake Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Brake Kit",
            txt = "Hardened Steel, Refined Lead, Refined Zinc",
            params = {
                event = "qb-AAA:beakslv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Brake Kit",
            txt = "Hardened Steel, Refined Lead, Refinded Zinc",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 1 bench
    --TRANSMISSION Upgrades
RegisterNetEvent('nh-context:benchTransmission', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 1 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Transmission Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Transmission Kit",
            txt = "Reinforced Aluminum, Hardened Steel, Refined Copper",
            params = {
                event = "qb-AAA:translv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Transmission Kit",
            txt = "Reinforced Aluminum, Hardened Steel, Refined Copper",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)
    
--tier 2 bench
    --ENGINE Upgrades
RegisterNetEvent('nh-context:benchengine2', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 2 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Engine Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 3: Engine Kit",
            txt = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
            params = {
                event = "qb-AAA:enginelv3"
            }
        },
        {
            id = 2,
            header = "Tier 4: Engine Kit",
            txt = "Refined Copper , Reinforced Aluminum , Reinforced Metal",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 2 bench
    --SUSPENSION Upgrades
RegisterNetEvent('nh-context:benchSuspension2', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 2 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Suspension Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 3: Suspension Kit",
            txt = "Reinforced Metal, Refined Lead, Refined Copper",
            params = {
                event = "qb-AAA:suspensionlv3"
            }
        },
        {
            id = 2,
            header = "Tier 4: Suspension Kit",
            txt = "Reinforced Aluminum, Refined Copper, Reinforced Metal",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)


--tier 2 bench
    --BREAK Upgrades
RegisterNetEvent('nh-context:benchBrakes2', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 2 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Brake Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 3: Brake Kit",
            txt = "Refined Lead , refined Zinc, Hardened Steel",
            params = {
                event = "qb-AAA:brakeslv3"
            }
        },
        {
            id = 2,
            header = "Tier 4: Brake Kit",
            txt = "Refined lead, Reinforced Metal, Refined Copper",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 2 bench
    --TRANSMISSION Upgrades
RegisterNetEvent('nh-context:benchTransmission2', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 2 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Transmissionn Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 3: Transmission Kit",
            txt = "Reinforced Aluminum , Hardened Steel, Refined Copper",
            params = {
                event = "qb-AAA:translv3"
            }
        },
        {
            id = 2,
            header = "Tier 4: Transmission Kit",
            txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel, Refined Copper",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)



--tier 3 bench
    --ENGINE Upgrades
RegisterNetEvent('nh-context:benchengine3', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 3 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Engine Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "Tier 5: Engine",
            txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel, Refined Copper",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 3 bench
    --SUSPENSION Upgrades
RegisterNetEvent('nh-context:benchSuspension3', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 3 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Suspension Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "Tier 5: Suspension Kit",
            txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel, Refined Copper",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)


--tier 3 bench
    --BREAK Upgrades
RegisterNetEvent('nh-context:benchBrakes3', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 3 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Brake Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "Tier 5: Brake Kit",
            txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel, Refined Copper",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 3 bench
    --TRANSMISSION Upgrades
RegisterNetEvent('nh-context:benchTransmission3', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 3 then 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Transmission Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "Tier 5: Transmission Kit",
            txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel, Refined Copper",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 3 bench
    --Armour Upgrades
RegisterNetEvent('nh-context:benchArmour', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 3 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Armour Upgrades",
            txt = "",
        },
        {
            id = 1,
            header = "Tier 1: Armour Plating",
            txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel",
            params = {
                event = "qb-AAA:armourlv1"
            }
        },
        {
            id = 2,
            header = "Tier 2: Armour Plating",
            txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)
    

--tier 4 bench
    --OTHER Upgrades
RegisterNetEvent('nh-context:otherstuffies', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 4 then 
        TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "Racing Upgrades",
            txt = "Not all cars can take this",
        },
        {
            id = 1,
            header = "NITROUS",
            txt = "Aluminum Oxide , Refined Copper, Reinforced Aluminum",
            params = {
                event = "qb-AAA:nitrous"
            }
        },
        {
            id = 2,
            header = "Tuner Chip",
            txt = "Security Card?, USB, Electronic Kit",
            params = {
                event = "qb-AAA:tunerchip"
            }
        },
        {
            id = 3,
            header = "Race Harness",
            txt = "Leather, Thatch, Reinforced Aluminum",
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 5 bench
    --Special Upgrades
RegisterNetEvent('nh-context:benchSpecial', function(data)
    TriggerServerEvent("aaa:updateShop", source)
    if level == 5 then 
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
    else 
        TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
    end
end)

--tier 5 bench
    --Armour Upgrades
    RegisterNetEvent('nh-context:benchArmour2', function(data)
        TriggerServerEvent("aaa:updateShop", source)
        if level == 5 then 
        TriggerEvent('nh-context:sendMenu', {
            {
                id = 0,
                header = "Armour Upgrades",
                txt = "",
            },
            {
                id = 1,
                header = "Tier 3: Armour Plating",
                txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel",
                params = {
                    event = "qb-AAA:armourlv3"
                }
            },
            {
                id = 2,
                header = "Tier 4: Armour Plating",
                txt = "Reinforced Aluminum , Reinforced Metal , Hardened Steel",
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
        else 
            TriggerEvent('QBCore:Notify', "Your Company needs upgrading!")
        end
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
                TriggerServerEvent('qb-AAA:server:enginelv1')
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
                TriggerServerEvent('qb-AAA:server:enginelv2')
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
                TriggerServerEvent('qb-AAA:server:enginelv3')
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
                TriggerServerEvent('qb-AAA:server:enginelv4')
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
                TriggerServerEvent('qb-AAA:server:enginelv5')
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
                TriggerServerEvent('qb-AAA:server:suspensionlv1')
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
                TriggerServerEvent('qb-AAA:server:suspensionlv2')
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
                TriggerServerEvent('qb-AAA:server:suspensionlv3')
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
                TriggerServerEvent('qb-AAA:server:suspensionlv4')
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
                TriggerServerEvent('qb-AAA:server:suspensionlv5')
            end)
        end)
--
--Brake Upgrades
        RegisterNetEvent("qb-AAA:beakslv1")
        AddEventHandler("qb-AAA:beakslv1", function()
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
                TriggerServerEvent('qb-AAA:server:brakeslv1')
            end)
        end)

        RegisterNetEvent("qb-AAA:beakslv2")
        AddEventHandler("qb-AAA:beakslv2", function()
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
                TriggerServerEvent('qb-AAA:server:brakeslv2')
            end)
        end)

        RegisterNetEvent("qb-AAA:beakslv3")
        AddEventHandler("qb-AAA:beakslv3", function()
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
                TriggerServerEvent('qb-AAA:server:brakeslv3')
            end)
        end)

        RegisterNetEvent("qb-AAA:beakslv4")
        AddEventHandler("qb-AAA:beakslv4", function()
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
                TriggerServerEvent('qb-AAA:server:brakeslv4')
            end)
        end)

        RegisterNetEvent("qb-AAA:beakslv5")
        AddEventHandler("qb-AAA:beakslv5", function()
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
                TriggerServerEvent('qb-AAA:server:brakeslv5')
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
                TriggerServerEvent('qb-AAA:server:translv1')
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
                TriggerServerEvent('qb-AAA:server:translv2')
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
                TriggerServerEvent('qb-AAA:server:translv3')
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
                TriggerServerEvent('qb-AAA:server:translv4')
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
                TriggerServerEvent('qb-AAA:server:translv5')
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
                TriggerServerEvent('qb-AAA:server:armourlv1')
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
                TriggerServerEvent('qb-AAA:server:armourlv2')
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
                TriggerServerEvent('qb-AAA:server:armourlv3')
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
                TriggerServerEvent('qb-AAA:server:armourlv4')
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 1", 15000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 2", 25000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 3", 30000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 4", 40000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 5", 45000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 1", 15000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 2", 25000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 3", 30000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 4", 40000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 5", 45000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 1", 15000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 2", 25000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 3", 30000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 4", 40000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 5", 45000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 1", 15000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 2", 25000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 3", 30000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 4", 40000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 5", 45000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 1", 15000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 2", 25000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 3", 30000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 4", 40000, false, true, {
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
            QBCore.Functions.Progressbar("grab_pills", "Installing Level 5", 45000, false, true, {
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