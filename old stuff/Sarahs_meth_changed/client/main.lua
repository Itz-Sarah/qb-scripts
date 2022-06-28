local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }


local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = true

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

local spawnedWeed = 0
local weedPlants = {}
local spawnedWeed2 = 0
local weedPlants2 = {}
local weed = false
local coke = false


local isPickingUp, isProcessing, isProcessing2 = false, false, false

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


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            for spot, location in pairs(Config.Weed["takeables"]) do
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Weed["takeables"][spot].x, Config.Weed["takeables"][spot].y,Config.Weed["takeables"][spot].z, true)
                    if dist < 2.5 then
                    
                    if dist < 0.6 then
                        if not Config.Weed["takeables"][spot].isBusy and not Config.Weed["takeables"][spot].isDone then
                            DrawText3Ds(Config.Weed["takeables"][spot].x, Config.Weed["takeables"][spot].y,Config.Weed["takeables"][spot].z, '~g~E~w~ To harvest weed')
                            if IsControlJustPressed(0, 38) then
                                currentSpot = spot
                                GrabItem(currentSpot)
                            end
                        end
                    end
                end
            end
        end
    end
end)

function GrabItem(spot)
    local pos = GetEntityCoords(PlayerPedId())
    QBCore.Functions.Progressbar("grab_pills", "Harvesting", 15000, false, true, {
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
        TriggerServerEvent('sarah_weed:server:setSpotState', "isDone", true, spot)
        TriggerServerEvent('sarah_weed:server:setSpotState', "isBusy", false, spot)
        TriggerServerEvent('sarah_weed:server:itemReward', spot)
        weed = true
        refreshplease(spot)
    end)
end

function GrabItemCoke(spot)
    local pos = GetEntityCoords(PlayerPedId())
    QBCore.Functions.Progressbar("grab_pills", "Harvesting", 15000, false, true, {
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
        TriggerServerEvent('sarah_coke:server:setSpotState', "isDone", true, spot)
        TriggerServerEvent('sarah_coke:server:setSpotState', "isBusy", false, spot)
        TriggerServerEvent('sarah_coke:server:itemReward', spot)
        coke = true
        refreshplease(spot)
    end)
end

function refreshplease(spot)
    Citizen.Wait(180000)
    if weed == true then 
        TriggerServerEvent('sarah_weed:server:setSpotState', "isDone", false, spot)
        weed = false
    else
        TriggerServerEvent('sarah_coke:server:setSpotState', "isDone", false, spot)
        coke = false
    end
end

RegisterNetEvent('sarah_weed:client:setSpotState')
AddEventHandler('sarah_weed:client:setSpotState', function(stateType, state, spot)
    if stateType == "isBusy" then
        Config.Weed["takeables"][spot].isBusy = state
    elseif stateType == "isDone" then
        Config.Weed["takeables"][spot].isDone = state
    end
end)

RegisterNetEvent("sarah_weed:client:skunkpro")
AddEventHandler("sarah_weed:client:skunkpro", function()
	QBCore.Functions.Progressbar("grab_pills", "Trying to Dry...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:skunkpro")
    end)	
end)

RegisterNetEvent("sarah_weed:client:purplepro")
AddEventHandler("sarah_weed:client:purplepro", function()
	QBCore.Functions.Progressbar("grab_pills", "Trying to Dry...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:purplepro")
    end)		
end)

RegisterNetEvent("sarah_weed:client:ogpro")
AddEventHandler("sarah_weed:client:ogpro", function()
	QBCore.Functions.Progressbar("grab_pills", "Trying to Dry...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:ogpro")
    end)
end)

RegisterNetEvent("sarah_weed:client:amnesiapro")
AddEventHandler("sarah_weed:client:amnesiapro", function()
	QBCore.Functions.Progressbar("grab_pills", "Trying to Dry...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:amnesiapro")
    end)
end)

RegisterNetEvent("sarah_weed:client:ak47pro")
AddEventHandler("sarah_weed:client:ak47pro", function()
	QBCore.Functions.Progressbar("grab_pills", "Trying to Dry...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:ak47pro")
    end)	
end)

RegisterNetEvent("sarah_weed:client:whitewidowpro")
AddEventHandler("sarah_weed:client:whitewidowpro", function()
	QBCore.Functions.Progressbar("grab_pills", "Trying to Dry...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:whitewidowpro")
    end)	
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            for spot, location in pairs(Config.Coke["takeables"]) do
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Coke["takeables"][spot].x, Config.Coke["takeables"][spot].y,Config.Coke["takeables"][spot].z, true)
                    if dist < 2.5 then
                    
                    if dist < 0.6 then
                        if not Config.Coke["takeables"][spot].isBusy and not Config.Coke["takeables"][spot].isDone then
                            DrawText3Ds(Config.Coke["takeables"][spot].x, Config.Coke["takeables"][spot].y,Config.Coke["takeables"][spot].z, '~g~E~w~ To harvest coke')
                            if IsControlJustPressed(0, 38) then
                                currentSpot = spot
                                GrabItemCoke(currentSpot)
                            end
                        end
                    end
                end
            end
        end
    end
end)


RegisterNetEvent('sarah_coke:client:setSpotState')
AddEventHandler('sarah_coke:client:setSpotState', function(stateType, state, spot)
    if stateType == "isBusy" then
        Config.Coke["takeables"][spot].isBusy = state
    elseif stateType == "isDone" then
        Config.Coke["takeables"][spot].isDone = state
    end
end) 


RegisterNetEvent('sarah_weed:client:whitewidowjoint')
AddEventHandler('sarah_weed:client:whitewidowjoint', function()
    QBCore.Functions.Progressbar("grab_pills", "Rolling...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:whitewidowjoint")
    end)
end)

RegisterNetEvent('sarah_weed:client:amnesiajoint')
AddEventHandler('sarah_weed:client:amnesiajoint', function()
    QBCore.Functions.Progressbar("grab_pills", "Rolling...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:amnesiajoint")
    end)
end)

RegisterNetEvent('sarah_weed:client:kushjoint')
AddEventHandler('sarah_weed:client:kushjoint', function()
    QBCore.Functions.Progressbar("grab_pills", "Rolling...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:kushjoint")
    end)
end)

RegisterNetEvent('sarah_weed:client:purplejoint')
AddEventHandler('sarah_weed:client:purplejoint', function()
    QBCore.Functions.Progressbar("grab_pills", "Rolling...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:purplejoint")
    end)
end)

RegisterNetEvent('sarah_weed:client:skunkjoint')
AddEventHandler('sarah_weed:client:skunkjoint', function()
    print("reached sarahs server")
    QBCore.Functions.Progressbar("grab_pills", "Rolling...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:skunkjoint")
    end)
end)

RegisterNetEvent('sarah_weed:client:ak47joint')
AddEventHandler('sarah_weed:client:ak47joint', function()
    QBCore.Functions.Progressbar("grab_pills", "Rolling...", 3000, false, true, {
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
        TriggerServerEvent("sarah_weed:server:ak47joint")
    end)
end)

