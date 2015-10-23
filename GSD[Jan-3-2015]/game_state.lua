require "game_state_enter"
local sti = require "sti"


function game_state:enter()
	  map = sti.new("assets/maps/testmap.")
	math.randomseed( os.time() )
	tx,ty = 0,0
	ppp = function( a ) print(a) end
	-- load map function

	text = {}
	stuff = {}
	local player = Player:new(world, Center_x, Center_y)
	table.insert(stuff, player)

	for i = 1, 5 do
	--	for j = 1, 5 do
		local obstacle = Shanghai:new(world, 100+50*i, 300)
	--	local obstacle = Shanghai:new(world, 100+100*j, 100+100*i)
		table.insert(stuff, obstacle)
	--	end
	end
	for i = 1, 50 do
		for j = 1, 5 do
		table.insert(stuff, Collectible_Scrap:new(world, 0+30*j,0+30*i))
		table.insert(stuff, obstacle)
		end
	end	
	


	print("entering game_state")
	print(player:get_id())
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
	
	if key == "back" then
		Gamestate.switch(reset_state)
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


function game_state:leave()
	--love.keyboard.setKeyRepeat( false )
	print("leaving game_state")
end


function game_state:update(dt)
	for k, v in ipairs(stuff) do
		stuff[k]:update(dt)
		if(stuff[k].dead) then
				stuff[k]:remove()
				table.remove(stuff, k)
		end
	end
	cam:lookAt(stuff[1].x, stuff[1].y)
end

function game_state:draw()
    -- print messages
	
    --love.graphics.print(text[i], 10, 15)
	cam:attach()
	map:draw()
	for k, v in ipairs(stuff) do
		stuff[k]:draw()
	end
	
	cam:detach()
	love.graphics.print(love.timer.getFPS())
end