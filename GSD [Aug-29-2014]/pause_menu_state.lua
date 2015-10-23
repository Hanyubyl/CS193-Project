function pause_menu_state:enter(drawable_bf)
	pause_drawables = drawable_bf
	love.keyboard.setKeyRepeat( false )
	print("entering pause_menu_state")
	pause_img = load_transparent("pause_text.png",255, 0, 255)
end

function pause_menu_state:leave()
	--love.keyboard.setKeyRepeat( true )
	print("leaving pause_menu_state")
end

function pause_menu_state:gamepadpressed(JS, key)
	if key == "start" then
		Gamestate.pop(pause_menu_state)
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

function pause_menu_state:gamepadreleased(JS, key)
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

function pause_menu_state:draw()
	for i, stuff in ipairs(drawable_bf) do
		love.graphics.draw(drawable_bf[i]:get_image(),
				--drawable_bf[i]:get_quad(),
				drawable_bf[i]:draw_x(),
				drawable_bf[i]:draw_y())
	end
	love.graphics.draw(pause_img, Center_x, Center_y, 0, 1, 1, pause_img:getWidth()/2, pause_img:getWidth()/2)
	love.graphics.print(love.timer.getFPS())
	
end

