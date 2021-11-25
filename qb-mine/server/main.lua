local ItemList = {
    ["rock"] = "rock"
}

local OreRewardlist = {
    ["Oxide"] = "Oxide Ore", --add
    ["Carbonate_Ore"] = "Carbonate Ore",--add
    ["Sulphide"] = "Sulphide Ore" --add
}

local SulphideRewardlist = {
    ["copper"] = "copper",
    ["zinc"] = "zinc", --add
    ["lead"] = "lead"  -- add
}

local OxideRewardlist = {
    ["aluminumoxide"] = "aluminumoxide",
    ["ironoxide"] = "ironoxide",
    ["copperoxide"] = "copperoxide" --add
}

local CarbonateOreRewardlist = {
    ["steel"] = "steel",
    ["iron"] = "iron",
    ["aluminum"] = "aluminum",
    ["metalscrap"] = "metalscrap" --add
}

local src = source

RegisterServerEvent("qb-mine:server:mine")
AddEventHandler("qb-mine:server:mine", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("rock", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rock'], "add")
end)


RegisterServerEvent("qb-mine:server:washrock")
AddEventHandler("qb-mine:server:washrock", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rock = Player.Functions.GetItemByName('rock')

    if Player.PlayerData.items ~= nil then
        if rock ~= nil then
            if rock.amount >= 1 then
                Player.Functions.RemoveItem("rock", 1)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rock'], "remove")
                    RockrewardsProcess(source)
            else
                    TriggerClientEvent('QBCore:Notify', src, "You dont have enough rocks on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough rocks on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-mine:server:washoxide")
AddEventHandler("qb-mine:server:washoxide", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Oxide = Player.Functions.GetItemByName('oxide')
        print("reached server")
    if Player.PlayerData.items ~= nil then
        if Oxide ~= nil then
            if Oxide.amount >= 1 then
                Player.Functions.RemoveItem("oxide", 1)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['oxide'], "remove")
                    processoxideReward(source)
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Oxide ore on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Oxide ore on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-mine:server:washore")
AddEventHandler("qb-mine:server:washore", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Carbonate_Ore = Player.Functions.GetItemByName('carbonate_ore')
    print("reached server")
    if Player.PlayerData.items ~= nil then
        if Carbonate_Ore ~= nil then
            if Carbonate_Ore.amount >= 1 then
                Player.Functions.RemoveItem("carbonate_ore", 1)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carbonate_ore'], "remove")
                    processcarbonate_oreReward(source)
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Carbonate ore on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Carbonate ore on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-mine:server:wassulphide")
AddEventHandler("qb-mine:server:wassulphide", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Sulphide = Player.Functions.GetItemByName('sulphide')
    print("reached server")
    if Player.PlayerData.items ~= nil then
        if Sulphide ~= nil then
            if Sulphide.amount >= 1 then
                Player.Functions.RemoveItem("sulphide", 1)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sulphide'], "remove")
                    processsulphideReward(source)
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Sulphide ore on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Sulphide ore on you", 'error')
        end
    end
end)

function RockrewardsProcess(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)

    print(Rewardchance)
    print(BigReward)

    if Rewardchance <= 50 then
        Player.Functions.AddItem("oxide", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['oxide'], "add")
    else
        Player.Functions.AddItem("carbonate_ore", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carbonate_ore'], "add")
    end

    if BigReward >= 50 then
        Player.Functions.AddItem("sulphide", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sulphide'], "add")
    end
end

function processoxideReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)

    print(Rewardchance)
    print(BigReward)

    if Rewardchance <= 50 then
        Player.Functions.AddItem("ironoxide", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ironoxide'], "add")
    else
        Player.Functions.AddItem("copperoxide", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['copperoxide'], "add")
    end

    if BigReward >= 50 then
        Player.Functions.AddItem("aluminumoxide", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['aluminumoxide'], "add")
    end
end

function processcarbonate_oreReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)

    print(Rewardchance)
    print(BigReward)

    if Rewardchance <= 50 then
        Player.Functions.AddItem("iron", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['iron'], "add")
    else
        Player.Functions.AddItem("metalscrap", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add")
    end

    if BigReward >= 50 then
        Player.Functions.AddItem("steel", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['steel'], "add")
    else
        Player.Functions.AddItem("aluminum", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['aluminum'], "add")

    end
end

function processsulphideReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)

    print(Rewardchance)
    print(BigReward)

    if Rewardchance <= 50 then
        Player.Functions.AddItem("copper", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['copper'], "add")
    else
        Player.Functions.AddItem("lead", math.random(2,4))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lead'], "add")
    end

    if BigReward >= 50 then
        Player.Functions.AddItem("zinc", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['zinc'], "add")
    end
end

-- refinded shitz

RegisterServerEvent("qb-mine:server:refined_copper")
AddEventHandler("qb-mine:server:refined_copper", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Copper = Player.Functions.GetItemByName('copper')
    local CopperOxide = Player.Functions.GetItemByName('copperoxide')
    print("reached server")
    if Player.PlayerData.items ~= nil then
        if Copper ~= nil then
            if Copper.amount >= 3 then
                if CopperOxide ~= nil then
                    if CopperOxide.amount >= 4 then 
                        Player.Functions.RemoveItem("copper", 3)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['copper'], "remove")
                        Player.Functions.RemoveItem("copperoxide", 4)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['copperoxide'], "remove")
                            processrefinedcopperReward(source)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff ore on you", 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff ore on you", 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-mine:server:refined_lead")
AddEventHandler("qb-mine:server:refined_lead", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local lead = Player.Functions.GetItemByName('lead')
    local IronOxide = Player.Functions.GetItemByName('ironoxide')
    print("reached server")
    if Player.PlayerData.items ~= nil then
        if Copper ~= nil then
            if Copper.amount >= 3 then
                if IronOxide ~= nil then
                    if IronOxide.amount >= 4 then 
                        Player.Functions.RemoveItem("lead", 3)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lead'], "remove")
                        Player.Functions.RemoveItem("ironoxide", 4)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ironoxide'], "remove")
                            processrefinedleadReward(source)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff ore on you", 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff ore on you", 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-mine:server:refined_zinc")
AddEventHandler("qb-mine:server:refined_zinc", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local zinc = Player.Functions.GetItemByName('zinc')
    local IronOxide = Player.Functions.GetItemByName('ironoxide')
    print("reached server")
    if Player.PlayerData.items ~= nil then
        if Copper ~= nil then
            if Copper.amount >= 3 then
                if IronOxide ~= nil then
                    if IronOxide.amount >= 4 then 
                        Player.Functions.RemoveItem("zinc", 3)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['zinc'], "remove")
                        Player.Functions.RemoveItem("ironoxide", 4)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ironoxide'], "remove")
                            processrefinedzincReward(source)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-mine:server:reinforced_metal")
AddEventHandler("qb-mine:server:reinforced_metal", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local iron = Player.Functions.GetItemByName('iron')
    local metalscrap = Player.Functions.GetItemByName('metalscrap')
    print("reached server")
    if Player.PlayerData.items ~= nil then
        if iron ~= nil then
            if iron.amount >= 5 then
                if metalscrap ~= nil then
                    if metalscrap.amount >= 7 then 
                        Player.Functions.RemoveItem("iron", 5)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['iron'], "remove")
                        Player.Functions.RemoveItem("metalscrap", 7)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "remove")
                            processreinforcedmetalReward(source)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-mine:server:reinforced_aluminum")
AddEventHandler("qb-mine:server:reinforced_aluminum", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local aluminum = Player.Functions.GetItemByName('aluminum')
    local aluminumoxide = Player.Functions.GetItemByName('aluminumoxide')
    print("reached server")
    if Player.PlayerData.items ~= nil then
        if aluminum ~= nil then
            if aluminum.amount >= 3 then
                if aluminumoxide ~= nil then
                    if aluminumoxide.amount >= 5 then 
                        Player.Functions.RemoveItem("aluminum", 3)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['aluminum'], "remove")
                        Player.Functions.RemoveItem("aluminumoxide", 5)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['aluminumoxide'], "remove")
                            processreinforcedaluminumReward(source)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
        end
    end
end)

RegisterServerEvent("qb-mine:server:hardened_steel")
AddEventHandler("qb-mine:server:hardened_steel", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local steel = Player.Functions.GetItemByName('steel')
    local iron = Player.Functions.GetItemByName('iron')
    print("reached server")
    if Player.PlayerData.items ~= nil then
        if steel ~= nil then
            if steel.amount >= 3 then
                if iron ~= nil then
                    if iron.amount >= 5 then 
                        Player.Functions.RemoveItem("steel", 3)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['steel'], "remove")
                        Player.Functions.RemoveItem("iron", 5)
                            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['iron'], "remove")
                            processOxidisedstealReward(source)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough Stuff on you", 'error')
        end
    end
end)

function processrefinedcopperReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem("refined_copper", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['refined_copper'], "add")
end

function processrefinedleadReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem("refined_lead", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['refined_lead'], "add")
end

function processrefinedzincReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem("refined_zinc", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['refined_zinc'], "add")
end

function processreinforcedmetalReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem("reinforced_metal", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['reinforced_metal'], "add")
end

function processreinforcedaluminumReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem("reinforced_aluminum", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['reinforced_aluminum'], "add")
end

function processOxidisedstealReward(source)
    local Rewardchance = math.random(1,100)
    local BigReward = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem("hardened_steel", math.random(1,2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['hardened_steel'], "add")
end