------------------------------------------
-- iEnsomatic RealisticVehicleFailure -
------------------------------------------
--
-- แปลภาษาโดย Caruby [ Pradit Khamkorn ]
--
--
--


-- การกำหนดค่า:

-- สำคัญ: ค่าเหล่านี้บางค่าต้องกำหนดเป็นหมายเลขจุดลอยตัว กล่าวคือ 10.0 แทน 10

cfgHealthVeh = {
	deformationMultiplier = -0.58,					-- รถยนต์ควรมองเห็นได้จากการชนกันมากน้อยแค่ไหน ช่วง 0.0 ถึง 10.0 โดยที่ 0.0 ไม่มีการเสียรูปและ 10.0 คือการเสียรูป 10 เท่า -1 = อย่าสัมผัส ความเสียหายจากภาพไม่ซิงค์กับผู้เล่นรายอื่น
	deformationExponent = 0.4,					-- ควรบีบอัดการจัดการการตั้งค่าการเปลี่ยนรูปของไฟล์เป็น 0.58 (ทำให้รถดูคล้ายกันมาก) ค่า 1 = ไม่มีการเปลี่ยนแปลง ค่าที่ต่ำกว่าจะบีบอัดค่ามากกว่า 1 จะขยาย อย่าตั้งค่าเป็นศูนย์หรือลบ
	collisionDamageExponent = 0.58,				-- ควรบีบอัดการจัดการการเปลี่ยนแปลงการจัดรูปแบบแฟ้มเป็น 0.58 อย่างไร (ทำให้รถดูคล้ายกันมาก) ค่า 1 = ไม่มีการเปลี่ยนแปลง ค่าที่ต่ำกว่าจะบีบอัดค่ามากกว่า 1 จะขยาย อย่าตั้งค่าเป็นศูนย์หรือลบ

	damageFactorEngine = 3.0,					-- ค่าที่เป็นกลางคือ 1 ถึง 100 ค่าที่สูงขึ้นหมายถึงความเสียหายมากขึ้นกับยานพาหนะ จุดเริ่มต้นที่ดีคือ 10
	damageFactorBody = 3.0,					-- ค่าที่เป็นกลางคือ 1 ถึง 100 ค่าที่สูงขึ้นหมายถึงความเสียหายมากขึ้นกับยานพาหนะ จุดเริ่มต้นที่ดีคือ 10
	damageFactorPetrolTank = 0.1,				-- ค่าที่เป็นกลางคือ 1 ถึง 200 ค่าที่สูงขึ้นหมายถึงความเสียหายมากขึ้นกับยานพาหนะ จุดเริ่มต้นที่ดีคือ 64
	engineDamageExponent = 0.58,					-- ควรบีบอัดการจัดการความเสียหายของเครื่องมือไฟล์เป็นจำนวน 0.58 เท่า (ทำให้รถดูคล้ายกันมาก) ค่า 1 = ไม่มีการเปลี่ยนแปลง ค่าที่ต่ำกว่าจะบีบอัดค่ามากกว่า 1 จะขยาย อย่าตั้งค่าเป็นศูนย์หรือลบ
	weaponsDamageMultiplier = 0.4,				-- ยานพาหนะได้รับความเสียหายเท่าใดจากการยิงอาวุธ ช่วง 0.0 ถึง 10.0 โดยที่ 0.0 ไม่มีความเสียหายและ 10.0 มีความเสียหาย 10 เท่า -1 = อย่าแตะต้อง
	degradingHealthSpeedFactor = 0,		-- ความเร็วของการย่อยสลายอย่างช้าๆต่อสุขภาพ แต่ไม่ใช่ความล้มเหลว ค่าของ 10 หมายความว่าจะใช้เวลาประมาณ 0.25 วินาทีต่อจุดสุขภาพดังนั้นการย่อยสลายตั้งแต่ 800 ถึง 305 จะใช้เวลาประมาณ 2 นาทีในการขับขี่ที่สะอาด ค่าที่สูงขึ้นหมายถึงการย่อยสลายได้เร็วขึ้น
	cascadingFailureSpeedFactor = 8.0,			-- ค่าที่เป็นอันตรายคือ 1 ถึง 100 เมื่อสุขภาพรถลดลงต่ำกว่าจุดหนึ่งความล้มเหลวของ cascading จะลดลงและสุขภาพจะลดลงอย่างรวดเร็วจนกว่ารถจะตาย ค่าที่สูงขึ้นหมายถึงความล้มเหลวได้เร็วขึ้น จุดเริ่มต้นที่ดีคือ 8

	degradingFailureThreshold = 700.0,			-- ด้านล่างค่านี้การย่อยสลายทางสุขภาพที่ช้าจะเกิดขึ้น
	cascadingFailureThreshold = 400.0,			-- ด้านล่างค่านี้ความล้มเหลวของ cascading สุขภาพจะตั้งค่าไว้
	engineSafeGuard = 150.0,					-- ค่าความล้มเหลวขั้นสุดท้าย ตั้งค่าให้สูงเกินไปและรถจะไม่สูบบุหรี่เมื่อปิดใช้งาน ตั้งค่าต่ำเกินไปและรถจะยิงจากกระสุนเดี่ยวไปยังเครื่องยนต์ ที่สุขภาพ 100 รถทั่วไปสามารถใช้กระสุน 3-4 เพื่อเครื่องยนต์ก่อนที่จะจับไฟ

	torqueMultiplierEnabled = true,				-- ลดแรงบิดของเครื่องยนต์เนื่องจากเครื่องยนต์ได้รับความเสียหายมากขึ้น

	limpMode = false,							-- ถ้าเป็นจริงเครื่องยนต์จะไม่ทำงานไม่สมบูรณ์ดังนั้นคุณจะสามารถหาช่างเครื่องได้เสมอไปเว้นแต่คุณจะพลิกรถของคุณและป้องกันไม่ให้ VehicleFlip ตั้งค่าเป็น true
	limpModeMultiplier = 0.15,					-- ตัวคูณแรงบิดที่ใช้เมื่อยานพาหนะกำลังขรุขระ

	preventVehicleFlip = false,					-- ถ้าเป็นจริงคุณจะไม่สามารถพลิกคว่ำลงได้

	sundayDriver = false,						-- ถ้าเป็นจริงการตอบสนองของเครื่องเร่งความเร็วจะถูกปรับขนาดเพื่อให้สามารถขับขี่ได้ช้า จะไม่ป้องกันไม่ให้คันเร่งเต็มรูปแบบ ไม่ทำงานกับเครื่องเร่งแบบไบนารีเช่นแป้นพิมพ์ ตั้งค่าเป็น false เพื่อปิดใช้งาน คุณสมบัติการหยุดโดยไม่มีการย้อนกลับและเบรคไลท์ยังใช้สำหรับคีย์บอร์ดได้
	sundayDriverAcceleratorCurve = 7.5,			-- เส้นโค้งการตอบสนองที่จะใช้กับเครื่องเร่งอนุภาค ช่วง 0.0 ถึง 10.0 ค่าที่สูงขึ้นจะช่วยให้การขับขี่ช้าลงได้ง่ายขึ้นซึ่งหมายความว่าจะต้องมีแรงกดบนคันเร่งมากขึ้นเพื่อเร่งไปข้างหน้า ไม่มีอะไรสำหรับโปรแกรมควบคุมแป้นพิมพ์
	sundayDriverBrakeCurve = 5.0,				-- เส้นตอบสนองที่จะใช้กับเบรค ช่วง 0.0 ถึง 10.0 ค่าที่สูงขึ้นช่วยให้สามารถเบรคได้ง่ายขึ้นซึ่งหมายความว่าแรงกดบนเค้นจะต้องเบรคมาก ไม่มีอะไรสำหรับโปรแกรมควบคุมแป้นพิมพ์

	displayBlips = false,						-- แสดง blips สำหรับตำแหน่งช่างซ่อม

	compatibilityMode = false,					-- ป้องกันไม่ให้สคริปต์อื่น ๆ ปรับเปลี่ยนสุขภาพของถังเชื้อเพลิงเพื่อหลีกเลี่ยงความล้มเหลวของเครื่องยนต์แบบสุ่มด้วย BVA 2.01 (ข้อเสียคือการป้องกันการระเบิด)

	randomTireBurstInterval = 0,				-- จำนวนนาที (อย่างมีนัยสำคัญทางสถิติ) เพื่อขับเกิน 22 ไมล์ต่อชั่วโมงก่อนที่คุณจะได้รับการเจาะยาง 0 = คุณลักษณะถูกปิดใช้งาน


	-- คูณตัวสร้างความเสียหายระดับชั้น
	-- ความเสียหายที่เกิดขึ้นจากเครื่องยนต์ส่วนลำตัวและ Petroltank จะถูกคูณด้วยค่านี้ขึ้นอยู่กับประเภทของยานพาหนะ
	-- ใช้มันเพื่อเพิ่มหรือลดความเสียหายสำหรับแต่ละชั้น

	classDamageMultiplier = {
		[0] = 	0.58,		--	0: Compacts
				0.58,		--	1: Sedans
				0.58,		--	2: SUVs
				0.58,		--	3: Coupes
				0.58,		--	4: Muscle
				0.58,		--	5: Sports Classics
				0.58,		--	6: Sports
				0.58,		--	7: Super
				0.25,		--	8: Motorcycles
				0.58,		--	9: Off-road
				0.25,		--	10: Industrial
				0.58,		--	11: Utility
				0.58,		--	12: Vans
				0.58,		--	13: Cycles
				0.5,		--	14: Boats
				0.58,		--	15: Helicopters
				0.58,		--	16: Planes
				0.58,		--	17: Service
				0.585,		--	18: Emergency
				0.585,		--	19: Military
				0.58,		--	20: Commercial
				0.58			--	21: Trains
	}
}


local pedInSameVehicleLast=false
local vehicle
local lastVehicle
local vehicleClass
local fCollisionDamageMult = 0.0
local fDeformationDamageMult = 0.0
local fEngineDamageMult = 0.0
local fBrakeForce = 1.0
local isBrakingForward = false
local isBrakingReverse = false

local healthEngineLast = 1000.0
local healthEngineCurrent = 1000.0
local healthEngineNew = 1000.0
local healthEngineDelta = 0.0
local healthEngineDeltaScaled = 0.0

local healthBodyLast = 1000.0
local healthBodyCurrent = 1000.0
local healthBodyNew = 1000.0
local healthBodyDelta = 0.0
local healthBodyDeltaScaled = 0.0

local healthPetrolTankLast = 1000.0
local healthPetrolTankCurrent = 1000.0
local healthPetrolTankNew = 1000.0
local healthPetrolTankDelta = 0.0
local healthPetrolTankDeltaScaled = 0.0
local tireBurstLuckyNumber

math.randomseed(GetGameTimer());

local tireBurstMaxNumber = cfgHealthVeh.randomTireBurstInterval * 1200; 												-- the tire burst lottery runs roughly 1200 times per minute
if cfgHealthVeh.randomTireBurstInterval ~= 0 then tireBurstLuckyNumber = math.random(tireBurstMaxNumber) end			-- If we hit this number again randomly, a tire will burst.

local function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

local function isPedDrivingAVehicle()
	local ped = GetPlayerPed(-1)
	vehicle = GetVehiclePedIsIn(ped, false)
	if IsPedInAnyVehicle(ped, false) then
		-- Check if ped is in driver seat
		if GetPedInVehicleSeat(vehicle, -1) == ped then
			local class = GetVehicleClass(vehicle)
			-- We don't want planes, helicopters, bicycles and trains
			if class ~= 15 and class ~= 16 and class ~=21 and class ~=13 then
				return true
			end
		end
	end
	return false
end

local function fscale(inputValue, originalMin, originalMax, newBegin, newEnd, curve)
	local OriginalRange = 0.0
	local NewRange = 0.0
	local zeroRefCurVal = 0.0
	local normalizedCurVal = 0.0
	local rangedValue = 0.0
	local invFlag = 0

	if (curve > 10.0) then curve = 10.0 end
	if (curve < -10.0) then curve = -10.0 end

	curve = (curve * -.1)
	curve = 10.0 ^ curve

	if (inputValue < originalMin) then
	  inputValue = originalMin
	end
	if inputValue > originalMax then
	  inputValue = originalMax
	end

	OriginalRange = originalMax - originalMin

	if (newEnd > newBegin) then
		NewRange = newEnd - newBegin
	else
	  NewRange = newBegin - newEnd
	  invFlag = 1
	end

	zeroRefCurVal = inputValue - originalMin
	normalizedCurVal  =  zeroRefCurVal / OriginalRange

	if (originalMin > originalMax ) then
	  return 0
	end

	if (invFlag == 0) then
		rangedValue =  ((normalizedCurVal ^ curve) * NewRange) + newBegin
	else
		rangedValue =  newBegin - ((normalizedCurVal ^ curve) * NewRange)
	end

	return rangedValue
end



local function tireBurstLottery()
	local tireBurstNumber = math.random(tireBurstMaxNumber)
	if tireBurstNumber == tireBurstLuckyNumber then
		-- We won the lottery, lets burst a tire.
		if GetVehicleTyresCanBurst(vehicle) == false then return end
		local numWheels = GetVehicleNumberOfWheels(vehicle)
		local affectedTire
		if numWheels == 2 then
			affectedTire = (math.random(2)-1)*4		-- wheel 0 or 4
		elseif numWheels == 4 then
			affectedTire = (math.random(4)-1)
			if affectedTire > 1 then affectedTire = affectedTire + 2 end	-- 0, 1, 4, 5
		elseif numWheels == 6 then
			affectedTire = (math.random(6)-1)
		else
			affectedTire = 0
		end
		SetVehicleTyreBurst(vehicle, affectedTire, false, 1000.0)
		tireBurstLuckyNumber = math.random(tireBurstMaxNumber)			-- Select a new number to hit, just in case some numbers occur more often than others
	end
end


RegisterNetEvent('iens:notAllowed')
AddEventHandler('iens:notAllowed', function()
	notification("~r~You don't have permission to repair vehicles")
end)

if cfgHealthVeh.torqueMultiplierEnabled or cfgHealthVeh.preventVehicleFlip or cfgHealthVeh.limpMode then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			local sleep = true
			if cfgHealthVeh.torqueMultiplierEnabled or cfgHealthVeh.sundayDriver or cfgHealthVeh.limpMode then
				if pedInSameVehicleLast then
					sleep = false
					local factor = 1.0
					if cfgHealthVeh.torqueMultiplierEnabled and healthEngineNew < 900 then
						factor = (healthEngineNew+200.0) / 1100
					end
					if cfgHealthVeh.sundayDriver and GetVehicleClass(vehicle) ~= 14 then -- Not for boats
						local accelerator = GetControlValue(2,71)
						local brake = GetControlValue(2,72)
						local speed = GetEntitySpeedVector(vehicle, true)['y']
						-- Change Braking force
						local brk = fBrakeForce
						if speed >= 1.0 then
							-- Going forward
							if accelerator > 127 then
								-- Forward and accelerating
								local acc = fscale(accelerator, 127.0, 254.0, 0.1, 1.0, 10.0-(cfgHealthVeh.sundayDriverAcceleratorCurve*2.0))
								factor = factor * acc
							end
							if brake > 127 then
								-- Forward and braking
								isBrakingForward = true
								brk = fscale(brake, 127.0, 254.0, 0.01, fBrakeForce, 10.0-(cfgHealthVeh.sundayDriverBrakeCurve*2.0))
							end
						elseif speed <= -1.0 then
							-- Going reverse
							if brake > 127 then
								-- Reversing and accelerating (using the brake)
								local rev = fscale(brake, 127.0, 254.0, 0.1, 1.0, 10.0-(cfgHealthVeh.sundayDriverAcceleratorCurve*2.0))
								factor = factor * rev
							end
							if accelerator > 127 then
								-- Reversing and braking (Using the accelerator)
								isBrakingReverse = true
								brk = fscale(accelerator, 127.0, 254.0, 0.01, fBrakeForce, 10.0-(cfgHealthVeh.sundayDriverBrakeCurve*2.0))
							end
						else
							-- Stopped or almost stopped or sliding sideways
							local entitySpeed = GetEntitySpeed(vehicle)
							if entitySpeed < 1 then
								-- Not sliding sideways
								if isBrakingForward == true then
									--Stopped or going slightly forward while braking
									DisableControlAction(2,72,true) -- Disable Brake until user lets go of brake
									SetVehicleForwardSpeed(vehicle,speed*0.98)
									SetVehicleBrakeLights(vehicle,true)
								end
								if isBrakingReverse == true then
									--Stopped or going slightly in reverse while braking
									DisableControlAction(2,71,true) -- Disable reverse Brake until user lets go of reverse brake (Accelerator)
									SetVehicleForwardSpeed(vehicle,speed*0.98)
									SetVehicleBrakeLights(vehicle,true)
								end
								if isBrakingForward == true and GetDisabledControlNormal(2,72) == 0 then
									-- We let go of the brake
									isBrakingForward=false
								end
								if isBrakingReverse == true and GetDisabledControlNormal(2,71) == 0 then
									-- We let go of the reverse brake (Accelerator)
									isBrakingReverse=false
								end
							end
						end
						if brk > fBrakeForce - 0.02 then brk = fBrakeForce end -- Make sure we can brake max.
						SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce', brk)  -- Set new Brake Force multiplier
					end
					if cfgHealthVeh.limpMode == true and healthEngineNew < cfgHealthVeh.engineSafeGuard + 5 then
						factor = cfgHealthVeh.limpModeMultiplier
					end
					SetVehicleEngineTorqueMultiplier(vehicle, factor)
				end
			end
			if cfgHealthVeh.preventVehicleFlip then
				local roll = GetEntityRoll(vehicle)
				if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
					DisableControlAction(2,59,true) -- Disable left/right
					DisableControlAction(2,60,true) -- Disable up/down
				end
			end
			if sleep then
				Citizen.Wait(500)
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(50)
		local ped = GetPlayerPed(-1)
		if isPedDrivingAVehicle() then
			vehicle = GetVehiclePedIsIn(ped, false)
			vehicleClass = GetVehicleClass(vehicle)
			healthEngineCurrent = GetVehicleEngineHealth(vehicle)
			if healthEngineCurrent == 1000 then healthEngineLast = 1000.0 end
			healthEngineNew = healthEngineCurrent
			healthEngineDelta = healthEngineLast - healthEngineCurrent
			healthEngineDeltaScaled = healthEngineDelta * cfgHealthVeh.damageFactorEngine * cfgHealthVeh.classDamageMultiplier[vehicleClass]

			healthBodyCurrent = GetVehicleBodyHealth(vehicle)
			if healthBodyCurrent == 1000 then healthBodyLast = 1000.0 end
			healthBodyNew = healthBodyCurrent
			healthBodyDelta = healthBodyLast - healthBodyCurrent
			healthBodyDeltaScaled = healthBodyDelta * cfgHealthVeh.damageFactorBody * cfgHealthVeh.classDamageMultiplier[vehicleClass]

			healthPetrolTankCurrent = GetVehiclePetrolTankHealth(vehicle)
			if cfgHealthVeh.compatibilityMode and healthPetrolTankCurrent < 1 then
				--	SetVehiclePetrolTankHealth(vehicle, healthPetrolTankLast)
				--	healthPetrolTankCurrent = healthPetrolTankLast
				healthPetrolTankLast = healthPetrolTankCurrent
			end
			if healthPetrolTankCurrent == 1000 then healthPetrolTankLast = 1000.0 end
			healthPetrolTankNew = healthPetrolTankCurrent
			healthPetrolTankDelta = healthPetrolTankLast-healthPetrolTankCurrent
			healthPetrolTankDeltaScaled = healthPetrolTankDelta * cfgHealthVeh.damageFactorPetrolTank * cfgHealthVeh.classDamageMultiplier[vehicleClass]

			if healthEngineCurrent > cfgHealthVeh.engineSafeGuard+1 then
				SetVehicleUndriveable(vehicle,false)
			end

			if healthEngineCurrent <= cfgHealthVeh.engineSafeGuard+1 and cfgHealthVeh.limpMode == false then
				SetVehicleUndriveable(vehicle,true)
			end

			-- If ped spawned a new vehicle while in a vehicle or teleported from one vehicle to another, handle as if we just entered the car
			if vehicle ~= lastVehicle then
				pedInSameVehicleLast = false
			end


			if pedInSameVehicleLast == true then
				-- Damage happened while in the car = can be multiplied

				-- Only do calculations if any damage is present on the car. Prevents weird behavior when fixing using trainer or other script
				if healthEngineCurrent ~= 1000.0 or healthBodyCurrent ~= 1000.0 or healthPetrolTankCurrent ~= 1000.0 then

					-- Combine the delta values (Get the largest of the three)
					local healthEngineCombinedDelta = math.max(healthEngineDeltaScaled, healthBodyDeltaScaled, healthPetrolTankDeltaScaled)

					-- If huge damage, scale back a bit
					if healthEngineCombinedDelta > (healthEngineCurrent - cfgHealthVeh.engineSafeGuard) then
						healthEngineCombinedDelta = healthEngineCombinedDelta * 0.7
					end

					-- If complete damage, but not catastrophic (ie. explosion territory) pull back a bit, to give a couple of seconds og engine runtime before dying
					if healthEngineCombinedDelta > healthEngineCurrent then
						healthEngineCombinedDelta = healthEngineCurrent - (cfgHealthVeh.cascadingFailureThreshold / 5)
					end


					------- Calculate new value

					healthEngineNew = healthEngineLast - healthEngineCombinedDelta


					------- Sanity Check on new values and further manipulations

					-- If somewhat damaged, slowly degrade until slightly before cascading failure sets in, then stop

					if healthEngineNew > (cfgHealthVeh.cascadingFailureThreshold + 5) and healthEngineNew < cfgHealthVeh.degradingFailureThreshold then
						healthEngineNew = healthEngineNew-(0.038 * cfgHealthVeh.degradingHealthSpeedFactor)
					end

					-- If Damage is near catastrophic, cascade the failure
					if healthEngineNew < cfgHealthVeh.cascadingFailureThreshold then
						healthEngineNew = healthEngineNew-(0.1 * cfgHealthVeh.cascadingFailureSpeedFactor)
					end

					-- Prevent Engine going to or below zero. Ensures you can reenter a damaged car.
					if healthEngineNew < cfgHealthVeh.engineSafeGuard then
						healthEngineNew = cfgHealthVeh.engineSafeGuard
					end

					-- Prevent Explosions
					if cfgHealthVeh.compatibilityMode == false and healthPetrolTankCurrent < 750 then
						healthPetrolTankNew = 750.0
					end

					-- Prevent negative body damage.
					if healthBodyNew < 0  then
						healthBodyNew = 0.0
					end
				end
			else
				-- Just got in the vehicle. Damage can not be multiplied this round
				-- Set vehicle handling data
				fDeformationDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult')
				fBrakeForce = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce')
				local newFDeformationDamageMult = fDeformationDamageMult ^ cfgHealthVeh.deformationExponent	-- Pull the handling file value closer to 1
				if cfgHealthVeh.deformationMultiplier ~= -1 then SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult', newFDeformationDamageMult * cfgHealthVeh.deformationMultiplier) end  -- Multiply by our factor
				if cfgHealthVeh.weaponsDamageMultiplier ~= -1 then SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fWeaponDamageMult', cfgHealthVeh.weaponsDamageMultiplier/cfgHealthVeh.damageFactorBody) end -- Set weaponsDamageMultiplier and compensate for damageFactorBody

				--Get the CollisionDamageMultiplier
				fCollisionDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult')
				--Modify it by pulling all number a towards 1.0
				local newFCollisionDamageMultiplier = fCollisionDamageMult ^ cfgHealthVeh.collisionDamageExponent	-- Pull the handling file value closer to 1
				SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult', newFCollisionDamageMultiplier)

				--Get the EngineDamageMultiplier
				fEngineDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult')
				--Modify it by pulling all number a towards 1.0
				local newFEngineDamageMult = fEngineDamageMult ^ cfgHealthVeh.engineDamageExponent	-- Pull the handling file value closer to 1
				SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult', newFEngineDamageMult)

				-- If body damage catastrophic, reset somewhat so we can get new damage to multiply
				if healthBodyCurrent < cfgHealthVeh.cascadingFailureThreshold then
					healthBodyNew = cfgHealthVeh.cascadingFailureThreshold
				end
				pedInSameVehicleLast = true
			end

			-- set the actual new values
			if healthEngineNew ~= healthEngineCurrent then
				SetVehicleEngineHealth(vehicle, healthEngineNew)
			end
			if healthBodyNew ~= healthBodyCurrent then SetVehicleBodyHealth(vehicle, healthBodyNew) end
			if healthPetrolTankNew ~= healthPetrolTankCurrent then SetVehiclePetrolTankHealth(vehicle, healthPetrolTankNew) end

			-- Store current values, so we can calculate delta next time around
			healthEngineLast = healthEngineNew
			healthBodyLast = healthBodyNew
			healthPetrolTankLast = healthPetrolTankNew
			lastVehicle=vehicle
			if cfgHealthVeh.randomTireBurstInterval ~= 0 and GetEntitySpeed(vehicle) > 10 then tireBurstLottery() end
		else
			if pedInSameVehicleLast == true then
				-- We just got out of the vehicle
				lastVehicle = GetVehiclePedIsIn(ped, true)				
				if cfgHealthVeh.deformationMultiplier ~= -1 then SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fDeformationDamageMult', fDeformationDamageMult) end -- Restore deformation multiplier
				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fBrakeForce', fBrakeForce)  -- Restore Brake Force multiplier
				if cfgHealthVeh.weaponsDamageMultiplier ~= -1 then SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fWeaponDamageMult', cfgHealthVeh.weaponsDamageMultiplier) end	-- Since we are out of the vehicle, we should no longer compensate for bodyDamageFactor
				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fCollisionDamageMult', fCollisionDamageMult) -- Restore the original CollisionDamageMultiplier
				SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fEngineDamageMult', fEngineDamageMult) -- Restore the original EngineDamageMultiplier
			end
			pedInSameVehicleLast = false
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        if GetVehiclePedIsIn(PlayerPedId(), true) then
            if GetVehicleEngineHealth(vehicle) <= 150 then
                TaskLeaveVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false))
            end
        end
        Wait(2000)
    end
end)