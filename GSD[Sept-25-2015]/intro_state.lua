
function intro_state:enter()
	print("entering intro state")
	splash = love.graphics.newImage("marisa.png")
	max_alpha = 255
	fade_alpha = 255
	fade_alpha_splash = 0
	timer = 0
	max_fade_timer = 1
	wait_time = 5
	--832 7766
	kira = love.audio.newSource("se_chargeup.wav", "static")
	kira_play = true
end
function intro_state:draw()
	
	love.graphics.print(love.timer.getFPS())
	if timer > 1  then
		love.graphics.draw(splash, Width/2-splash:getWidth()/2, Height/2-splash:getHeight()/2)
	end
end

function intro_state:leave()
	print("leaving intro state")
	
end

function intro_state:update(dt)
	timer = timer + dt
	if timer > 1 and kira_play then
		kira_play = false
		kira:play()
	end
	
	if timer > 5 then
		Gamestate.switch(main_menu_state)
	end
	
	print(gpr)
end

function intro_state:gamepadpressed(JS, key)

	if key == "start" or wait_time == 0 then
		Gamestate.switch(game_state)
	end
end

function intro_state:gamepadreleased(JS, key)

end