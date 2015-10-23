--Entity is the base class!
--Inherit from it using newclass = class('newclass')

Entity = class('Entity') -- declare class

function Entity:initialize(world, x, y, settings)
	self.dead = false
	self.world = world
	self.x = x
	self.y = y
	self.dt = 0 
	if settings then
		for k, v in pairs(settings) do self[k] = v end
	end

	self.status_list ={}
end

function Entity:status_effect(effect, timer)
-- start status effect, add status into status list
	table.insert(self.status_list, effect)
end


function Entity:am_i_dead()
	return self.dead
end

function Entity:mark_for_death()
	print("oh no " .. self.type .. " is marked for DEATH!")
	self.dead = true
end

function Entity:timers(var, dt)

end
--mixins are modules!
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
Visual = {}

function Visual:included(z_entity)
	--print("Visual of " .. z_entity.id .. " was created at " .. z_entity.x .. ", " .. z_entity.y) 
end



function Visual:visual_init(z_img, x, y, w, h, frames)
	self.visual = z_img
	
	self.visual_quad = {}
	self.drawtop = false
	self.vis_halfw = w/2
	self.vis_halfh = h/2
	self.vis_direction = 1
	self.current_frame = self.vis_direction
	--print("visual created")
	for i = 1, frames do
		table.insert(self.visual_quad, love.graphics.newQuad(x, y+32*(i-1), w, h, z_img:getDimensions()))
	end
	
end

function Visual:visual_init_test(z_img, w, h, ani_list)

	self.vis_state = "idle_down"
	self.vis_laststate = "idle_down"
	
	self.visual = z_img
	self.vis_dt = 0
	self.vis_frame = 1
	self.visual_quad = {}
	self.drawtop = false
	self.vis_halfw = w/2
	self.vis_halfh = h/2
	self.vis_mult = 1 -- controls speed
	self.current_frame = self.vis_direction
	--print("visual created")
	local x = 0
	local y = 0
	for i = 2, ani_list[1]+1 do
		--prepare table's keys (state)
		self.visual_quad[ani_list[i][1]] = {}
		
		for j = 1, ani_list[i][2] do
			--the table's keys will have a table of images
			table.insert(self.visual_quad[ani_list[i][1]],
			love.graphics.newQuad(x+33*(i-2)+1, y+33*(j-1)+1,
						w, h, z_img:getDimensions()))
		end
		self.visual_quad[ani_list[i][1]].vdt =  ani_list[i][3]

		self.visual_quad[ani_list[i][1]].frames = ani_list[i][2]
	end
	
end

function Visual:visual_draw()
	--local offset_x, offset_y = self.visual:getDimensions()
	love.graphics.draw(self.visual, self.visual_quad[self.vis_direction], self.x, self.y, 0, 1, 1)
end

function Visual:visual_draw_test()
	--local offset_x, offset_y = self.visual:getDimensions()
	love.graphics.draw(self.visual, self.visual_quad[self.vis_state][self.vis_frame], self.x, self.y, 0, 1, 1)
end

function Visual:visual_get_IMG_loc()
	print(self.x .. " " .. self.y)
end

function Visual:vis_update(dt)
	self.vis_dt = self.vis_dt + dt
	if self.vis_laststate ~= self.vis_state then
		self.vis_frame = 1
		self.vis_laststate = self.vis_state
	end
	
	
	if self.vis_dt > self.visual_quad[self.vis_state].vdt then
		self.vis_frame = self.vis_frame + 1
		self.vis_dt = 0
	end
	
	if self.vis_frame > self.visual_quad[self.vis_state].frames then
		self.vis_frame = 1
	end
end
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
Bump = {}

function Bump:included(z_entity)
	--print("Rectangle Collision box " .. z_entity.id .. " was created at " .. z_entity.x .. ", " ..z_entity.y) 
end

function Bump:bump_init(world, type, x, y, w, l)
	self.type = type
	self.collisions = {}
	self.len = 0
	self.world = world
	self.rect_w = w
	self.rect_l = l
	self.world:add(self, self.x, self.y, self.rect_w, self.rect_l)
--	self.future_x = self.x
--	self.future_y = self.y
end

function Bump:bump_dbg_draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("line",self.x, self.y, self.rect_w, self.rect_l)

end

function Bump:bump_move(filter, future_x, future_y)
	local actualX, actualY, cols, len = self.world:move(self, future_x, future_y, filter)
	self.x, self.y = actualX, actualY
	return cols, len
end

function Bump:bump_remove()
	print("BLEARGH IM DEAD!")
	self.world:remove(self)
end

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

Movement = {} 
function Movement:included(z_entity)

end
function Movement:movement_init(zx,zy, envx, envy)
	--[[self.diag_cnst = 0.707
	self.isDiag = 0
	if self.veloverti and self.velohoriz then
		self.isDiag = 1
	end
	]]--
	--default values
		zx = zx or 0
		zy = zy or 0
		envx = envx or 0
		envy = envy or 0
	self.velo = Vector(zx,zy)
	--self.environ_velo = Vector(envx, envy)
	self.default_speed = 200
	self.freeze = 0
end

function Movement:veloup(velo)
	if self.freeze == 0 then
		self.velo.y = self.velo.y - velo
	end
end

function Movement:velodown(velo)
	if self.freeze == 0 then
		self.velo.y = self.velo.y + velo
	end
end

function Movement:veloleft(velo)
	if self.freeze == 0 then
		self.velo.x = self.velo.x - velo
	end
end

function Movement:veloright(velo)
	if self.freeze == 0 then
		self.velo.x = self.velo.x + velo
	end
end

function Movement:veloup_up(velo)
	if self.freeze == 0 then
		self.velo.y = self.velo.y + velo
	end
end

function Movement:velodown_up(velo)
	if self.freeze == 0 then
		self.velo.y = self.velo.y - velo
	end
end

function Movement:veloleft_up(velo)
	if self.freeze == 0 then
		self.velo.x = self.velo.x + velo
	end
end

function Movement:veloright_up(velo)
	if self.freeze == 0 then
		self.velo.x = self.velo.x - velo
	end
end

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

Summon_minions = {}
function Summon_minions:summon_minions_init()
	self.minions = {}
	self.minions_count = 0
end

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

Hold_objects = {}

function Hold_objects:hold_objects_init(x,y,r)
	self.hold_x = x
	self.hold_y = y
	self.hold_r = r
	self.grabbox = {}
	self.isHolding = false
end

function Hold_objects:grab_start()
	self.grabbox =  Hold_Objects:new(self.world, 5, 5, 30, self)
end

function Hold_objects:grab(filter)
	
end

function Hold_objects:grab_end()
	self.grabbox:remove()
	self.grabbox = {}
end

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

Grabbable = {}

function Grabbable:grabbable_init()
	self.grabbedby = {}
end

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

Attack = {}

function Attack:attack_init()
	self.default_weapon = {
		["weapon_type"] = "fist",
		["base_power"] = 10,
		["length"] = 15,
		["width"] = 15,
		["offset_x"] = 5,
		["offset_y"] = 0,
		["timer"] = 0.05,
		["force"] = 100,
		["kb_time"] = .10,
		------
		["path"] = {
			["pattern"] = "poke", 
			["distance"] = 20
		}
	}
	self.attack_table = {}
	self.isAttacking = false
	
	self.default_filter = function(item, other)
		if other.isShanghai then return 'cross' end
	end
end

function Attack:attack_update(dt)
	if self.isAttacking == true then
		
	end
end

function Attack:attack_spawn(z_weapon, z_filter)
	local weapon = z_weapon or self.default_weapon
	local filter = z_filter or self.default_filter
	self.isAttacking = true
	--account for direction on weapon spawn
	if weapon.path.pattern == "poke" then
		self.attack_table = Attack:new(self, weapon, filter)
	end
end

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

Hittable = {}

function Hittable:hittable_init()
	-- force of 100 hitting mass of 100 means you move 100px in 6 frames
	-- force of 200 hitting mass of 100 means you move 200px in 6 frames
	-- force of 100 hitting mass of 50 means you move  200px in 6 frames
	-- forumla is (FORCE/MASS) * 10px
 	self.mass = 200
	self.isMovable = true
	self.kb_time = 0
	self.isHitstun = false
	
end

function Hittable:hittable_knockback(other)
	local force = other.weapon.force/self.mass * 1000
	local del_x = math.abs(other.owner.x - self.x)
	local del_y = math.abs(other.owner.y - self.y)
	self.isHitstun = true
	self.kb_time = other.weapon.kb_time
	
	local slope = 0
	if del_x ~= 0 and del_y ~= 0 then
		 
		local tan_ratio = del_y/del_x
		local radian = math.atan(tan_ratio)
		
		if(other.x < self.x) then
			self.velo.x = self.velo.x + force * math.cos(radian)
		elseif(self.x < other.x) then
			self.velo.x = self.velo.x - force * math.cos(radian)
		end
		if(other.y < self.y) then
			self.velo.y = self.velo.y + force * math.sin(radian)
		elseif(self.y < other.y) then
			self.velo.y = self.velo.y - force * math.sin(radian)
		end
	--else if del_y ~= 0 then
	--	local cot_ratio = del_x/del_y
	end
end

function Hittable:hittable_bounce(other)
	self.mass = 0
end

function Hittable:hittable_update(dt)
	if self.kb_time > 0 then
		self.kb_time = self.kb_time - dt
		if self.kb_time < 0 then
			self.velo.x = 0
			self.velo.y = 0
			self.isHitstun = false
		end
	end
end

