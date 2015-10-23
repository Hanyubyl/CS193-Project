Player = class('Player', Entity)
Player:include(Visual)
Player:include(Bump)

Player:include(Movement)
Player:include(Hold_objects)

Player:include(Stats)
Player:include(Weapon)

Player:include(Attack)
Player:include(Hittable)
Player:include(Health_mana)

Player:include(Shot_spawner)
--Player:include(Attack)
local Player_filter = function(item, other)
	if other.isShanghai then return 'slide'
	
	elseif other.isWall then return 'slide'
	end
end

local IMG = load_transparent("testshanghaisprite.png", 255,0,255)
					-- # of states
local ani_list = {  9, 
					-- state name, frames, length of each frame 
					{"move_right", 4, 0.1},
					{"move_up", 4, 0.1},
					{"move_left", 4, 0.1},
					{"move_down", 4, 0.1},
					{"idle_right", 2, 0.5},
					{"idle_up", 2, 0.5},
					{"idle_left", 2, 0.5},
					{"idle_down", 2, 0.5},
					{"attack_right", 4, 0.05}
				}
function Player:initialize(world, x, y, z, settings)
	Entity.initialize(self,world, x, y, settings)
	print("Player created")
	self:visual_init_test(IMG,32, 32, ani_list)
	
	self:bump_init(self.world, 'Player', x, y, 25,25)
	self:movement_init(0,0)
	
	self.isPlayer = true
	self:attack_init()

	self:health_mana_init(100,100)
	self.isControlled = false
end

function Player:draw()
	if v_dbg then self:bump_dbg_draw()
		love.graphics.rectangle("fill",tx, ty, self.rect_w, self.rect_l)
	end	
	self:visual_draw_test()
end

function Player:update(dt)
	--Movement
	
	--Controls
	--self:player_controls(dt)
	--local speed = 200
	
	-- getting hit
	
	-- map collision

		
		local future_x = self.x + self.velo.x*self.envx *dt
		local future_y = self.y + self.velo.y*self.envy *dt
		self:bump_move(Player_filter, future_x, future_y)

	self:dttimer_tickdown(dt)
	self:dttimer_remove()
	self:vis_update(dt)
end

-- world, center_obj, direction, x, y, w, l, radius, timer, dmg,settings)

function Player:shoot()
	self:spawn_shot(true, 1, 300, 4)
end

function Player:get_IMG_loc()
	self:visual_get_IMG_loc()
end

function Player:remove()
	self:bump_remove()
end