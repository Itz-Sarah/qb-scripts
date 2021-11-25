RegisterServerEvent("qb-vu:bill:player")
AddEventHandler("qb-vu:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'vu' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        exports.oxmysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)


QBCore.Functions.CreateCallback('qb-vu:server:get:ingredientcocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocktailmix = Ply.Functions.GetItemByName("vu-cocktailmix")
    local cocktailglass = Ply.Functions.GetItemByName("vu-cocktailglass")
    local umbrella = Ply.Functions.GetItemByName("vu-umbrella")
    local ice = Ply.Functions.GetItemByName("vu-ice")
    if cocktailmix ~= nil and cocktailglass ~= nil and umbrella ~= nil and ice ~= nil then
        if cocktailmix.amount > 2 and cocktailglass.amount > 1 and umbrella.amount > 1 and ice.amount > 1 then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-vu:server:get:ingredientWhiskey', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local whiskey = Ply.Functions.GetItemByName("vu-whiskeyshot")
    local whiskeyglass = Ply.Functions.GetItemByName("vu-whiskeyglass")
    local umbrella = Ply.Functions.GetItemByName("vu-umbrella")
    local olive = Ply.Functions.GetItemByName("vu-olive")
    if whiskey ~= nil and whiskeyglass ~= nil and umbrella ~= nil and olive ~= nil then
        if whiskey.amount > 2 and whiskeyglass.amount > 1 and umbrella.amount > 1 and olive.amount > 1 then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-vu:server:get:ingredientPeanut', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local servingdish = Ply.Functions.GetItemByName("vu-servingdish")
    local peanutpacket = Ply.Functions.GetItemByName("vu-peanutpacket")
    if servingdish ~= nil and peanutpacket ~= nil then
        if peanutpacket.amount > 2 and servingdish.amount > 1 then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-vu:server:get:ingredientJager', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local redgull = Ply.Functions.GetItemByName("vu-redgull")
    local shotglass = Ply.Functions.GetItemByName("vu-shotglass")
    local jager = Ply.Functions.GetItemByName("vu-jager")
    if redgull ~= nil and shotglass ~= nil and jager ~= nil then
        if redgull.amount > 1 and shotglass.amont > 1 and jager > 1 then 
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)


QBCore.Functions.CreateCallback('qb-vu:server:get:ingredientSourz', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local shotglass = Ply.Functions.GetItemByName("vu-shotglass")
    local sourzmix = Ply.Functions.GetItemByName("vu-sourzmix")
    if shotglass ~= nil and sourzmix ~= nil then
        if shotglass.amount > 1 and sourzmix > 1 then
            cb(true)
        else 
            cb(false)
        end
    else
        cb(false)
    end
end)


QBCore.Functions.CreateCallback('qb-vu:server:get:ingredientdontstopdrinking', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local peanuts = Ply.Functions.GetItemByName("vu-peanuts")
    local whiskey = Ply.Functions.GetItemByName("vu-whiskey")
    local cocktail = Ply.Functions.GetItemByName("vu-cocktail")
    if fries ~= nil and heartstopper ~= nil and software ~= nil then
        if cocktail.amount > 3 and whiskey.amount > 3 and cocktail.amount > 2 then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)


QBCore.Functions.CreateUseableItem("vu-dontstopdrinking", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-vu:MurderMeal", source, item.name)
  end)



