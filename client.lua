
-- To ON / OFF The Faggio default Sound
-- FALSE = OFF \ TRUE = ON
local Sound = false

-- To ON / OFF The Jump
-- FALSE = OFF \ TRUE = ON
local Jump = true

function onClientResourceStart()
	engineLoadIFP("bikev.ifp", "BIKEVC")
	engineImportTXD(engineLoadTXD("hover.txd", 462), 462)
	engineReplaceModel(engineLoadDFF("hover.dff", 462), 462)
	
	if not Sound then
		setWorldSoundEnabled( 19, 21, false, true)
		setWorldSoundEnabled( 19, 37, false, true)
		setWorldSoundEnabled( 7, 1, false, true)
		setWorldSoundEnabled( 5, 19, false, true)
		setWorldSoundEnabled( 5, 20, false, true)
		setWorldSoundEnabled( 40, 0, false, true)
		setWorldSoundEnabled( 40, 2, false, true)
		setWorldSoundEnabled( 7, 0, false, true)
	end
	
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(), onClientResourceStart )

function setPedAnimationClient(estado)
	--setPedAnimation(source, "BIKEVC", "BIKEv_Ride", -1, false, false, false)
	if estado == true then
		engineReplaceAnimation( source, "BIKEV", "BIKEv_Back", "BIKEVC", "BIKEv_Back" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_drivebyFT", "BIKEVC", "BIKEv_drivebyFT" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_drivebyLHS", "BIKEVC", "BIKEv_drivebyLHS" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_drivebyRHS", "BIKEVC", "BIKEv_drivebyRHS" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_Fwd", "BIKEVC", "BIKEv_Fwd" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_getoffBACK", "BIKEVC", "BIKEv_getoffBACK" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_getoffLHS", "BIKEVC", "BIKEv_getoffLHS" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_getoffRHS", "BIKEVC", "BIKEv_getoffRHS" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_hit", "BIKEVC", "BIKEv_hit" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_jumponL", "BIKEVC", "BIKEv_jumponL" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_jumponR", "BIKEVC", "BIKEv_jumponR" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_kick", "BIKEVC", "BIKEv_kick" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_Left", "BIKEVC", "BIKEv_Left" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_passenger", "BIKEVC", "BIKEv_passenger" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_pushes", "BIKEVC", "BIKEv_pushes" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_Ride", "BIKEVC", "BIKEv_Ride" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_Right", "BIKEVC", "BIKEv_Right" )
		engineReplaceAnimation( source, "BIKEV", "BIKEv_Still", "BIKEVC", "BIKEv_Still" )
	else
		engineRestoreAnimation( source, "BIKEV", "BIKEv_Back")
		engineRestoreAnimation( source, "BIKEV", "BIKEv_drivebyFT" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_drivebyLHS" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_drivebyRHS" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_Fwd" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_getoffBACK" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_getoffLHS" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_getoffRHS" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_hit" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_jumponL" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_jumponR" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_kick" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_Left" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_passenger" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_pushes" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_Ride" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_Right" )
		engineRestoreAnimation( source, "BIKEV", "BIKEv_Still" )
	end
end
addEvent("setPedAnimationClient",true)
addEventHandler("setPedAnimationClient",getRootElement(),setPedAnimationClient)

function HoverJump()
	if Jump then
		if isPedInVehicle(getLocalPlayer()) then 
			local theVehicle = getPedOccupiedVehicle(getLocalPlayer())
			if isElement(theVehicle) and (getElementModel(theVehicle) == 462) and isVehicleOnGround (theVehicle) then
				if not isPedDead(getLocalPlayer()) then
					local vx,vy,vz = getElementVelocity(theVehicle)
					setElementVelocity(theVehicle,vx,vy,0.2)
				end
			end
		end
	end
end
bindKey("lshift", "down", HoverJump)
