Gamestate = require "hump.gamestate"
Camera = require "hump.camera"
Vector = require "hump.vector"
class = require "middleclass"
bump = require "bump"

require "sprites_pt"
require "Entity"
require "Shanghai"
require "Player"
require "factory"
require "Collectible_Scrap"

intro_state = {}
game_state = {}
pause_menu_state = {}
reset_state = {}
cam = {}



v_dbg = true

id_count = 0

function getUID()
	id_count = id_count+1
	return id_count 
end

created = {}
function love.load()
	world = bump.newWorld(36)
	JS = love.joystick.getJoysticks()
	dpad_table = {}
	for i = 1, 2 do
		dpad_table[i] = 0
	end
	love.graphics.setBackgroundColor(50,50,50)


	love.window.setMode(800, 600, {resizable=false, vsync=false, fullscreen=false, fsaa=0})

	Width = love.graphics.getWidth()
	Height = love.graphics.getHeight()
	Center_x = Width/2
	Center_y = Height/2
	cam = Camera(Width/2,Height/2)
	Gamestate.registerEvents()
	Gamestate.switch(intro_state)
	

end

function love.update(dt)
	
	--Framerate limited to 120 for performance purposes
	if dt < 1/120 then
	  love.timer.sleep(1/120 - dt)
	end

end

require "intro_state"
require "game_state"
require "pause_menu_state"
require "reset_state"