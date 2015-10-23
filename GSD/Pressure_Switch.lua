Pressure_Switch = class('Pressure_Switch', Entity)
Pressure_Switch:include(Visual)
Pressure_Switch:include(Bump)
Pressure_Switch:include(Movement)

local IMG = load_transparent("Pressure_Switch.png", 255,0,255)
local ani_list = {  2, 
					-- state name, frames, length of each frame 
					{"idle_down", 1, 1},
					{"pressed", 1,1}
				}
------------------------------------------------------------------
function Pressure_Switch:initialize(world, object, settings)
	--local tile_offset = 8
	Entity.initialize(self,world, object.x, object.y, settings)
	print("Pressure_Switch created")
	self:visual_init_test(IMG,32, 32, ani_list)
	self:bump_init(self.world, 'Pressure_Switch', object.x, object.y, 32, 32)
	self:movement_init()
	self.broadcast = object.properties.broadcast --string
	self.isPressure_Switch = true
	self.isPressed = false
	if object.properties.toggle == "true" then 
		self.whenOffActivate = false
	else
		self.whenOffActivate = true
	end
	self.timer = 0
end

function Pressure_Switch:draw()
	self:visual_draw_test()
	if v_dbg then self:bump_dbg_draw() end	
end

function Pressure_Switch:remove()
	self:bump_remove()
end

function Pressure_Switch:update(dt)
	local actualX, actualY, cols, len = world:check(self, self.x, self.y, Collectible_Scrap_filter)
	
	--behavior for pressure switch
	for i = 1, len do 
		local other = cols[i].other
		if other.isPlayer and not self.isPressed then
			self.vis_state = "pressed"
			self.isPressed = true
		
			for i,v in ipairs(broadcasted) do
				if broadcasted[i].name == self.broadcast then
					broadcasted[i]:activate()
				end
			end
		end
	end
	
	if len == 0 and self.isPressed then
		self.isPressed = false
		self.vis_state = "idle_down"
		for i,v in ipairs(broadcasted) do
			if broadcasted[i].name == self.broadcast then
				if self.whenOffActivate then
					broadcasted[i]:activate()
				end
			end
		end		
	end
	
end

function Pressure_Switch:get_IMG_loc()
	self:visual_get_IMG_loc()
end