local ItemList = {
    ["lumber"] = "lumber" --add
}

local WoodRewardlist = {
    ["wood"] = "Wood", --add
    ["thatch"] = "Thatch"--add
}

local CharcoalRewardlist = {
    ["charcoal"] = "charcoal", -- add
}


RegisterServerEvent("lumberchop")
AddEventHandler("lumberchop", function()
    local src = source
    print("reached server")
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("lumber", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lumber'], "add")
end)


RegisterServerEvent("qb-lumber:server:refine")
AddEventHandler("qb-lumber:server:refine", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local lumber = Player.Functions.GetItemByName('lumber')

    if Player.PlayerData.items ~= nil then
        if lumber ~= nil then
            if lumber.amount >= 1 then
                Player.Functions.RemoveItem("lumber", 1)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lumber'], "remove")
                    refinereward(source)
            else
                    TriggerClientEvent('QBCore:Notify', src, "You dont have enough lumber on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough lumber on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-lumber:server:charc")
AddEventHandler("qb-lumber:server:charc", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local wood = Player.Functions.GetItemByName('wood')
        print("reached server")
    if Player.PlayerData.items ~= nil then
        if wood ~= nil then
            if wood.amount >= 1 then
                Player.Functions.RemoveItem("wood", 1)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wood'], "remove")
                    charcreward(source)
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Wood on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Wood on you", 'error')
        end
    end
end)

function charcreward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)

    print(Rewardchance)
    print(BigReward)

    if Rewardchance <= 50 then
        Player.Functions.AddItem("charcoal", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['charcoal'], "add")
    else
        Player.Functions.AddItem("charcoal", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['charcoal'], "add")
    end

    if BigReward >= 50 then
        Player.Functions.AddItem("charcoal", math.random(2,3))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['charcoal'], "add")
    end
end

function refinereward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)

    print(Rewardchance)
    print(BigReward)

    if Rewardchance <= 50 then
        Player.Functions.AddItem("wood", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wood'], "add")
    else
        Player.Functions.AddItem("wood", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wood'], "add")
    end

    if BigReward >= 50 then
        Player.Functions.AddItem("thatch", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['thatch'], "add")
    else
        Player.Functions.AddItem("thatch", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['thatch'], "add")

    end
end