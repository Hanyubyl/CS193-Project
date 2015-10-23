Destroyblock = class('Destroyblock', Entity)

Destroyblock:include(Visual)
Destroyblock:include(Bump)
Destroyblock:include(Health_mana)

local IMG = load_transparent("Destroyblock.png", 255,0,255)
local sfx_hit = love.audio.newSource("se_graze.wav", "static")
local Destroyblock_collisions = function(cols)
	if cols.other.isShots then
		cols.item:sub_hp(50)
		sfx_hit:play()
		cols.other:mark_for_death()
	end
end

function Destroyblock:initialize(world, object, settings)
	
	Entity.initialize(self,world, object.x, object.y, settings)
	print("Destroyblock created")
	self:health_mana_init(100,1)
	self:bump_init(self.world, 'Destroyblock', object.x, object.y, object.width, object.height)
	self:visual_init(IMG, 0, 0, 32, 32,1)
	self.isDestroyblock = true
	--self.isWall = true
	self.timer = 0
end


function Destroyblock:update(dt)
	self:hp_monitor()
	if self.death_flag then
		self:mark_for_death()
	end
	local actualX, actualY, cols, len = world:check(self, self.x, self.y)
	self:bump_collisions(cols, len, Destroyblock_collisions)
	self:dttimer_tickdown(dt)
	self:dttimer_remove()
end

function Destroyblock:draw()
	if v_dbg then self:bump_dbg_draw() end	
	self:visual_draw()
end

function Destroyblock:remove()
	sfx_hit:play()
	self:bump_remove()
end