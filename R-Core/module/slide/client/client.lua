LeftShift = false
SlideReady = true
local CanSlide = true
RegisterCommand('HSLIDE', function()
    if LeftShift and CanSlide then
        if IsPedOnFoot(PlayerPedId()) and SlideReady and not IsEntityInWater(PlayerPedId()) then
            if not IsPedRagdoll(PlayerPedId()) then
                SlideReady = false
                while (not HasAnimDictLoaded('missheistfbi3b_ig6_v2')) do
                    RequestAnimDict('missheistfbi3b_ig6_v2')
                    Citizen.Wait(5)
                end
                SetPedMoveRateOverride(PlayerPedId(), 1.25)
                ClearPedSecondaryTask(PlayerPedId())
                TaskPlayAnim(PlayerPedId(), 'missheistfbi3b_ig6_v2', "rubble_slide_gunman", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ApplyForceToEntityCenterOfMass(PlayerPedId(), 1, 0, 12.8, 0.8, true, true, true, true)
                Wait(250)
                TaskPlayAnim(PlayerPedId(), 'missheistfbi3b_ig6_v2', "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
                ClearPedSecondaryTask(PlayerPedId())
                Wait(9 * 1000)
                SlideReady = true
            end
        end
    end
end, false)

RegisterCommand('+LSHIFTSLIDE', function()
    LeftShift = true
end, false)
RegisterCommand('-LSHIFTSLIDE', function()
    LeftShift = false
end, false)

RegisterKeyMapping('HSLIDE', 'Anim H Slide', 'keyboard', 'H')
RegisterKeyMapping('+LSHIFTSLIDE', 'Anim LShift Slide', 'keyboard', 'LSHIFT')

exports("SetCanSlide", function (boolean)
    CanSlide = boolean
end)