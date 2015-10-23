function pause_menu_state:enter(key)
	entity_list = {}

	keypress_table[1] = 0
	keypress_table[2] = 0
	
	entity_list[1] = Sprite(Center_x,Center_y,1, love.graphics.newImage("magenta36.png"), 0, 0, 36, 36)
--	entity_list[2] = Sprite(Center_x,
end

function pause_menu_state:leave(key)
	keypress_table[1] = 0
	keypress_table[2] = 0
end

function pause_menu_state:keyreleased(key)
	if key == "escape" then
		Gamestate.pop(pause_menu_state)
	end
end


function pause_menu_state:draw()
	
	cam:draw(draw_hud)
	love.graphics.print("spooky pause text", 50, Height/2)
	love.graphics.draw(entity_list[1]:getImage(), entity_list[1]:get_quad(), entity_list[1]:draw_x(), entity_list[1]:draw_y())

end

