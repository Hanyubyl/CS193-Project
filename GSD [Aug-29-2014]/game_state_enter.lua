function load_world(buffer)
	local map_img = "LSF.png"
	local map = Sprite(Center_x, Center_y, id(), map_img)
	table.insert(buffer, map)
	

	local shanghais = "shanghaisprite.png"
	for i = 1, 4 do
		local sh = Sprite8(i*Width/10, 50, id(), shanghais, 36, 36)
		table.insert(buffer, sh)
	end
end

function player_velocity()
	if dpad_table[1] ==1 and dpad_table[2] ==0 then
		_player:set_velocity(100, 0)
	elseif dpad_table[1] ==1 and dpad_table[2] ==1 then
		_player:set_velocity(100, 14)
	elseif dpad_table[1] ==1 and dpad_table[2] ==-1 then
		_player:set_velocity(100, 2)
	elseif dpad_table[1] ==0 and dpad_table[2] ==1 then
		_player:set_velocity(100, 12)
	elseif dpad_table[1] ==0 and dpad_table[2] ==-1 then
		_player:set_velocity(100, 4)
	elseif dpad_table[1] ==0 and dpad_table[2] ==0 then
		_player:set_velocity(0, _player:get_angle())
	elseif dpad_table[1] ==-1 and dpad_table[2] ==0 then
		_player:set_velocity(100, 8)
	elseif dpad_table[1] ==-1 and dpad_table[2] ==1 then
		_player:set_velocity(100, 10)
	elseif dpad_table[1] ==-1 and dpad_table[2] ==-1 then
		_player:set_velocity(100, 6)
	end
end