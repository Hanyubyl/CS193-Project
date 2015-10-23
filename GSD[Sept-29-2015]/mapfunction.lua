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
end