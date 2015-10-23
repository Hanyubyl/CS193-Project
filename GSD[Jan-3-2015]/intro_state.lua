function intro_state:update(dt)

end
function intro_state:enter()
	print("entering intro state")
	splash = love.graphics.newImage("marisa.png")
end
function intro_state:draw()
	love.graphics.draw(splash, Width/2-splash:getWidth()/2, Height/2-splash:getHeight()/2)
end

function intro_state:leave()
	print("leaving intro state")
	
end

function intro_state:gamepadpressed(JS, key)
	
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

function intro_state:gamepadreleased(JS, key)
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