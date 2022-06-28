-- In this config, you can change your componets for upgrades, the amount you need per componet per upgrade. 
-- Further down you will see locations, new locations can be added from there, to open more mechanic shops around your city! 
-- Have fun, if you need help message me on Discord : Sarah#4321
target = {
    set = "qb-target" -- change to bt-target (if using bt-Target) Please note bt-target is an old version of the new and improved qb-target. 
}

Engine ={
    ["components"] = {
        item1 = 'reinforced_metal', -- shared.lua items
        item2 = 'reinforced_aluminum',
        item3 = 'refined_copper',
        item4 = 'hardened_steel'
    },

    ["level1"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper", -- changes the menu when you look at what is needed 
        item1ammount = 4, -- amount needed to craft item 1 and 2 and 3 going down
        item2ammount = 6,
        item3ammount = 12
    },

    ["level2"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 8,
        item2ammount = 12,
        item3ammount = 25
    },

    ["level3"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 15,
        item2ammount = 18,
        item3ammount = 36
    },

    ["level4"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 20,
        item2ammount = 127,
        item3ammount = 40
    },

    ["level5"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper, Hardened Steel",
        item1ammount = 30,
        item2ammount = 140,
        item3ammount = 50,
        item4ammount = 120
    },
}

Suspension = {
    ["components"] = {
        item1 = 'reinforced_metal',
        item2 = 'reinforced_aluminum',
        item3 = 'hardened_steel',
        item4 = 'refined_copper'
    },

    ["level1"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Hardened Steel",
        item1ammount = 4,
        item2ammount = 6,
        item3ammount = 12
    },

    ["level2"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Hardened Steel",
        item1ammount = 8,
        item2ammount = 12,
        item3ammount = 25
    },

    ["level3"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Hardened Steel",
        item1ammount = 15,
        item2ammount = 18,
        item3ammount = 36
    },

    ["level4"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Hardened Steel",
        item1ammount = 20,
        item2ammount = 27,
        item3ammount = 40
    },

    ["level5"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Hardened Steel, Refined Copper",
        item1ammount = 30,
        item2ammount = 40,
        item3ammount = 50,
        item4ammount = 20
    },
}

brakes ={
    ["components"] = {
        item1 = 'hardened_steel',
        item2 = 'refined_lead',
        item3 = 'refined_zinc',
        item4 = 'reinforced_aluminum'
    },

    ["level1"] = {
        items = "Hardened Steel, Refined Lead, Refined Zinc",
        item1ammount = 4,
        item2ammount = 6,
        item3ammount = 12
    },

    ["level2"] = {
        items = "Hardened Steel, Refined Lead, Refined Zinc",
        item1ammount = 8,
        item2ammount = 12,
        item3ammount = 25
    },

    ["level3"] = {
        items = "Hardened Steel, Refined Lead, Refined Zinc",
        item1ammount = 15,
        item2ammount = 18,
        item3ammount = 36
    },

    ["level4"] = {
        items = "Hardened Steel, Refined Lead, Refined Zinc",
        item1ammount = 20,
        item2ammount = 27,
        item3ammount = 40
    },

    ["level5"] = {
        items = "Hardened Steel, Refined Lead, Refined Zinc, Reinforced Aluminum",
        item1ammount = 30,
        item2ammount = 40,
        item3ammount = 50,
        item4ammount = 120
    },
}

transmission ={
    ["components"] = {
        item1 = 'reinforced_metal',
        item2 = 'reinforced_aluminum',
        item3 = 'refined_copper',
        item4 = 'hardened_steel'
    },

    ["level1"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 4,
        item2ammount = 6,
        item3ammount = 12
    },

    ["level2"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 8,
        item2ammount = 12,
        item3ammount = 25
    },

    ["level3"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 15,
        item2ammount = 18,
        item3ammount = 36
    },

    ["level4"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 20,
        item2ammount = 27,
        item3ammount = 40
    },

    ["level5"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper, Hardened Steel",
        item1ammount = 30,
        item2ammount = 40,
        item3ammount = 50,
        item4ammount = 120
    },
}

armour ={
    ["components"] = {
        item1 = 'reinforced_metal',
        item2 = 'reinforced_aluminum',
        item3 = 'refined_copper',
        item4 = 'hardened_steel'
    },

    ["level1"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 4,
        item2ammount = 6,
        item3ammount = 12
    },

    ["level2"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 8,
        item2ammount = 12,
        item3ammount = 25
    },

    ["level3"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 15,
        item2ammount = 18,
        item3ammount = 36
    },

    ["level4"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper",
        item1ammount = 20,
        item2ammount = 27,
        item3ammount = 40
    },

    ["level5"] = {
        items = "Reinforced Metal, Reinforced Aluminum, Refined Copper, Hardened Steel",
        item1ammount = 30,
        item2ammount = 40,
        item3ammount = 50,
        item4ammount = 120
    },
}

raceharness = {
    ["components"] = {
        item1 = 'leather',
        item2 = 'thatch',
        item3 = 'reinforced_aluminum'
    },
    ["level"] = {
        items = "Figure it out",
        item1ammount = 4,
        item2ammount = 6,
        item3ammount = 12
    },
}

tunerchip ={
    ["components"] = {
        item1 = 'security_card_01',
        item2 = 'trojan_usb',
        item3 = 'electronickit'
    },
    ["level"] = {
        items = "Figure it out",
        item1ammount = 2,
        item2ammount = 4,
        item3ammount = 7
    },
}

nitrous ={
    ["components"] = {
        item1 = 'reinforced_aluminum',
        item2 = 'refined_copper',
        item3 = 'aluminumoxide'
    },
    ["level"] = {
        items = "Figure it out",
        item1ammount = 8,
        item2ammount = 12,
        item3ammount = 20
    },
}
-- Locations
    -- Copy one past and change the varibles, from there you should get a new location at your new store

storage ={
    ["Hayes"] = {
        label = "HayesStorage1",
        coords = vector3(-1409.51, -438.81, 35.91),
        debugPoly = false,
        heading = 30,
        minZ= 34.91,
        maxZ= 36.91,
        job = "hayes"
    },
    ["Benny\'s"] = {
        label = "Benny\'sStorage1",
        coords = vector3(-24.89, -1059.49, 28.4),
        debugPoly = false,
        heading = 150,
        minZ= 28.21,
        maxZ= 29.01,
        job = "bennys"
    },
    ["Lux"] = {
        label = "LuxStorage1",
        coords = vector3(-322.16, -141.06, 39.01),
        debugPoly = false,
        heading = 155,
        minZ= 38.81,
        maxZ= 39.21,
        job = "mechanic"
    },
}

crafting1 ={ -- TIER 1 & 2
    ["Hayes"] = {
        label = "HayesBench1",
        coords = vector3(-1406.42, -446.88, 35.91),
        debugPoly= false,
        heading= 122,
        minZ= 34.91,
        maxZ= 36.91,
        job = "hayes"
    },
    ["Benny\'s"] = {
        label = "Benny\'sBench1",
        coords = vector3(-37.79, -1039.46, 28.6),
        debugPoly = false,
        heading = 30,
        minZ= 28.21,
        maxZ= 29.01,
        job = "bennys"
    },
    ["Lux"] = {
        label = "LuxBench1",
        coords = vector3(-343.92, -141.02, 39.01),
        debugPoly = false,
        heading = 245,
        minZ= 38.81,
        maxZ= 39.21,
        job = "mechanic"
    },
}

crafting2 ={ -- TIER 3 & 4
    ["Hayes"] = {
        label = "HayesBench2",
        coords = vector3(-1408.23, -447.97, 35.91),
        debugPoly= false,
        heading= 122,
        minZ= 34.91,
        maxZ= 36.91,
        job = "hayes"
    },
    ["Benny\'s"] = {
        label = "Benny\'sBench2",
        coords = vector3(-34.04, -1037.31, 28.6),
        debugPoly = false,
        heading = 120,
        minZ= 28.21,
        maxZ= 29.01,
        job = "bennys"
    },
    ["Lux"] = {
        label = "LuxBench2",
        coords = vector3(-346.01, -130.45, 39.01),
        debugPoly = false,
        heading = 160,
        minZ= 38.81,
        maxZ= 39.21,
        job = "mechanic"
    },
}

crafting3 ={ -- TIER 5 & armour
    ["Hayes"] = {
        label = "HayesBench3",
        coords = vector3(-1414.2, -451.75, 35.91),
        debugPoly= false,
        heading= 122,
        minZ= 34.91,
        maxZ= 36.91,
        job = "hayes"
    },
    ["Benny\'s"] = {
        label = "Benny\'sBench3",
        coords = vector3(-35.29, -1041.53, 28.6),
        debugPoly = false,
        heading = 210,
        minZ= 28.21,
        maxZ= 29.01,
        job = "bennys"
    },
    ["Lux"] = {
        label = "LuxBench3",
        coords = vector3(-323.93, -129.21, 39.01),
        debugPoly = false,
        heading = 245,
        minZ= 38.81,
        maxZ= 39.21,
        job = "mechanic"
    },
}

crafting4 ={ -- RACING & armour
    ["Hayes"] = {
        label = "HayesBench4",
        coords = vector3(-1416.09, -452.99, 35.91),
        debugPoly= false,
        heading=122,
        minZ=34.91,
        maxZ=36.91,
        job = "hayes"
    },
    ["Benny\'s"] = {
        label = "Benny\'sBench4",
        coords = vector3(-36.03, -1070.09, 28.4),
        debugPoly = false,
        heading = 210,
        minZ= 28.21,
        maxZ= 29.01,
        job = "bennys"
    },
    ["Lux"] = {
        label = "LuxBench4",
        coords = vector3(-339.91, -142.37, 39.01),
        debugPoly = false,
        heading = 245,
        minZ= 38.81,
        maxZ= 39.21,
        job = "mechanic"
    },
}