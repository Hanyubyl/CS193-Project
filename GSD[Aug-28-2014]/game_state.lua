function game_state:enter()

	--load world
	--load entities
	--load shanghai
	--load hud
	shanghai_speed = 200

	keypress_table = {}
	for i = 1,2 do
		keypress_table[i] = 0
	end
	
	print("entering game state")
	shanghai_8 = spritearr8("shanghaisprite.png")
	shanghai_disp = shanghai_8[5]
	shanghai_x = Width/2
	shanghai_y = Height/2
	cam = Camera(Width/2,Height/2)
	cam:zoomTo(1)
end

function game_state:keypressed(key)
	if key == "up" then
		keypress_table[1] = 1
		print("up")
	elseif key == "left" then
		keypress_table[2] = - 1
		print("left")
	elseif key == "down" then
		keypress_table[1] = - 1
		print("down")
	elseif key == "right" then
		keypress_table[2] = 1
		print("right")
	end
end

function game_state:keyreleased(key)
	if key == "up" then
		keypress_table[1] = keypress_table[1] - 1
	elseif key == "left" then
		keypress_table[2] = keypress_table[2] + 1
	elseif key == "down" then
		keypress_table[1] = keypress_table[1] + 1
	elseif key == "right" then
		keypress_table[2] = keypress_table[2] - 1
	end
	
	if key == "escape" then		
		Gamestate.push(pause_menu_state)
	end
end
function game_state:leave()
	keypress_table[1] = 0
	keypress_table[2] = 0
	print("leaving game_state")
	
end
local function shanghai_display(kp_table)
	if(kp_table[1] == 1 and kp_table[2] == -1) then
		shanghai_disp = shanghai_8[2]
	elseif (kp_table[1] == -1 and kp_table[2] == -1) then
		shanghai_disp = shanghai_8[4]
	elseif (kp_table[1] == -1 and kp_table[2] == 1) then
		shanghai_disp = shanghai_8[6]
	elseif (kp_table[1] == 1 and kp_table[2] == 1) then
		shanghai_disp = shanghai_8[8]
	elseif (kp_table[1] == 1 and kp_table[2] == 0) then
		shanghai_disp = shanghai_8[1]
	elseif (kp_table[1] == 0 and kp_table[2] == -1) then
		shanghai_disp = shanghai_8[3]
	elseif (kp_table[1] == -1 and kp_table[2] == 0) then
		shanghai_disp = shanghai_8[5]
	elseif (kp_table[1] == 0 and kp_table[2] == 1) then
		shanghai_disp = shanghai_8[7]
	end
end

function diag_factor()
	return (0.8536 + 0.1464*(-1)^(math.abs(keypress_table[1]*keypress_table[2])))
end

function game_state:update(dt)
	--print(keypress_table[1])
	--cam:lookAt(shanghai_x, shanghai_y)
	cam:lookAt((shanghai_speed * diag_factor() * dt)*keypress_table[2], -(shanghai_speed * diag_factor() * dt)*keypress_table[1])
	--print(cam:pos())
	shanghai_display(keypress_table)
	shanghai_x = shanghai_x + (shanghai_speed * diag_factor() * dt)*keypress_table[2]  
	shanghai_y = shanghai_y - (shanghai_speed * diag_factor() * dt)*keypress_table[1]
end
lsf = love.graphics.newImage("LSF.png")
function draw_hud()
	love.graphics.draw(lsf,0,0)
	
end
function game_state:draw()
	love.graphics.clear()
	cam:attach()
	draw_hud()
	love.graphics.draw(shanghai_disp, shanghai_x, shanghai_y)
	cam:detach()
end