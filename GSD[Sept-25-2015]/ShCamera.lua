ShCamera = class('ShCamera', Entity)
Shanghai:include(Bump)
Shanghai:include(Movement)

function Shanghai:initialize(world, x, y, settings)
	Entity.initialize(self,world, x, y, settings)
	print("ShCamera " .. self.id .. " created")
	self:bump_init(self.world, 'Camera', x, y, 2,2)
	self:movement_init()
end

