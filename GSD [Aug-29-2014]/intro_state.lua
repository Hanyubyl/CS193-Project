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
function intro_state:keyreleased(key)
	if key == "return" then
		Gamestate.switch(game_state)
	end
end