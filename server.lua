
HoverTabla = {}

function onPlayerQuitPlayer ()
	if isElement(HoverTabla[source]) then
		destroyElement(HoverTabla[source])
		HoverTabla[source] = nil
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), onPlayerQuitPlayer )	

function hoverboard(player)
	if isPedInVehicle(player) then 
		return 
	end
	if HoverTabla[player] == nil then
		-- IF YOU WANT TO GIVE ONLY ACCESS TO ONE ACL CHANGE 'Everyone' FOR THE ACL YOU WANT EXAMPLE -> 'Admin'
		if ( isObjectInACLGroup( 'user.'..getAccountName( getPlayerAccount( player ) ), aclGetGroup( 'Everyone' ) ))  then
			local x,y,z = getElementPosition( player )
			HoverTabla[player] = createVehicle( 462 , x+5, y, z+1)
			setElementData ( HoverTabla[player], "hoverboard", true, false )
			setElementData ( HoverTabla[player], "owner", getAccountName(getPlayerAccount(player)), false )
			setVehicleDamageProof( HoverTabla[player] , true )
			--warpPedIntoVehicle ( player , HoverTabla[player] ) 
			setVehicleHandling ( HoverTabla[player] , "engineAcceleration", 50 ) -- 85
			setVehicleHandling ( HoverTabla[player] , "tractionMultiplier", 2 )
			setVehicleHandling ( HoverTabla[player] , "maxVelocity", 200 )
			setVehicleHandling ( HoverTabla[player] , "driveType" , "awd" )
		end
	else
		destroyElement(HoverTabla[player])
		HoverTabla[player] = nil
	end
end
addCommandHandler ( "hoverboard", hoverboard ) 

function onPlayerVehicleEnter ( vehicle, seat, jacked )
    if (getElementData( vehicle, "hoverboard" )) then
		triggerClientEvent(getRootElement(), "setPedAnimationClient", source , true )
    end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), onPlayerVehicleEnter )

function onPlayerVehicleExit ( vehicle, seat, jacked )
    if (getElementData( vehicle, "hoverboard" )) then
		triggerClientEvent(getRootElement(), "setPedAnimationClient", source , false )
    end
	if isElement(HoverTabla[source]) then
		destroyElement(HoverTabla[source])
		HoverTabla[source] = nil
	end
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), onPlayerVehicleExit )

function SyncHoverBoardAnimation(player)
	if isElement(player) then
		triggerClientEvent(getRootElement(), "setPedAnimationClient", player )
	end
end
addEvent("SyncHoverBoardAnimation", true )
addEventHandler("SyncHoverBoardAnimation", getRootElement(), SyncHoverBoardAnimation)
