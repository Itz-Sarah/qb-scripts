if got any issues, can DM me on Discord [Sarah#4321]

# qb-garages
Garage System Used With QB-Core and work with qb-radialmenu 🚗

# Credits
Original Script - https://github.com/qbcore-framework/qb-garages

# Depedency

* [qb-menu](https://github.com/qbcore-framework/qb-menu) --*/ qb-menu

Add to qb-radialmenu

CreateThread(function()
    for k, v in pairs(Garages) do
        exports['polyzonehelper']:AddBoxZone("InGarage", Garages[k].pz, Garages[k].length, Garages[k].width, {
            name="InGarage",
            heading=Garages[k].heading,
            minZ=Garages[k].minZ,
            maxZ=Garages[k].maxZ,
            debugPoly=debugPz
        })
    end
    for k, v in pairs(Depots) do
        exports['polyzonehelper']:AddBoxZone("InDepots", Depots[k].pz, Depots[k].length, Depots[k].width, {
            name="InDepots",
            heading = Depots[k].heading,
            debugPoly= Depots[k].debugPz
        })
    end
    for k, v in pairs(bennyGarages) do
        local bennyLocation = vector3(v.coords.x, v.coords.y, v.coords.z)
        local bennyHeading = v.coords.h
        exports['polyzonehelper']:AddBoxZone("InBennys", bennyLocation, 8, 8, {
            name="InBennys",
            heading = bennyHeading,
            debugPoly= false
        })
    end
    for k, v in pairs(JobGarages) do
        exports['polyzonehelper']:AddBoxZone("InPolice", JobGarages[k].pz, JobGarages[k].length, JobGarages[k].width, {
            name="InPolice",
            heading=JobGarages[k].heading,
            minZ=JobGarages[k].minZ,
            maxZ=JobGarages[k].maxZ,
            debugPoly=debugPz
        })
    end
end)


function inGarage2()
    inGarage = false
    inDepots = false
    inBennys = false
    InPolice = false
end

AddEventHandler('polyzonehelper:enter', function(name)
    if LocalPlayer.state["isLoggedIn"] then
        if name == "InGarage" then
            inGarage = true
            print('Garage: enter')
        elseif name == "InDepots" then
            inDepots = true
            print('Depot: enter')
        elseif name == "InBennys" then
            inBennys = true
            print('bennys: enter')
        elseif name == "InPolice" then
            InPolice = true
            print('Police: enter')
        end
    end
end)

AddEventHandler('polyzonehelper:exit', function(name)
    if LocalPlayer.state["isLoggedIn"] then
        if name == "InGarage" then
            inGarage = false
            inGarage2()
            print('Garage: exit')
        elseif name == "InDepots" then
            inDepots = false
            inGarage2()
            print('Depot: exit')
        elseif name == "InBennys" then
            inDepots = false
            inGarage2()
            print('Bennys: exit')
        elseif name == "InPolice" then
            InPolice = false
            inGarage2()
            print('InPolice: exit')
        end
    end
end)

exports("ZoneType", function(Zone)
    if Zone == "GarageZone" then
        return inGarage
    elseif Zone == "DepotZone" then
        return inDepots
    elseif Zone == "Bennys" then
        return inBennys
    elseif Zone == "InPolice" then
        return InPolice
    end
end)



--
This gets added in by Function  setupSubItems()
Prob best at the top of that... 

    if inGarage then
        Config.MenuItems[3] = {
        id = 'garage',
        title = 'Parking Garage',
        icon = 'parking',
        items = {
            {
                id = 'garagetake',
                title = 'Take Out Vehicle',
                icon = 'warehouse',
                type = 'client',
                event = 'Garages:PutOutGarage',
                shouldClose = true
            },
            {
                id = 'garagesave',
                title = 'Park Vehicle',
                icon = 'car',
                type = 'client',
                event = 'Garages:PutInGarage',
                shouldClose = true
            },
            {
                id = 'vehicle',
                title = 'Vehicle',
                icon = 'car',
                items = {
                    {
                        id = 'vehicledoors',
                        title = 'Vehicle Doors',
                        icon = 'car-side',
                        items = {
                            {
                                id = 'door0',
                                title = 'Drivers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door4',
                                title = 'Hood',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door1',
                                title = 'Passengers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door3',
                                title = 'Right rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door5',
                                title = 'Trunk',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door2',
                                title = 'Left rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleextras',
                        title = 'Vehicle Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'extra1',
                                title = 'Extra 1',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra2',
                                title = 'Extra 2',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra3',
                                title = 'Extra 3',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra4',
                                title = 'Extra 4',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra5',
                                title = 'Extra 5',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra6',
                                title = 'Extra 6',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra7',
                                title = 'Extra 7',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra8',
                                title = 'Extra 8',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra9',
                                title = 'Extra 9',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra10',
                                title = 'Extra 10',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra11',
                                title = 'Extra 11',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra12',
                                title = 'Extra 12',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra13',
                                title = 'Extra 13',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleseats',
                        title = 'Vehicle Seats',
                        icon = 'chair',
                        items = {
                            {
                                id = 'door0',
                                title = 'Driver',
                                icon = 'chair',
                                type = 'client',
                                event = 'qb-radialmenu:client:ChangeSeat',
                                shouldClose = false
                            }
                        }
                    }
                }
            },
        },
    }
    elseif InPolice then 
        Config.MenuItems[3] = {
        id = 'garage',
        title = 'Police Garage',
        icon = 'parking',
        items = {
            {
                id = 'garagetake',
                title = 'Take Out Vehicle',
                icon = 'warehouse',
                type = 'client',
                event = 'Garages:PolicePutOutGarage',
                shouldClose = true
            },
            {
                id = 'garagesave',
                title = 'Park Vehicle',
                icon = 'car',
                type = 'client',
                event = 'Garages:PolicePutInGarage',
                shouldClose = true
            },
            {
                id = 'vehicle',
                title = 'Vehicle',
                icon = 'car',
                items = {
                    {
                        id = 'vehicledoors',
                        title = 'Vehicle Doors',
                        icon = 'car-side',
                        items = {
                            {
                                id = 'door0',
                                title = 'Drivers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door4',
                                title = 'Hood',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door1',
                                title = 'Passengers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door3',
                                title = 'Right rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door5',
                                title = 'Trunk',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door2',
                                title = 'Left rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleextras',
                        title = 'Vehicle Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'extra1',
                                title = 'Extra 1',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra2',
                                title = 'Extra 2',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra3',
                                title = 'Extra 3',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra4',
                                title = 'Extra 4',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra5',
                                title = 'Extra 5',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra6',
                                title = 'Extra 6',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra7',
                                title = 'Extra 7',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra8',
                                title = 'Extra 8',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra9',
                                title = 'Extra 9',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra10',
                                title = 'Extra 10',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra11',
                                title = 'Extra 11',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra12',
                                title = 'Extra 12',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra13',
                                title = 'Extra 13',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleseats',
                        title = 'Vehicle Seats',
                        icon = 'chair',
                        items = {
                            {
                                id = 'door0',
                                title = 'Driver',
                                icon = 'chair',
                                type = 'client',
                                event = 'qb-radialmenu:client:ChangeSeat',
                                shouldClose = false
                            }
                        }
                    }
                }
            },
        },
    }
    elseif inDepots then
        Config.MenuItems[3] = {
            id = 'depots',
            title = 'Hayes Depots',
            icon = 'question',
            items = {
                {
                    id = 'depotstake',
                    title = 'Take Vehicle',
                    icon = 'car',
                    type = 'client',
                    event = 'Garages:TakeOutDepots',
                    shouldClose = true
                },
                {
                    id = 'vehicle',
                title = 'Vehicle',
                icon = 'car',
                items = {
                    {
                        id = 'vehicledoors',
                        title = 'Vehicle Doors',
                        icon = 'car-side',
                        items = {
                            {
                                id = 'door0',
                                title = 'Drivers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door4',
                                title = 'Hood',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door1',
                                title = 'Passengers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door3',
                                title = 'Right rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door5',
                                title = 'Trunk',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door2',
                                title = 'Left rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleextras',
                        title = 'Vehicle Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'extra1',
                                title = 'Extra 1',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra2',
                                title = 'Extra 2',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra3',
                                title = 'Extra 3',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra4',
                                title = 'Extra 4',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra5',
                                title = 'Extra 5',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra6',
                                title = 'Extra 6',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra7',
                                title = 'Extra 7',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra8',
                                title = 'Extra 8',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra9',
                                title = 'Extra 9',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra10',
                                title = 'Extra 10',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra11',
                                title = 'Extra 11',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra12',
                                title = 'Extra 12',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra13',
                                title = 'Extra 13',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleseats',
                        title = 'Vehicle Seats',
                        icon = 'chair',
                        items = {
                            {
                                id = 'door0',
                                title = 'Driver',
                                icon = 'chair',
                                type = 'client',
                                event = 'qb-radialmenu:client:ChangeSeat',
                                shouldClose = false
                                }
                            }
                        }
                    }
                },
            },
        }
    elseif inBennys then
            Config.MenuItems[3] = {
            id = 'bennys',
            title = 'Vehicle Cosmetics',
            icon = 'warehouse',
            items = {
                {
                    id = 'carcosmetics',
                    title = 'Vehicle Cosmetics',
                    icon = 'warehouse',
                    type = 'client',
                    event = 'qb-customs:enterbennys',
                    shouldClose = true
                },
                {
                    id = 'blank',
                    title = 'Future',
                    icon = 'question',
                    type = 'client',
                    event = 'Garages:PutInGarage3',
                    shouldClose = false
                },
                {
                    id = 'vehicle',
                title = 'Vehicle',
                icon = 'car',
                items = {
                    {
                        id = 'vehicledoors',
                        title = 'Vehicle Doors',
                        icon = 'car-side',
                        items = {
                            {
                                id = 'door0',
                                title = 'Drivers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door4',
                                title = 'Hood',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door1',
                                title = 'Passengers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door3',
                                title = 'Right rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door5',
                                title = 'Trunk',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door2',
                                title = 'Left rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleextras',
                        title = 'Vehicle Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'extra1',
                                title = 'Extra 1',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra2',
                                title = 'Extra 2',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra3',
                                title = 'Extra 3',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra4',
                                title = 'Extra 4',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra5',
                                title = 'Extra 5',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra6',
                                title = 'Extra 6',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra7',
                                title = 'Extra 7',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra8',
                                title = 'Extra 8',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra9',
                                title = 'Extra 9',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra10',
                                title = 'Extra 10',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra11',
                                title = 'Extra 11',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra12',
                                title = 'Extra 12',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra13',
                                title = 'Extra 13',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleseats',
                        title = 'Vehicle Seats',
                        icon = 'chair',
                        items = {
                            {
                                id = 'door0',
                                title = 'Driver',
                                icon = 'chair',
                                type = 'client',
                                event = 'qb-radialmenu:client:ChangeSeat',
                                shouldClose = false
                                }
                            }
                        }
                    }
                },
            },
        }    
    elseif inGarage == false and inDepots == false and inBennys == false then
            Config.MenuItems[3] = {
                id = 'vehicle',
                title = 'Vehicle',
                icon = 'car',
                items = {
                    {
                        id = 'vehicledoors',
                        title = 'Vehicle Doors',
                        icon = 'car-side',
                        items = {
                            {
                                id = 'door0',
                                title = 'Drivers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door4',
                                title = 'Hood',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door1',
                                title = 'Passengers door',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door3',
                                title = 'Right rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door5',
                                title = 'Trunk',
                                icon = 'car',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }, {
                                id = 'door2',
                                title = 'Left rear',
                                icon = 'car-side',
                                type = 'client',
                                event = 'qb-radialmenu:client:openDoor',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleextras',
                        title = 'Vehicle Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'extra1',
                                title = 'Extra 1',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra2',
                                title = 'Extra 2',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra3',
                                title = 'Extra 3',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra4',
                                title = 'Extra 4',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra5',
                                title = 'Extra 5',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra6',
                                title = 'Extra 6',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra7',
                                title = 'Extra 7',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra8',
                                title = 'Extra 8',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra9',
                                title = 'Extra 9',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra10',
                                title = 'Extra 10',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra11',
                                title = 'Extra 11',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra12',
                                title = 'Extra 12',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }, {
                                id = 'extra13',
                                title = 'Extra 13',
                                icon = 'box-open',
                                type = 'client',
                                event = 'qb-radialmenu:client:setExtra',
                                shouldClose = false
                            }
                        }
                    }, {
                        id = 'vehicleseats',
                        title = 'Vehicle Seats',
                        icon = 'chair',
                        items = {
                            {
                                id = 'door0',
                                title = 'Driver',
                                icon = 'chair',
                                type = 'client',
                                event = 'qb-radialmenu:client:ChangeSeat',
                                shouldClose = false
                            }
                        }
                    }
                },
            }
    end