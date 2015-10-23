Minion = class('Minion', Entity)
Minion:include(Visual)
Minion:include(Bump)
Minion:include(Movement)
Minion:include(Grabbable)
local Minion_filter = function(item, other)
	if other.isAttack then 
		if next (other.hitlist) == nil then
			return 'cross' 
		end
	end
end
local IMG = load_transparent("Shanghaisprite.png", 255,0,255)
------------------------------------------------------------------
function Minion:initialize(world, x, y, direction, scale, settings)
	Entity.initialize(self,world, x, y, settings)
	print("Minion" .. self.id .. " created")
	self:visual_init(IMG, 0, 0, 32, 32,8)
	self:bump_init(self.world, 'Minion', x, y, 20,20)
	self:movement_init()
	self:grabbable_init()
	
	
	self.isMinion = true
	self.isGrabbable = true
	self.timer = 0
	self.direction = direction
	self.scale = scale

end

function Minion:draw()
	self:visual_draw()
	if v_dbg then self:bump_dbg_draw() end	
end

function Minion:remove()
	self:bump_remove()
end

function Minion:update(dt)
		local cols, len = self:bump_slide(Minion_filter, self.x, self.y)
	
		
		
		if self.timer < .99 then
			self.timer = self.timer + dt
			local frame = math.floor(self.timer * 8)+1
			if frame > 8 then
				frame = 8
			end
			self.current_frame =  frame
		else
			self.timer = 0
		end
end

function Minion:get_IMG_loc()
	self:visual_get_IMG_loc()
end