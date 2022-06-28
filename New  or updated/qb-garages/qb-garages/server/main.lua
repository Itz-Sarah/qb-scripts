local QBCore = exports['qb-core']:GetCoreObject()
local OutsideVehicles = {}

-- Events

RegisterNetEvent("qb-garages:server:addjobvehicle", function(plate)
    print(plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('UPDATE player_vehicles SET job = ? WHERE citizenid = ? AND plate = ?', {pData.PlayerData.job.name, pData.PlayerData.citizenid, plate})
end)


RegisterNetEvent('qb-garages:server:UpdateOutsideVehicles', function(Vehicles)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local CitizenId = Ply.PlayerData.citizenid
    OutsideVehicles[CitizenId] = Vehicles
end)

RegisterNetEvent('qb-garage:server:PayDepotPrice', function(vehicle, garage)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
    local bankBalance = Player.PlayerData.money["bank"]
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE plate = ?', {vehicle.plate}, function(result)
        if result[1] then
            if cashBalance >= result[1].depotprice then
                Player.Functions.RemoveMoney("cash", result[1].depotprice, "paid-depot")
                TriggerClientEvent("qb-garages:client:takeOutDepot", src, vehicle, garage)
            elseif bankBalance >= result[1].depotprice then
                Player.Functions.RemoveMoney("bank", result[1].depotprice, "paid-depot")
                TriggerClientEvent("qb-garages:client:takeOutDepot", src, vehicle, garage)
            else
                TriggerClientEvent('QBCore:Notify', src, 'Not enough money', 'error')
            end
        end
    end)
end)

RegisterNetEvent('qb-garage:server:JobPayDepotPrice', function(vehicle, garage)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
    local bankBalance = Player.PlayerData.money["bank"]
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE plate = ?', {vehicle.plate}, function(result)
        if result[1] then
            if cashBalance >= result[1].depotprice then
                Player.Functions.RemoveMoney("cash", result[1].depotprice, "paid-depot")
                TriggerClientEvent("qb-garages:client:JobtakeOutDepot", src, vehicle, garage)
            elseif bankBalance >= result[1].depotprice then
                Player.Functions.RemoveMoney("bank", result[1].depotprice, "paid-depot")
                TriggerClientEvent("qb-garages:client:JobtakeOutDepot", src, vehicle, garage)
            else
                TriggerClientEvent('QBCore:Notify', src, 'Not enough money', 'error')
            end
        end
    end)
end)


RegisterNetEvent('qb-garage:server:updateVehicleState', function(state, plate, garage)
    exports.oxmysql:execute('UPDATE player_vehicles SET state = ?, garage = ?, depotprice = ? WHERE plate = ?',{state, garage, 0, plate})
end)

RegisterNetEvent('qb-garage:server:updateVehicleStatus', function(fuel, engine, body, plate, garage)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    if engine > 1000 then
        engine = engine / 1000
    end

    if body > 1000 then
        body = body / 1000
    end

    exports.oxmysql:execute('UPDATE player_vehicles SET fuel = ?, engine = ?, body = ? WHERE plate = ? AND citizenid = ? AND garage = ?',{fuel, engine, body, plate, pData.PlayerData.citizenid, garage})
end)

RegisterServerEvent('qb-vehicletuning:server:SaveVehiclecoords', function(vehiclepos, plate)
    exports.oxmysql:execute('UPDATE player_vehicles SET coordsx = ?, coordsy = ?, coordsz = ? WHERE plate = ?',{json.encode(vehiclepos.x), json.encode(vehiclepos.y), json.encode(vehiclepos.z), plate})
end)

RegisterServerEvent('qb-vehicletuning:server:SaveVehicleheading', function(vehicleheading, plate)
    exports.oxmysql:execute('UPDATE player_vehicles SET heading = ? WHERE plate = ?',{json.encode(vehicleheading), plate})
end)

RegisterServerEvent('qb-garages:server:GetPubliceVehiclecoords')
AddEventHandler('qb-garages:server:GetPubliceVehiclecoords', function(vehicle)
    print("I have arrived")
    local source = source
    vehicle = vehicle
    local plate = vehicle.plate
    print(plate)
    local result = exports.oxmysql:executeSync('SELECT * FROM player_vehicles WHERE plate = ?', {plate})
    local carinfo = result[1]
    if carinfo then
        local PublicSpawnPointsx = json.decode(carinfo.coordsx)
        local PublicSpawnPointsy = json.decode(carinfo.coordsy)
        local PublicSpawnPointsz = json.decode(carinfo.coordsz)
        local PublicSpawnPointHeading = json.decode(carinfo.heading)
        print(PublicSpawnPointsx)
        print(PublicSpawnPointsy)
        print(PublicSpawnPointsz)
        print(PublicSpawnPointHeading)
        print(vehicle)
            TriggerClientEvent('qb-garages:client:takeOutPublicGarage', source , vehicle, PublicSpawnPointsx, PublicSpawnPointsy, PublicSpawnPointsz, PublicSpawnPointHeading)
    end
end)

-- Callbacks

QBCore.Functions.CreateCallback("qb-garage:server:checkVehicleOwner", function(source, cb, plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?',{plate, pData.PlayerData.citizenid}, function(result)
        if result[1] then
            cb(true)
        else
            cb(false)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:checkVehiclePD", function(source, cb, plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE plate = ? AND job = ?',{plate, pData.PlayerData.job.name}, function(result)
        if result[1] then
            cb(true)
        else
            cb(false)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetOutsideVehicles", function(source, cb)
    local Ply = QBCore.Functions.GetPlayer(source)
    local CitizenId = Ply.PlayerData.citizenid
    if OutsideVehicles[CitizenId] and next(OutsideVehicles[CitizenId]) then
        cb(OutsideVehicles[CitizenId])
    else
        cb(nil)
    end
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetUserVehicles", function(source, cb, garage)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE citizenid = ? AND garage = ?', {pData.PlayerData.citizenid, garage}, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetUserVehiclesPD", function(source, cb, garage)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    print(pData.PlayerData.job.name)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE job = ? AND garage = ?', {pData.PlayerData.job.name, garage}, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetVehicleProperties", function(source, cb, plate)
    local src = source
    local properties = {}
    local result = exports.oxmysql:executeSync('SELECT mods FROM player_vehicles WHERE plate = ?', {plate})
    if result[1] then
        properties = json.decode(result[1].mods)
    end
    cb(properties)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetDepotVehicles", function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE citizenid = ? AND state = ?',{pData.PlayerData.citizenid, 0}, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetJobDepotVehicles", function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE citizenid = ? AND state = ? AND job = ?',{pData.PlayerData.citizenid, 0, pData.PlayerData.job.name}, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetHouseVehicles", function(source, cb, house)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE garage = ?', {house}, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:checkVehicleHouseOwner", function(source, cb, plate, house)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
        if result[1] then
            local hasHouseKey = exports['qb-houses']:hasKey(result[1].license, result[1].citizenid, house)
            if hasHouseKey then
                cb(true)
            else
                cb(false)
            end
        else
            cb(false)
        end
    end)
end)

QBCore.Functions.CreateCallback('qb-garage:server:GetPlayerVehicles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Vehicles = {}

    MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid}, function(result)
        if result[1] then
            for k, v in pairs(result) do
                local VehicleData = QBCore.Shared.Vehicles[v.vehicle]
    
                local VehicleGarage = Lang:t("error.no_garage")
                if v.garage ~= nil then
                    if Garages[v.garage] ~= nil then
                        VehicleGarage = Garages[v.garage].label
                    else
                        VehicleGarage = Lang:t("info.house_garage")         -- HouseGarages[v.garage].label
                    end
                end

                if v.state == 0 then
                    v.state = Lang:t("status.out")
                elseif v.state == 1 then
                    v.state = Lang:t("status.garaged")
                elseif v.state == 2 then
                    v.state = Lang:t("status.impound")
                end
                
                local fullname 
                if VehicleData["brand"] ~= nil then
                    fullname = VehicleData["brand"] .. " " .. VehicleData["name"]
                else
                    fullname = VehicleData["name"]
                end    
                Vehicles[#Vehicles+1] = {
                    fullname = fullname,
                    brand = VehicleData["brand"],
                    model = VehicleData["name"],
                    plate = v.plate,
                    garage = VehicleGarage,
                    state = v.state,
                    fuel = v.fuel,
                    engine = v.engine,
                    body = v.body
                }
            end
            cb(Vehicles)
        else
            cb(nil)
        end
    end)
end)