
Hold_Objects = class('Hold_Objects', Entity)
Hold_Objects:include(Bump)
local Hold_Objects_filter = function (item, other)
	
	if other.isMinion then 
		return 'cross'
	end
end
function Hold_Objects:initialize(world, w, l, radius, owner, settings)
	self.radius = radius
	self.owner = owner
	self.temp = {}
	Entity.initialize(self,world, self.owner.x, self.owner.y, settings)
	
	self:bump_init(self.world, 'Grabbox', self.owner.x, self.owner.y, w,l)
end

function Hold_Objects:draw()
	if v_dbg then self:bump_dbg_draw() end	
end

function Hold_Objects:update(dt)
	local cols
	local len = 0
	cols, len = self:bump_cross(Hold_Objects_filter, self.owner.x, self.owner.y)
	if len > 0 then
		cols[1].other.x =  cols[1].item.owner.x	
		cols[1].other.y =  cols[1].item.owner.y - 10
		cols[1].other.drawtop = true
		print(cols[1].other.x .. " " .. cols[1].other.y)
		self.temp = cols[1]
	end
		
	
end


function Hold_Objects:remove()
	self.temp.drawtop = false
	self:bump_remove()
end