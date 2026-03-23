-- AddEventHandler('esx:playerLoaded', function(playerData)
--     print("^2 Control = > Enable")
--     local SetTimeScale = SetTimeScale
--     SetTimeScale(0.952)

-- end)

Citizen.CreateThread(function()  
    while true do
        local ms = 0

        -- if Config.AFK.Enable then
            InvalidateIdleCam()
            ms = 30000
        -- end
        Wait(ms)
    end
end)