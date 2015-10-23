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
	
	player = Player:new(world, Center_x-50, Center_y+100, true)
	statusbar = Status_bar:new(player)
	inventory = Inventory:new(player)
	player2 = Player:new(world, Center_x-40, Center_y+100, true)
	player3 = Player:new(world, Center_x-60, Center_y+100, true)
	
	plcon:add_player(player)
	plcon:add_player(player2)
	plcon:add_player(player3)

	
	--for i = 1, 3 do
	--	player:create_minions()
		
	--end
	


	print("entering game_state")
end
	
function game_state:gamepadpressed(JS, key)
	if key == "start" then
	--	player:zeroinputs()
		Gamestate.push(pause_menu_state)
	end
	
	if key == "back" then
	local stuff = world:getItems()
	for k, v in ipairs(stuff) do
		stuff[k]:remove()
		table.remove(stuff, k)
	end
		Gamestate.pop()
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
	statusbar:draw()
	inventory:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.print(love.timer.getFPS())
end