require "game_state_enter"
local sti = require "sti"
require "mapfunction"


function game_state:enter()
	--load map
	map = sti.new("assets/maps/testmap")
	broadcasted = {}
	loadlayers(map, world, broadcasted)
	
	math.randomseed( os.time() )
	tx,ty = 0,0
	ppp = function( a ) print(a) end
	-- load map function

	text = {}
	playertable = {}
	plcon = Player_Controller:new(world)
	
	player = Player:new(world, Center_x-500, Center_y, true)
	player2 = Player:new(world, Center_x-600, Center_y, true)
	player3 = Player:new(world, Center_x-650, Center_y, true)
	
	plcon:add_player(player)
	plcon:add_player(player2)
	plcon:add_player(player3)
	
	--[[	player1 = Player:new(world, Center_x-500 - 20, Center_y, false)
	player2 = Player:new(world, Center_x-500 - 40, Center_y, false)
	player3 = Player:new(world, Center_x-500 - 40, Center_y, false)]]--
--	table.insert(playertable, player)
--[[	table.insert(playertable, player1)
	table.insert(playertable, player2)
	table.insert(playertable, player3)]]--

	for i = 1, 4 do
	--	for j = 1, 5 do
		Shanghai:new(world, -100 +20*i, 300+i)
	--	local obstacle = Shanghai:new(world, 100+100*j, 100+100*i)
		
	--	end
	end
	for i = 1, 3 do
		for j = 1, 5 do
			Collectible_Scrap:new(world, 0+30*j,0+30*i)
		end
	end	
	
	--for i = 1, 3 do
	--	player:create_minions()
		
	--end
	


	print("entering game_state")
end
	
function game_state:gamepadpressed(JS, key)
	if key == "start" then
		player:zeroinputs()
		Gamestate.push(pause_menu_state)
	end
	
	if key == "back" then
		Gamestate.switch(reset_state)
	end
	
	plcon:inputdown(key)
end


function game_state:gamepadreleased(JS, key)

	plcon:inputup(key)
	
end


function game_state:leave()
	--love.keyboard.setKeyRepeat( false )
	print("leaving game_state")

end


function game_state:update(dt)

	local stuff = world:getItems()
	--player:update(dt)
	for k, v in ipairs(stuff) do
	--	if(stuff[k].isPlayer == false) then
			stuff[k]:update(dt)
	--	end
		if(stuff[k].dead) then
				stuff[k]:remove()
				table.remove(stuff, k)
		end
	end
	plcon:update(dt)
	cam:lookAt(plcon:get_cam_coords())
end

function game_state:draw()
	local stuff = world:getItems()
    -- print messages
	
    --love.graphics.print(text[i], 10, 15)
	cam:attach()
	map:draw()
	local drawtop = {}
	--map:drawObjectLayer("walls")
	for k, v in ipairs(stuff) do
		if stuff[k].drawtop == false then
			stuff[k]:draw()
		else
			table.insert(drawtop, stuff[k])
		end
	end
	for k, v in ipairs(drawtop) do
			drawtop[k]:draw()
	end
	
	cam:detach()
	love.graphics.print(love.timer.getFPS())
end