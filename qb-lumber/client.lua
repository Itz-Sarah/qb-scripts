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
    woodblip = AddBlipForCoord(-573.03, 5509.68, 55.56)

    SetBlipSprite (woodblip, 285)
    SetBlipDisplay(woodblip, 4)
    SetBlipScale  (woodblip, 0.8)
    SetBlipColour (woodblip, 0)
	SetBlipAlpha (woodblip, 0.9)
    SetBlipAsShortRange(woodblip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Wood Chopping")
    EndTextCommandSetBlipName(woodblip)
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

        if distance3 < 250 then
            inRange = true

            if distance1 < 5 then
                DrawText3Ds(-573.03, 5509.68, 55.56, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine = mine + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance2 < 5 then
                DrawText3Ds(-556.35, 5511.8, 59.71, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine2 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine2 = mine2 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance3 < 5 then
                DrawText3Ds(-554.29, 5539.98, 59.88, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine3 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine3 = mine3 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance4 < 5 then
                DrawText3Ds(-537.94, 5548.91, 61.9, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine4 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine4 = mine4 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance5 < 5 then
                DrawText3Ds(-524.22, 5569.48, 65.77, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine5 ==0 then
                    chopProcess()
                    PrepareAnim()
                    mine5 = mine5 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance6 < 5 then
                DrawText3Ds(-487.09, 5545.32, 74.4, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine6 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine6 = mine6 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance7 < 5 then
                DrawText3Ds(-644.99, 5269.92, 73.44, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine7 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine7 = mine7 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance8 < 5 then
                DrawText3Ds(-643.84, 5242.01, 75.25, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine8 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine8 = mine8 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance9 < 5 then
                DrawText3Ds(-601.24, 5240.01, 71.58, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine9 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine9 = mine8 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance10 < 5 then
                DrawText3Ds(-718.32, 5273.9, 76.66, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine11 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine10 = mine10 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance11 < 5 then
                DrawText3Ds(-755.35, 5277.62, 85.94, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine11 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine11 = mine11 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

                end
                end
            end

            if distance12 < 5 then
                DrawText3Ds(-767.31, 5316.4, 75.61, "[E] Start Chopping")
                if IsControlJustPressed(0, 38) then if mine12 == 0 then
                    chopProcess()
                    PrepareAnim()
                    mine12 = mine12 + 1
                else
                    QBCore.Functions.Notify('You have already Chopped this spot.', 'error', 3500)

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

function chopProcess()
    QBCore.Functions.Progressbar("grind_coke", "Chopping..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        print("Progess done")
        TriggerServerEvent("lumberchop")
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


RegisterNetEvent('qb-mine:client:WoodPro')
AddEventHandler('qb-mine:client:WoodPro', function()
    WoodProcess()
end)


RegisterNetEvent('qb-lumber:client:CharPro')
AddEventHandler('qb-lumber:client:CharPro', function()
    RefiningProcess1()
end)



function RefiningProcess1()
    QBCore.Functions.Progressbar("refining_Carbonated_ore", "Burning Wood..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-lumber:server:charc")
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

function WoodProcess()
    QBCore.Functions.Progressbar("washing_rocks", "Refining..", math.random(3000,6000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-lumber:server:refine")
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