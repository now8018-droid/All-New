ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("LUV.CORE:SAVEHEALTH:SETHEALTH")
AddEventHandler("LUV.CORE:SAVEHEALTH:SETHEALTH", function(ARRAY)
    SetEntityHealth(PlayerPedId(), ARRAY.health)
    SetPedArmour(PlayerPedId(), ARRAY.armour)
end)