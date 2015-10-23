require "Attack"
Attack_Sweep = class('Attack_Sweep', Entity)
Attack_Sweep:include(Bump)
local Attack_Sweep_filter = function(item, other)
	if other.isWall then return 'slide' end
		
end

function Attack_Sweep:initialize(world, direction, w, l, radius, timer, dmg, owner, settings)
	Attack.initialize(self, world, owner.x, owner.y, w, l, dmg, settings)
	print("Attack_Sweep " .. self.id .. " started")
	self.timer = timer
	self.timer_start = 0
	self.radius = radius
	self.damage = dmg
	self.direction = direction
	self.owner = owner
	
	self.sweep_start = ((self.direction - 1)/4) * math.pi
end

function Attack_Sweep:update(dt)
	
	local cols, len = self:bump_cross(Attack_Sweep_filter, self.owner.x + math.cos(self.sweep_start)*self.radius, 
							self.owner.y - math.sin(self.sweep_start)*self.radius)
	
	--[[
	if len > 0
		for i = 1, len do
			local other = cols[i].other
			if other.isMinion then
				-- bounce off 
				local slope = (other.x - self.x)/(other.y - self.y)
			end
		end
	end
	]]--
	
	
	self.timer_start = self.timer_start + dt
	self.sweep_start = self.sweep_start + math.pi*2/3 * (1/self.timer)*dt
	--print(self.timer_start)
	if self.timer_start > self.timer then
		self:mark_for_death()
	end
end

function Attack_Sweep:draw()
	if v_dbg then self:bump_dbg_draw() end	
end

function Attack_Sweep:remove()
	self:bump_remove()
end