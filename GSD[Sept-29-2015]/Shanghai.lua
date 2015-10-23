Shanghai = class('Shanghai', Entity)
Shanghai:include(Visual)
Shanghai:include(Bump)
Shanghai:include(Movement)
Shanghai:include(Hittable)

local shanghaiFilter = function(item, other)
	if other.isWall then return 'bounce'
	elseif other.isAttack then return 'cross' end
end

local IMG = load_transparent("shanghaisprite.png", 255,0,255)
------------------------------------------------------------------
function Shanghai:initialize(world, x, y, settings)
	Entity.initialize(self,world, x, y, settings)
	print("Shanghai created")
	self:visual_init(IMG, 0, 65, 32, 32,2)
	self:bump_init(self.world, 'Shanghai', x, y, 20,20)
	self:movement_init()
	self:hittable_init()
	self.isShanghai = true
end

function Shanghai:draw()
	self:visual_draw()
	if v_dbg then self:bump_dbg_draw() end	
end

function Shanghai:remove()
	self:bump_remove()
end

function Shanghai:update(dt)
	self.future_x = self.x + self.velo.x * dt
	self.future_y = self.y + self.velo.y * dt	
	local cols, len = self:bump_move(shanghaiFilter, self.future_x, self.future_y)
	
	self:hittable_update(dt)
	
	for i = 1, len do
		local other = cols[i].other
		if other.isAttack then
			if self.isMovable and not self.isHitstun then
				self:hittable_knockback(other)
			end
		end
	end
			
--	self:bump_get_collisions(nil, self.x, self.y)

end

function Shanghai:get_IMG_loc()
	self:visual_get_IMG_loc()
end