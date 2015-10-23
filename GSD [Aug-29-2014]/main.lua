Gamestate = require "hump.gamestate"
Camera = require "hump.camera"
Object = require "classic"

require "entities_sprites"
require "sprites_pt"


intro_state = {}
game_state = {}
pause_menu_state = {}
cam = {}

require "intro_state"
require "game_state"
require "pause_menu_state"

e_dbg = 1

function love.load()
	dpad_table = {}
	for i = 1, 2 do
		dpad_table[i] = 0
	end

	id_count = 0
	function id()
		id_count = id_count+1
		return id_count 
	end
	love.window.setMode(800, 600, {resizable=false, vsync=false, fullscreen=false, fsaa=0})

	Width = love.graphics.getWidth()
	Height = love.graphics.getHeight()
	Center_x = Width/2
	Center_y = Height/2
	Gamestate.registerEvents()
	Gamestate.switch(intro_state)
	

end

function love.update(dt)
	JS = love.joystick.getJoysticks()
	--Framerate limited to 120 for performance purposes
	if dt < 1/120 then
	  love.timer.sleep(1/120 - dt)
	end

end

