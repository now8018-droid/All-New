local spacecount = 0
local countspace = 0
local alert = false
local alert2 = false
local timecooldown = 0
local timecooldown2 = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if alert then
            -- print(alert)
            DisablePlayerFiring(PlayerPedId(), true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 80, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 250, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 310, true)
        end

        if timecooldown < GetGameTimer() then
            alert = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if alert2 then
            DisablePlayerFiring(PlayerPedId(), true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 80, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 250, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 310, true)
        end

        if timecooldown2 < GetGameTimer() then
            alert2 = false
        end
    end
end)

local space = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)

        local timerspace = 0
        if not space then
            spacecount = 0
        end

        while space do

            Citizen.Wait(0)
            if IsPedOnFoot(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                spacecount = spacecount + 1
                if spacecount >= 700 then
                    exports['pNotify']:SendNotification({
                        text = 'ห้ามกด SpaceBar ค้าง',
                        type = 'error',
                        timeout = 5000
                    })

                    alert = true
                    timecooldown = GetGameTimer() + 6000
                    spacecount = 0
                end
            end
        end
    end
end)

local countpressspace = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        if IsPedOnFoot(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
            if countpressspace >= 5 then
                exports['pNotify']:SendNotification({
                    text = 'ห้ามกด SpaceBar รัวๆ',
                    type = 'error',
                    timeout = 5000
                })
                alert2 = true
                timecooldown2 = GetGameTimer() + 6000
                countpressspace = 0
            elseif countpressspace >= 1 then
                SetTimeout(1000, function()
                    if space ~= true then
                        countpressspace = 0
                        
                    end
                end)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        if IsPedOnFoot(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
            if IsControlPressed(0, 24) then
                countspace = countspace + 1
                if countspace >= 800 then
                    exports['pNotify']:SendNotification({
                        text = 'ห้ามกด Melee Dodge ค้าง !!!ๆ',
                        type = 'error',
                        timeout = 5000
                    })
                    alert2 = true
                    timecooldown2 = GetGameTimer() + 6000
                    countspace = 0
                end
            elseif not IsControlPressed(0, 24) then
                countspace = 0
            end
        end
    end
end)

RegisterCommand('+SpaceBar', function()
    if IsPedOnFoot(PlayerPedId()) then
        space = true
        countpressspace = countpressspace + 1
    end
end, false)

RegisterCommand('-SpaceBar', function()
    if IsPedOnFoot(PlayerPedId()) then
        space = false
    end
end, false)

RegisterKeyMapping('+SpaceBar', 'SpaceBar', 'keyboard', 'SPACE')
