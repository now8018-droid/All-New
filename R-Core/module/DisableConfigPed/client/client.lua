
Citizen.CreateThread(function()
	while true do
		Wait(1000)
		local Ped = PlayerPedId()
		ClearPedBloodDamage(Ped)
		RemoveDecalsInRange(1000.00, 1000.00, 40.00, 9999.00)
        SetPedConfigFlag(PlayerPedId(), 380, true)
		SetPedCanLosePropsOnDamage(PlayerPedId(), false, 0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local thread = 500
		local playerPed = GetPlayerPed(-1)
		if IsPedArmed(playerPed, 6) then
			thread = 0
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
		end
		Citizen.Wait(thread)
	end
end)

local Block = {
	"WEAPON_KNIFE",
	"WEAPON_KNIFE_AGENCY",
	"WEAPON_KNIFE_LV1",
	"WEAPON_KNIFE_LV2",
	"WEAPON_KNIFE_CHRISTMAS",
	"WEAPON_DAGGER_CHRISTMAS",
	"WEAPON_BOTTLE_CHINESE",
	"WEAPON_DAGGER_CHINESE",
	"WEAPON_KNIFE_CHINESE",
	"WEAPON_BOTTLE",
}
Citizen.CreateThread(function()
	while true do
		local thread = 500
		local playerPed = GetPlayerPed(-1)
		local can = false
		for key, value in pairs(Block) do
			if GetSelectedPedWeapon(playerPed) == GetHashKey(value) then
				thread = 0
				DisableControlAction(0, 199, true)
				DisableControlAction(1, 199, true)
				DisableControlAction(2, 199, true)
			end
		end		
		Citizen.Wait(thread)
	end
end)