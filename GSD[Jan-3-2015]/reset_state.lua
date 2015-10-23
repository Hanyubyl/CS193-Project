function reset_state:enter()
	print("entering reset_state")
	for k, v in ipairs(stuff) do
		stuff[k]:remove()
	end
	Gamestate.switch(game_state)
end
function reset_state:leave()
	print("leaving reset_state")
end

function reset_state:update(dt)
	
end
