Enemy = class('Enemy', Entity)

Enemy:include(Visual)
Enemy:include(Bump)
Enemy:include(Health_mana)
Enemy:include(Movement)

local sfx_hit = love.audio.newSource("se_graze.wav", "static")
local IMG = load_transparent("shanghai_dr.png", 255,0,255)

local Enemy_collisions = function(cols)
	if cols.other.isShots then
		cols.item:sub_hp(50)
		sfx_hit:play()
		cols.other:mark_for_death()
			function es1()
				cols.item.envx = 0
				cols.item.envy = 0
			end
			function ee1()
				cols.item.envx = 1
				cols.item.envy = 1
			end		
		
		cols.item:dttimer_add(dttimer:new(es1, ee1, .1))
	end
	if cols.other.isPlayer then
		cols.other:sub_hp(200)
		sfx_hit:play()
	end
end
local Enemy_filter = function(item, other)
	if other.isDestroyblock then return 'slide'
	elseif other.isShots then return 'cross'
	elseif other.isWall then return 'slide'
	elseif other.isPlayer then return 'cross'
	end
end
function Enemy:initialize(world, object, settings)
	Entity.initialize(self,world, object.x, object.y, settings)
	self:visual_init(IMG, 0, 0, 32, 32,1)
	self:bump_init(self.world, 'Enemy', object.x, object.y, 30, 30)
	self:health_mana_init(200,1)
	self:movement_init()
end

function Enemy:draw()
	if v_dbg then self:bump_dbg_draw() end	
	self:visual_draw()
end

function Enemy:update(dt)
	if player.x < self.x then
		self:setveloleft(100)
	end
	if player.x > self.x then
		self:setveloright(100)
	end
	if player.y < self.y then
		self:setveloup(100)
	end	
	if player.y > self.y then
		self:setvelodown(100)
	end	
	print(self.velo.x .. " " .. self.velo.y)
	self:hp_monitor()
	if self.death_flag then
		self:mark_for_death()
	end
		local future_x = self.x + (self.velo.x*self.envx)*dt 
		local future_y = self.y + (self.velo.y*self.envy)*dt
	local cols, len = self:bump_move(Enemy_filter, future_x, future_y)
	
	self:bump_collisions(cols, len, Enemy_collisions)
	self:dttimer_tickdown(dt)
	self:dttimer_remove()
end

function Enemy:remove()
	self:bump_remove()
end