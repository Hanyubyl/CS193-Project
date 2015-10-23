Switch_Door = class('Switch_Door', Entity)
Switch_Door:include(Visual)
Switch_Door:include(Bump)
Switch_Door:include(Movement)

local IMG = load_transparent("Switch_Door.png", 255,0,255)
------------------------------------------------------------------
function Switch_Door:initialize(world, object, settings)
	
	Entity.initialize(self,world, object.x, object.y, settings)
	print("Switch_Door created")
	self:visual_init(IMG, 0, 0, 32, 32,5)
	self:bump_init(self.world, 'Switch_Door', object.x, object.y, 32, 32)
	self:movement_init()
	self.isSwitch_Door = true
	self.timer = 0
	if object.properties.isOpen == "true" then
		self.isOpen = true
	elseif object.properties.isOpen == "false" then
		self.isOpen = false
	end
	self.isWall = false
	self.isActive = false
	self.counter = 0
	self.direction = 5
	self.name = object.name
end

function Switch_Door:draw()
	if self.isOpen then
		self.isWall = false
		self.vis_direction = 5
	else
		self.isWall = true
		self.vis_direction = 1
	end
	self:visual_draw()
	if v_dbg then self:bump_dbg_draw() end	
end

function Switch_Door:remove()
	self:bump_remove()
end

function Switch_Door:activate()
	self.isOpen = not self.isOpen
end

function Switch_Door:update(dt)
	if self.isOpen then
		self.isWall = false
	else
		self.isWall = true
	end
end

function Switch_Door:get_IMG_loc()
	self:visual_get_IMG_loc()
end