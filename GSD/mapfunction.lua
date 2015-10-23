function loadlayers(map, world, zbroadcasted)
	wallLayer = map.layers["Wall"]
    for i,v in ipairs(wallLayer.objects) do
        if v.properties then 
            Wall:new(world,wallLayer.objects[i])
        end
    end
	
	pSwitchLayer = map.layers["pSwitch"] -- Pressure_Switch
    for i,v in ipairs(pSwitchLayer.objects) do
        if v.properties then 
            local s = pSwitchLayer.objects[i]
			Pressure_Switch:new(world,s)
        end
    end
	
	DoorLayer = map.layers["Door"] -- Pressure_Switch
    for i,v in ipairs(DoorLayer.objects) do
        if v.properties then 
            local s = DoorLayer.objects[i]
			table.insert(zbroadcasted, Switch_Door:new(world,s))
        end
    end
	
	MaptileLayer = map.layers["Maptile"] -- Special tiles
	for i,v in ipairs(MaptileLayer.objects) do
		if v.properties then
			local s = MaptileLayer.objects[i]
			Maptile:new(world,s)
		end
	end
	
	PickupLayer = map.layers["Pickup"] -- Pickups
	for i,v in ipairs(PickupLayer.objects) do
		if v.properties then
			local s = PickupLayer.objects[i]
			Pickup:new(world, s)
		end
	end
	
	LockblockLayer = map.layers["Lockblock"] -- Lockblocks
	for i,v in ipairs(LockblockLayer.objects) do
		if v.properties then
			local s = LockblockLayer.objects[i]
			Lockblock:new(world,s)
		end
	end

	DestroyblockLayer = map.layers["Destroyblock"] -- Destroyblocks
	for i,v in ipairs(DestroyblockLayer.objects) do
		if v.properties then
			local s = DestroyblockLayer.objects[i]
			Destroyblock:new(world,s)
		end
	end
	
	EnemyLayer = map.layers["Enemy"] -- Enemys
	for i,v in ipairs(EnemyLayer.objects) do
		if v.properties then
			local s = EnemyLayer.objects[i]
			Enemy:new(world,s)
		end
		
	end

end