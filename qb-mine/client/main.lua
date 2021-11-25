local mine = 0
local mine2 = 0
local mine3 = 0
local mine4 = 0
local mine5 = 0
local mine6 = 0
local mine7 = 0
local mine8 = 0
local mine9 = 0
local mine10 = 0
local mine11 = 0
local mine12 = 0

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(480000)
	if mine > 0 then 
		mine = 0
	end

    if mine2 > 0 then 
		mine2 = 0
	end

    if mine3 > 0 then 
		mine3 = 0
	end

    if mine4 > 0 then 
		mine4 = 0
	end

    if mine5 > 0 then 
		mine5 = 0
	end

    if mine6 > 0 then 
		mine6 = 0
	end

    if mine7 > 0 then 
		mine7 = 0
	end

    if mine8 > 0 then 
		mine8 = 0
	end

    if mine9 > 0 then 
		mine9 = 0
	end

    if mine10 > 0 then 
		mine10 = 0
	end

    if mine11 > 0 then 
		mine11 = 0
	end

    if mine12 > 0 then 
		mine12 = 0
	end

	end
end)

Citizen.CreateThread(function()
    mineblip = AddBlipForCoord(-587.96, 2061.31, 130.83)

    SetBlipSprite (mineblip, 78)
    SetBlipDisplay(mineblip, 4)
    SetBlipScale  (mineblip, 0.8)
    SetBlipColour (mineblip, 0)
	SetBlipAlpha (mineblip, 0.9)
    SetBlipAsShortRange(mineblip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Mine")
    EndTextCommandSetBlipName(mineblip)
end)

Citizen.CreateThread(function()
    minepro = AddBlipForCoord(287.69, 2843.61, 44.7)

    SetBlipSprite (minepro, 78)
    SetBlipDisplay(minepro, 4)
    SetBlipScale  (minepro, 0.8)
    SetBlipColour (minepro, 0)
	SetBlipAlpha (minepro, 0.9)
    SetBlipAsShortRange(minepro, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Mine Processing")
    EndTextCommandSetBlipName(minepro)
end)


DrawText3Ds = function(x, y, z, text)
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
        local inRange = false

        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)

        local distance1 = #(PlayerPos - Config.locations['MiningLocation'][1].coords)
        local distance2 = #(PlayerPos - Config.locations['MiningLocation'][2].coords)
        local distance3 = #(PlayerPos - Config.locations['MiningLocation'][3].coords)
        local distance4 = #(PlayerPos - Config.locations['MiningLocation'][4].coords)
        local distance5 = #(PlayerPos - Config.locations['MiningLocation'][5].coords)
        local distance6 = #(PlayerPos - Config.locations['MiningLocation'][6].coords)
        local distance7 = #(PlayerPos - Config.locations['MiningLocation'][7].coords)
        local distance8 = #(PlayerPos - Config.locations['MiningLocation'][8].coords)
        local distance9 = #(PlayerPos - Config.locations['MiningLocation'][9].coords)
        local distance10 = #(PlayerPos - Config.locations['MiningLocation'][10].coords)
        local distance11 = #(PlayerPos - Config.locations['MiningLocation'][11].coords)
        local distance12 = #(PlayerPos - Config.locations['MiningLocation'][12].coords)
        
        if distance3 < 150 then
            inRange = true

            if distance1 < 2 then
                DrawText3Ds(-587.96, 2061.31, 130.83, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine = mine + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance2 < 2 then
                DrawText3Ds(-573.1, 2023.58, 127.9, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine2 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine2 = mine2 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance3 < 2 then
                DrawText3Ds(-549.7, 1996.13, 127.04, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine3 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine3 = mine3 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance4 < 2 then
                DrawText3Ds(-541.57, 1967.97, 126.92, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine4 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine4 = mine4 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance5 < 2 then
                DrawText3Ds(-536.57, 1931.21, 124.95, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine5 ==0 then
                    MineProcess()
                    PrepareAnim()
                    mine5 = mine5 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance6 < 2 then
                DrawText3Ds(-481.71, 1894.87, 119.71, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine6 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine6 = mine6 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance7 < 2 then
                DrawText3Ds(-565.23, 1886.39, 123.04, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine7 == 0 then 
                    MineProcess()
                    PrepareAnim()
                    mine7 = mine7 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance8 < 2 then
                DrawText3Ds(-518.9, 1980.34, 126.54, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine8 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine8 = mine8 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance9 < 2 then
                DrawText3Ds(-481.45, 1985.82, 124.23, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine9 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine9 = mine8 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance10 < 2 then
                DrawText3Ds(-445.85, 2014.75, 123.66, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine11 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine10 = mine10 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance11 < 2 then
                DrawText3Ds(-422.59, 2064.48, 119.9, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine11 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine11 = mine11 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end

            if distance12 < 2 then
                DrawText3Ds(-472.49, 2090.4, 120.07, "[E] Start Mining")
                if IsControlJustPressed(0, 38) then if mine12 == 0 then
                    MineProcess()
                    PrepareAnim()
                    mine12 = mine12 + 1
                else 
                    QBCore.Functions.Notify('You have already Mined this spot.', 'error', 3500)
                    
                end
                end
            end
            
        end

        if not inRange then
            Citizen.Wait(2000)
        end
        Citizen.Wait(3)
    end
end)

function MineProcess()
    QBCore.Functions.Progressbar("grind_coke", "Mining..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:mine")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function PrepareAnim()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "world_human_hammering", 0, true)
end



RegisterNetEvent('qb-mine:client:SuplphidePro')
AddEventHandler('qb-mine:client:SuplphidePro', function()
    RefiningProcess3()
end)


RegisterNetEvent('qb-mine:client:RockPro')
AddEventHandler('qb-mine:client:RockPro', function()
    washingProcess()
end)


RegisterNetEvent('qb-mine:client:OxidePro')
AddEventHandler('qb-mine:client:OxidePro', function()
    RefiningProcess2()
end)


RegisterNetEvent('qb-mine:client:CarbPro')
AddEventHandler('qb-mine:client:CarbPro', function()
    RefiningProcess1()
end)



function RefiningProcess1()
    QBCore.Functions.Progressbar("refining_Carbonated_ore", "Refining Carbonate Ore..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:washore")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function RefiningProcess2()
    QBCore.Functions.Progressbar("refining_oxide", "Refining Oxide Ore..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:washoxide")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function RefiningProcess3()
    QBCore.Functions.Progressbar("refining_Sulphide", "Refining Sulphide..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:wassulphide")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function PrepareAnim()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "world_human_hammering", 0, true)
end

function washingProcess()
    QBCore.Functions.Progressbar("washing_rocks", "Washing..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:washrock")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function PrepareAnim()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "world_human_hammering", 0, true)
end

-- RegisterNetEvent('qb-mine:client:processsulphide')
-- AddEventHandler('qb-mine:client:processsulphide', function()
--     print("reached refining point")
--     TriggerServerEvent('qb-mine:Server:processsulphideReward')
-- end)


-- RegisterNetEvent('qb-mine:client:processcarbonate_ore')
-- AddEventHandler('qb-mine:client:processcarbonate_ore', function()
--     print("reached refining point")
--  TriggerServerEvent('qb-mine:Server:processcarbonate_oreReward')
-- end)


-- RegisterNetEvent('qb-mine:client:processoxide')
-- AddEventHandler('qb-mine:client:processoxide', function()
--     print("reached refining point")
--     TriggerServerEvent('qb-mine:Server:processoxideReward')
-- end)


-- RegisterNetEvent("qb-mine:client:processrock")
-- AddEventHandler("qb-mine:client:processrock", function()
--     print("reached washing point")
--     TriggerServerEvent("qb-mine:Server:RockProcessReward")
-- end)


RegisterNetEvent('qb-mine:client:refinedPro1')
AddEventHandler('qb-mine:client:refinedPro1', function()
    processrefined1()
end)

RegisterNetEvent('qb-mine:client:refinedPro2')
AddEventHandler('qb-mine:client:refinedPro2', function()
    processrefined2()
end)

RegisterNetEvent('qb-mine:client:refinedPro3')
AddEventHandler('qb-mine:client:refinedPro3', function()
    processrefined3()
end)

RegisterNetEvent('qb-mine:client:refinedPro4')
AddEventHandler('qb-mine:client:refinedPro4', function()
    processrefined4()
end)

RegisterNetEvent('qb-mine:client:refinedPro5')
AddEventHandler('qb-mine:client:refinedPro5', function()
    processrefined5()
end)

RegisterNetEvent('qb-mine:client:refinedPro6')
AddEventHandler('qb-mine:client:refinedPro6', function()
    processrefined6()
end)


function processrefined1()
    QBCore.Functions.Progressbar("refining_Sulphide", "Refining..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:refined_copper")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function processrefined2()
    QBCore.Functions.Progressbar("refining_Sulphide", "Refining..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:refined_lead")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function processrefined3()
    QBCore.Functions.Progressbar("refining_Sulphide", "Refining..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:refined_zinc")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function processrefined4()
    QBCore.Functions.Progressbar("refining_Sulphide", "Refining..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:reinforced_metal")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function processrefined5()
    QBCore.Functions.Progressbar("refining_Sulphide", "Refining..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:reinforced_aluminum")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function processrefined6()
    QBCore.Functions.Progressbar("refining_Sulphide", "Refining..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-mine:server:hardened_steel")
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        ClearPedProp(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end