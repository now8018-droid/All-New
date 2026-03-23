crouched = false
Citizen.CreateThread(function()
    while true do
        local ms = 500
        if not IsEntityDead(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), true) then
            ms = 0
            DisableControlAction(0, 36, true)
            DisableControlAction(1, 36, true)
            DisableControlAction(2, 36, true)
            SetPedStealthMovement(PlayerPedId(), false)

        end
        Wait(ms)
    end
end)

RegisterCommand('Crouched', function()
    if not IsEntityDead(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), true) then
        RequestAnimSet("move_ped_crouched")

        while (not HasAnimSetLoaded("move_ped_crouched")) do
            Citizen.Wait(100)
        end

        if (crouched == true) then
            ResetPedMovementClipset(PlayerPedId(), 0)
            crouched = false
        elseif (crouched == false) then
            SetPedMovementClipset(PlayerPedId(), "move_ped_crouched", 0.25)
            crouched = true
        end
    end
end, false)

RegisterKeyMapping('Crouched', 'Anim Crouched', 'keyboard', 'LCONTROL')
