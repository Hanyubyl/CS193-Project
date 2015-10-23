Shanghai = class('Shanghai', Entity)
Shanghai:include(Visual)
Shanghai:include(Bump)
Shanghai:include(Movement)


local IMG = load_transparent("shanghaisprite.png", 255,0,255)
------------------------------------------------------------------
function Shanghai:initialize(world, x, y, settings)
	Entity.initialize(self,world, x, y, settings)
	print("Shanghai" .. self.id .. " created")
	self:visual_init(IMG, 0, 65, 32, 32,2)
	self:bump_init(self.world, 'Shanghai', x, y, 20,20)
	self:movement_init()
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
--	self:bump_get_collisions(nil, self.x, self.y)

end

function Shanghai:get_IMG_loc()
	self:visual_get_IMG_loc()
end