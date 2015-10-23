Pickup = class('Pickup', Entity)
Pickup:include(Visual)
Pickup:include(Bump)
require 'Pickup_list'
local Pickup_filter = function(item, other)
	if other.isPlayer then return 'cross'
	end
end

function Pickup:initialize(world, object, settings)
	Entity.initialize(self,world, object.x, object.y, settings)
	if object.properties.key then
		Key_init(self, object)
	end
end


function Pickup:draw()
--	self:visual_draw()
	if v_dbg then self:bump_dbg_draw()
		love.graphics.rectangle("fill",tx, ty, self.rect_w, self.rect_l)
	end	
end

function Pickup:update(dt)

end

function Pickup:remove()
	self:bump_remove()
end