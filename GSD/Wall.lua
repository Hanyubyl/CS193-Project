-- Wall.lua

Wall = class('Wall', Entity)
Wall:include(Visual)
Wall:include(Bump)


local IMG = load_transparent("Shanghaisprite.png", 255,0,255)
------------------------------------------------------------------
function Wall:initialize(world, object, settings)
	
	Entity.initialize(self,world, object.x, object.y, settings)
	print("Wall created")
	--self:visual_init(IMG, 0, 0, 32, 32,8)
	self:bump_init(self.world, 'Wall', object.x, object.y, object.width, object.height)
	self.isWall = true
	self.timer = 0
end

function Wall:draw()
	--self:visual_draw()
	if v_dbg then self:bump_dbg_draw() end	
end

function Wall:remove()
	self:bump_remove()
end

function Wall:update(dt)
--	self:bump_get_collisions(nil, self.x, self.y)

end

function Wall:get_IMG_loc()
	self:visual_get_IMG_loc()
end