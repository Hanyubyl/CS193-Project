
function main_menu_state:enter()
	print("entering main_menu_state")
	
	
end

function main_menu_state:leave()
	
end

function main_menu_state:update(dt)

end

function main_menu_state:gamepadpressed(JS, key)
	
	if key == "start" then
		Gamestate.switch(game_state)
	end
	if key == "dpup" then
		dpad_table[2] = dpad_table[2] - 1
	elseif key == "dpleft" then
		dpad_table[1] = dpad_table[1] - 1
	elseif key == "dpdown" then
		dpad_table[2] = dpad_table[2] + 1
	elseif key == "dpright" then
		dpad_table[1] = dpad_table[1] + 1
	end
end

function main_menu_state:gamepadreleased(JS, key)
	if key == "dpup" then
		dpad_table[2] = dpad_table[2] + 1
	elseif key == "dpleft" then
		dpad_table[1] = dpad_table[1] + 1
	elseif key == "dpdown" then
		dpad_table[2] = dpad_table[2] - 1
	elseif key == "dpright" then
		dpad_table[1] = dpad_table[1] - 1
	end
end

function main_menu_state:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 200,200,100,20)
	love.graphics.setColor(100,100,100)
	love.graphics.print("Begin", 200, 200)
--	love.graphics.print("Load Save", 200, 250)
	
end