



--------------------------- new ----------------------------------- 

QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData() -- Setting this for when you restart the resource in game
local inRadialMenu = false

local jobIndex = nil
local vehicleIndex = nil
local BennysMenuIndex = nil
local jobdepotsMenuIndex = nil
local depotsMenuIndex = nil
local GaragesMenuIndex = nil
local jobGaragesMenuIndex = nil

local DynamicMenuItems = {}
local FinalMenuItems = {}

local usesqbcustoms = true

-- Functions

CreateThread(function()
    for k, v in pairs(Garages) do
        exports['polyzonehelper']:AddBoxZone("InGarage", Garages[k].pz, Garages[k].length, Garages[k].width, {
            name="InGarage",
            heading=Garages[k].heading,
            minZ=Garages[k].minZ,
            maxZ=Garages[k].maxZ,
            debugPoly=false
        })
    end
    for k, v in pairs(Depots) do
        exports['polyzonehelper']:AddBoxZone("InDepots", Depots[k].pz, Depots[k].length, Depots[k].width, {
            name="InDepots",
            heading = Depots[k].heading,
            debugPoly= Depots[k].debugPz
        })
    end
    if usesqbcustoms == true then
        for k, v in pairs(bennyGarages) do
            local bennyLocation = vector3(v.coords.x, v.coords.y, v.coords.z)
            local bennyHeading = v.coords.h
            exports['polyzonehelper']:AddBoxZone("InBennys", bennyLocation, 8, 8, {
            name="InBennys",
            heading = bennyHeading,
            debugPoly= false
            })
        end
    end
    for k, v in pairs(JobGarages) do
        exports['polyzonehelper']:AddBoxZone("InPolice", JobGarages[k].pz, JobGarages[k].length, JobGarages[k].width, {
            name="InPolice",
            heading=JobGarages[k].heading,
            minZ=JobGarages[k].minZ,
            maxZ=JobGarages[k].maxZ,
            debugPoly=false
        })
    end 
    for k, v in pairs(JobDepots) do
        exports['polyzonehelper']:AddBoxZone("InJobDepotZone", JobDepots[k].pz, JobDepots[k].length, JobDepots[k].width, {
            name="InJobDepotZone",
            heading = JobDepots[k].heading,
            debugPoly= JobDepots[k].debugPz
        })
    end
end)

function inGarage2()
    inGarage = false
    inDepots = false
    inBennys = false
    InPolice = false
    InJobDepotZone = false
end

AddEventHandler('polyzonehelper:enter', function(name)
    if LocalPlayer.state["isLoggedIn"] and usesqbcustoms == true then
        if name == "InGarage" then
            inGarage = true
            TriggerEvent('cd_drawtextui:ShowUI', 'show', 'Garage')
            print('Garage: enter')
        elseif name == "InDepots" then
            inDepots = true
            TriggerEvent('cd_drawtextui:ShowUI', 'show', 'Depot')
            print('Depot: enter')
        elseif name == "InBennys" then
            inBennys = true
            TriggerEvent('cd_drawtextui:ShowUI', 'show', 'Vehicle Cosmetics')
            print('bennys: enter')
        elseif name == "InPolice" then
            InPolice = true
            TriggerEvent('cd_drawtextui:ShowUI', 'show', 'Shared Garage')
            print('Police: enter')
        elseif name == "InJobDepotZone" then
            InJobDepotZone = true
            TriggerEvent('cd_drawtextui:ShowUI', 'show', 'Shared Depot')
            print('JobDepot: enter')
        end
    elseif LocalPlayer.state["isLoggedIn"] and usesqbcustoms == false then
        if name == "InGarage" then
            inGarage = true
            print('Garage: enter')
        elseif name == "InDepots" then
            inDepots = true
            print('Depot: enter')
        elseif name == "InPolice" then
            InPolice = true
            print('Police: enter')
        elseif name == "InJobDepotZone" then
            InJobDepotZone = true
            print('JobDepot: enter')
        end
    end
end)

AddEventHandler('polyzonehelper:exit', function(name)
    if LocalPlayer.state["isLoggedIn"] and usesqbcustoms == true then
        if name == "InGarage" then
            inGarage = false
            inGarage2()
            print('Garage: exit')
            TriggerEvent('cd_drawtextui:HideUI')
        elseif name == "InDepots" then
            inDepots = false
            inGarage2()
            print('Depot: exit')
            TriggerEvent('cd_drawtextui:HideUI')
        elseif name == "InBennys" then
            inDepots = false
            inGarage2()
            TriggerEvent('cd_drawtextui:HideUI')
            print('Bennys: exit')
        elseif name == "InPolice" then
            InPolice = false
            inGarage2()
            TriggerEvent('cd_drawtextui:HideUI')
            print('InPolice: exit')
        elseif name == "InJobDepotZone" then
            InJobDepotZone = false
            inGarage2()
            TriggerEvent('cd_drawtextui:HideUI')
            print('JobDepot: exit')
        end
    elseif LocalPlayer.state["isLoggedIn"] and usesqbcustoms == false then
        if name == "InGarage" then
            inGarage = false
            inGarage2()
            TriggerEvent('cd_drawtextui:HideUI')
            print('Garage: exit')
        elseif name == "InDepots" then
            inDepots = false
            inGarage2()
            TriggerEvent('cd_drawtextui:HideUI')
            print('Depot: exit')
        elseif name == "InBennys" then
            inDepots = false
            inGarage2()
            TriggerEvent('cd_drawtextui:HideUI')
            print('Bennys: exit')
        elseif name == "InPolice" then
            InPolice = false
            inGarage2()
            TriggerEvent('cd_drawtextui:HideUI')
            print('InPolice: exit')
        elseif name == "InJobDepotZone" then
            InJobDepotZone = false
            inGarage2()
            TriggerEvent('cd_drawtextui:HideUI')
            print('JobDepot: exit')
        end
    end
end)

exports("ZoneType", function(Zone)
    if Zone == "GarageZone" then
        return inGarage
    elseif Zone == "DepotZone" then
        return inDepots
    elseif Zone == "Bennys" and usesqbcustoms == true then
        return inBennys
    elseif Zone == "InPolice" then
        return InPolice
    elseif Zone == "JobDepotZone" then
        return InJobDepotZone
    end
end)


function closeRadial(bool)
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

local function deepcopy(orig) -- modified the deep copy function from http://lua-users.org/wiki/CopyTable
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if not orig.canOpen or orig.canOpen() then
            local toRemove = {}
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                if type(orig_value) == 'table' then
                    if not orig_value.canOpen or orig_value.canOpen() then
                        copy[deepcopy(orig_key)] = deepcopy(orig_value)
                    else
                        toRemove[orig_key] = true
                    end
                else
                    copy[deepcopy(orig_key)] = deepcopy(orig_value)
                end
            end
            for i=1, #toRemove do table.remove(copy, i) --[[ Using this to make sure all indexes get re-indexed and no empty spaces are in the radialmenu ]] end
            if copy and next(copy) then setmetatable(copy, deepcopy(getmetatable(orig))) end
        end
    elseif orig_type ~= 'function' then
        copy = orig
    end
    return copy
end

local function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

local function AddOption(data, id)
    local menuID = id ~= nil and id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

local function RemoveOption(id)
    DynamicMenuItems[id] = nil
end

local function SetupjobGaragesmenu()
    local jobnumberofgarages = 0
    local jobGaragesMenu = {
        id = 'jobGarages',
        title = 'Shared Garage',
        icon = 'warehouse',
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
            }
        }
    }
        if Config.EnableExtraMenu and InPolice then 
            jobnumberofgarages = 1
        end

    if jobnumberofgarages == 0 then
        if jobGaragesMenuIndex then
            RemoveOption(jobGaragesMenuIndex)
            jobGaragesMenuIndex = nil
        end
    else
        jobGaragesMenuIndex = AddOption(jobGaragesMenu, jobGaragesMenuIndex)
    end
end

local function Setupdepotsmenu()
    local numberofdepots = 0
    local depotsMenu = {
        id = 'depot',
        title = 'Depots',
        icon = 'warehouse',
        type = 'client',
        event = 'Garages:TakeOutDepots',
        shouldClose = true

    }
        if Config.EnableExtraMenu and inDepots then 
            numberofdepots = 1
        end

    if numberofdepots == 0 then
        if depotsMenuIndex then
            RemoveOption(depotsMenuIndex)
            depotsMenuIndex = nil
        end
    else
        depotsMenuIndex = AddOption(depotsMenu, depotsMenuIndex)
    end
end


local function Setupjobdepotsmenu()
    local numberofjobdepots  = 0
    local jobdepotsMenu = {
        id = 'jobdepot',
        title = 'Shared Depots',
        icon = 'warehouse',
        type = 'client',
        event = 'Garages:TakeOutJobDepots',
        shouldClose = true
    }
        if Config.EnableExtraMenu and InJobDepotZone then 
            numberofjobdepots = 1
        end

    if numberofjobdepots == 0 then
        if jobdepotsMenuIndex then
            RemoveOption(jobdepotsMenuIndex)
            jobdepotsMenuIndex = nil
        end
    else
        jobdepotsMenuIndex = AddOption(jobdepotsMenu, jobdepotsMenuIndex)
    end
end


local function SetupGaragesmenu()
    local numberofgarages = 0
    local GaragesMenu = {
        id = 'Garages',
        title = 'Garage',
        icon = 'warehouse',
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
            }
        }
    }
        if Config.EnableExtraMenu and inGarage then 
            numberofgarages = 1
        end

    if numberofgarages == 0 then
        if GaragesMenuIndex then
            RemoveOption(GaragesMenuIndex)
            GaragesMenuIndex = nil
        end
    else
        GaragesMenuIndex = AddOption(GaragesMenu, GaragesMenuIndex)
    end
end
    
local function SetupJobMenu()
    local JobMenu = {
        id = 'jobinteractions',
        title = 'Work',
        icon = 'briefcase',
        items = {}
    }
    if Config.JobInteractions[PlayerData.job.name] and next(Config.JobInteractions[PlayerData.job.name]) then
        JobMenu.items = Config.JobInteractions[PlayerData.job.name]
    end

    if #JobMenu.items == 0 then
        if jobIndex then
            RemoveOption(jobIndex)
            jobIndex = nil
        end
    else
        jobIndex = AddOption(JobMenu, jobIndex)
    end
end

local function SetupBennysmenu()
    local numberofbenny = 0
    local BennysMenu = {
        id = 'bennys',
        title = 'Cosmetics',
        icon = 'car',
        type = 'client',
        event = 'qb-customs:enterbennys',
        shouldClose = true
    }
    local ped = PlayerPedId()
    local Vehicle = GetVehiclePedIsIn(ped) ~= 0 and GetVehiclePedIsIn(ped) or getNearestVeh()
    if Vehicle ~= 0 then
        if Config.EnableExtraMenu and inBennys and usesqbcustoms == true then 
            numberofbenny = 1
        end
    end

    if numberofbenny == 0 then
        if BennysMenuIndex then
            RemoveOption(BennysMenuIndex)
            BennysMenuIndex = nil
        end
    else
        BennysMenuIndex = AddOption(BennysMenu, BennysMenuIndex)
    end
end

local function SetupVehicleMenu()
    local VehicleMenu = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = 'car',
        items = {}
    }

    local ped = PlayerPedId()
    local Vehicle = GetVehiclePedIsIn(ped) ~= 0 and GetVehiclePedIsIn(ped) or getNearestVeh()
    if Vehicle ~= 0 then
        VehicleMenu.items[#VehicleMenu.items+1] = Config.VehicleDoors
        if Config.EnableExtraMenu then VehicleMenu.items[#VehicleMenu.items+1] = Config.VehicleExtras end

        if IsPedInAnyVehicle(ped) then
            local seatIndex = #VehicleMenu.items+1
            VehicleMenu.items[seatIndex] = deepcopy(Config.VehicleSeats)

            local seatTable = {
                [1] = Lang:t("options.driver_seat"),
                [2] = Lang:t("options.passenger_seat"),
                [3] = Lang:t("options.rear_left_seat"),
                [4] = Lang:t("options.rear_right_seat"),
            }

            local AmountOfSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Vehicle))
            for i = 1, AmountOfSeats do
                local newIndex = #VehicleMenu.items[seatIndex].items+1
                VehicleMenu.items[seatIndex].items[newIndex] = {
                    id = i - 2,
                    title = seatTable[i] or Lang:t("options.other_seats"),
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                }
            end
        end
    end

    if #VehicleMenu.items == 0 then
        if vehicleIndex then
            RemoveOption(vehicleIndex)
            vehicleIndex = nil
        end
    else
        vehicleIndex = AddOption(VehicleMenu, vehicleIndex)
    end
end

local function SetupSubItems()
    SetupGaragesmenu()
    SetupjobGaragesmenu()
    SetupBennysmenu()
    Setupjobdepotsmenu()
    Setupdepotsmenu()
    SetupJobMenu()
    SetupBennysmenu()
    SetupVehicleMenu()
    
end

local function selectOption(t, t2)
    for _, v in pairs(t) do
        if v.items then
            local found, hasAction, val = selectOption(v.items, t2)
            if found then return true, hasAction, val end
        else
            if v.id == t2.id and ((v.event and v.event == t2.event) or v.action) and (not v.canOpen or v.canOpen()) then
                return true, v.action, v
            end
        end
    end
    return false
end

local function IsPoliceOrEMS()
    return (PlayerData.job.name == "police" or PlayerData.job.name == "ambulance")
end

local function IsDowned()
    return (PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"])
end

local function SetupRadialMenu()
    FinalMenuItems = {}
    if (IsDowned() and IsPoliceOrEMS()) then
            FinalMenuItems = {
                [1] = {
                    id = 'emergencybutton2',
                    title = Lang:t("options.emergency_button"),
                    icon = 'exclamation-circle',
                    type = 'client',
                    event = 'police:client:SendPoliceEmergencyAlert',
                    shouldClose = true,
                },
            }
    else
        SetupSubItems()
        FinalMenuItems = deepcopy(Config.MenuItems)
        for _, v in pairs(DynamicMenuItems) do
            FinalMenuItems[#FinalMenuItems+1] = v
        end

    end
end

local function setRadialState(bool, sendMessage, delay)
    -- Menuitems have to be added only once

    if bool then
        TriggerEvent('qb-radialmenu:client:onRadialmenuOpen')
        SetupRadialMenu()
    else
        TriggerEvent('qb-radialmenu:client:onRadialmenuClose')
    end

    SetNuiFocus(bool, bool)
    if sendMessage then
        SendNUIMessage({
            action = "ui",
            radial = bool,
            items = FinalMenuItems
        })
    end
    if delay then Wait(500) end
    inRadialMenu = bool
end

-- Command

RegisterCommand('radialmenu', function()
    if ((IsDowned() and IsPoliceOrEMS()) or not IsDowned()) and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() and not inRadialMenu then
        setRadialState(true, true)
        SetCursorLocation(0.5, 0.5)
    end
end)

RegisterKeyMapping('radialmenu', Lang:t("general.command_description"), 'keyboard', 'F1')

-- Events

-- Sets the metadata when the player spawns
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

-- Sets the playerdata to an empty table when the player has quit or did /logout
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

-- This will update all the PlayerData that doesn't get updated with a specific event other than this like the metadata
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

RegisterNetEvent('qb-radialmenu:client:noPlayers', function()
    QBCore.Functions.Notify(Lang:t("error.no_people_nearby"), 'error', 2500)
end)

RegisterNetEvent('qb-radialmenu:client:openDoor', function(data)
    local string = data.id
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
    local ped = PlayerPedId()
    local closestVehicle = GetVehiclePedIsIn(ped) ~= 0 and GetVehiclePedIsIn(ped) or getNearestVeh()
    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local plate = QBCore.Functions.GetPlate(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        QBCore.Functions.Notify(Lang:t("error.no_vehicle_found"), 'error', 2500)
    end
end)

RegisterNetEvent('qb-radialmenu:client:setExtra', function(data)
    local string = data.id
    local replace = string:gsub("extra", "")
    local extra = tonumber(replace)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if veh ~= nil then
        if GetPedInVehicleSeat(veh, -1) == ped then
            SetVehicleAutoRepairDisabled(veh, true) -- Forces Auto Repair off when Toggling Extra [GTA 5 Niche Issue]
            if DoesExtraExist(veh, extra) then
                if IsVehicleExtraTurnedOn(veh, extra) then
                    SetVehicleExtra(veh, extra, 1)
                    QBCore.Functions.Notify(Lang:t("error.extra_deactivated", {extra = extra}), 'error', 2500)
                else
                    SetVehicleExtra(veh, extra, 0)
                    QBCore.Functions.Notify(Lang:t("success.extra_activated", {extra = extra}), 'success', 2500)
                end
            else
                QBCore.Functions.Notify(Lang:t("error.extra_not_present", {extra = extra}), 'error', 2500)
            end
        else
            QBCore.Functions.Notify(Lang:t("error.not_driver"), 'error', 2500)
        end
    end
end)

RegisterNetEvent('qb-radialmenu:trunk:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(PlayerPedId())
    if veh ~= 0 then
        local pl = QBCore.Functions.GetPlate(veh)
        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

RegisterNetEvent('qb-radialmenu:client:ChangeSeat', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local IsSeatFree = IsVehicleSeatFree(Veh, data.id)
    local speed = GetEntitySpeed(Veh)
    local HasHarnass = exports['qb-smallresources']:HasHarness()
    if not HasHarnass then
        local kmh = speed * 3.6
        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(PlayerPedId(), Veh, data.id)
                QBCore.Functions.Notify(Lang:t("info.switched_seats", {seat = data.title}))
            else
                QBCore.Functions.Notify(Lang:t("error.vehicle_driving_fast"), 'error')
            end
        else
            QBCore.Functions.Notify(Lang:t("error.seat_occupied"), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t("error.race_harness_on"), 'error')
    end
end)

-- NUI Callbacks

-- RegisterNUICallback('closeRadial', function(data, cb)
--     setRadialState(false, false, data.delay)
--     cb('ok')
-- end)


RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)

RegisterNUICallback('selectItem', function(inData, cb)
    local itemData = inData.itemData
    local found, action, data = selectOption(FinalMenuItems, itemData)
    if data and found then
        if action then
            action(data)
        elseif data.type == 'client' then
            TriggerEvent(data.event, data)
        elseif data.type == 'server' then
            TriggerServerEvent(data.event, data)
        elseif data.type == 'command' then
            ExecuteCommand(data.event)
        elseif data.type == 'qbcommand' then
            TriggerServerEvent('QBCore:CallCommand', data.event, data)
        end
    end
    cb('ok')
end)

exports('AddOption', AddOption)
exports('RemoveOption', RemoveOption)



