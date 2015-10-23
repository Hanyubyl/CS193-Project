Attack = class('Attack', Entity)
Attack:include(Visual)
Attack:include(Bump)

function Attack:initialize(z_owner, z_weapon, z_filter, z_timer)

	Entity.initialize(self, z_owner.world, z_owner.x, z_owner.y, settings)
	print("Attack " .. self.id .. " created")
	self:bump_init(self.world, "Attack", z_owner.x, z_owner.y, z_weapon.width,z_weapon.length)
	
	self.owner = z_owner
	self.weapon = z_weapon
	self.filter = z_filter
	self.base_timer = z_weapon.timer or 0.05
	self.timer = z_weapon.timer or 0.05
	self.base_power = z_weapon.base_power or 10
	
	
	
	self.isAttack = true
	self.hitlist = {}
end

function Attack:draw()
	if v_dbg then self:bump_dbg_draw() end	
end
 
function Attack:get_IMG_loc()
	self:visual_get_IMG_loc()
end

function Attack:remove()
	self:bump_remove()
end


function Attack:update(dt)
	
	--account for direction [!!] 
	if self.weapon.path.pattern == "poke" then
		self.future_x = self.owner.x
		self.future_y = self.owner.y - self.weapon.path.distance * (1-self.timer/self.base_timer)
		self:bump_slide(self.filter, self.future_x, self.future_y)
	end

	self.timer = self.timer - dt
	if self.timer < 0 then
		self:mark_for_death()
	end
end
