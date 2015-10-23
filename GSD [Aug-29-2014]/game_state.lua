require "game_state_enter"

function game_state:enter()
	love.keyboard.setKeyRepeat(false)
	print("entering game_state")
	drawable_bf = {}
	--load save file / world
	_TURNING_SPEED = 10
	_ANG_UP = 2
	_ANG_LEFT = 4
	_ANG_DOWN = 6
	_ANG_RIGHT = 0
	load_world(drawable_bf)
	
	--load shanghai
	_player = Sprite8(Center_x, Center_y, id(), "shanghaisprite.png", 36, 36)
--	local _player_cursor_img = "player_cursor.png"
--	local _player_cursor = Sprite(_player._e_x, _player._e_y, id(),_player_cursor_img)
--	table.insert(buffer, _player_cursor)
	--load hud
	table.insert(drawable_bf, _player)
end

function game_state:gamepadpressed(JS, key)
	if key == "start" then
		Gamestate.push(pause_menu_state)
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

function game_state:gamepadreleased(JS, key)
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
function game_state:leave(drawable_bf)
	--love.keyboard.setKeyRepeat( false )
	print("leaving game_state")
end


function game_state:update(dt)
	player_velocity()
	_player:set_pos(_player:get_x() + _player:get_xv() * dt, _player:get_y() - _player:get_yv() * dt)
	
end

function game_state:draw()
	love.graphics.clear()
	love.graphics.print(love.timer.getFPS())
	for i, stuff in ipairs(drawable_bf) do
		love.graphics.draw(drawable_bf[i]:get_image(),
				--drawable_bf[i]:get_quad(),
				drawable_bf[i]:draw_x(),
				drawable_bf[i]:draw_y())
	end
end