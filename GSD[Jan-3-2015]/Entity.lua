--Entity is the base class!
--Inherit from it using newclass = class('newclass')

Entity = class('Entity') -- declare class

function Entity:initialize(world, x, y, settings)
	self.id = getUID()
	self.dead = false
	self.world = world
	self.x = x
	self.y = y
	if settings then
		for k, v in pairs(settings) do self[k] = v end
	end
end
function Entity:get_id()
	return self.id
end
function Entity:am_i_dead()
	return self.dead
end
function Entity:mark_for_death()
	print("oh no " .. self.id .. " is marked for DEATH!")
	self.dead = true
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
	self.offset_w = w/2
	self.offset_h = h/2
	self.current_frame = 1
	self.visual_quad = {}
	
	print("visual created")
	for i = 1, frames do
		table.insert(self.visual_quad, love.graphics.newQuad(x, y+32*(i-1), w, h, z_img:getDimensions()))
	end
	
end

function Visual:visual_draw()
	--local offset_x, offset_y = self.visual:getDimensions()
	love.graphics.draw(self.visual, self.visual_quad[self.current_frame], self.x, self.y, 0, 1, 1, self.offset_w, self.offset_h )
end

function Visual:visual_get_IMG_loc()
	print(self.x .. " " .. self.y)
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
--	self.world:add(, self.x, self.y, self.rect_w, self.rect_l)
	self.world:add(self, self.x-w/2, self.y-self.rect_l/2, self.rect_w, self.rect_l)
end



function Bump:bump_dbg_draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("line",self.x-self.rect_w/2, self.y-self.rect_l/2, self.rect_w, self.rect_l)
--	love.graphics.rectangle("line",self.x, self.y, self.rect_w, self.rect_l)
end

function Bump:bump_slide(filter, future_x, future_y)
	local rw = self.rect_w/2
	local rl = self.rect_l/2
	local cols, len = self.world:check(self, future_x-rw, future_y-rl, filter)
	
	if len == 0 then
		self.x, self.y = future_x, future_y
		world:move(self, future_x-rw, future_y-rl)
	else
		local col, slide_x, slide_y
		while (len > 0 ) do
			col = cols[1]
			tx, ty, _, _, slide_x, slide_y = col:getSlide()

			self.x, self.y = tx+rw, ty+rl
			self.world:move(self, tx, ty)
			cols, len = self.world:check(self, slide_x, slide_y)
			if (len == 0) then
				self.x, self.y = slide_x+rw, slide_y+rl
				self.world:move(self, slide_x, slide_y)
			end
		end
	end
end

function Bump:bump_static(filter)
	
end

function Bump:bump_remove()
	print("BLEARGH IM DEAD!")
	self.world:remove(self)
end

function Bump:bump_move(l,t)
	if(l ~= nil and t ~= nil) then
		self.world:move(self.item,l,t,w,h)
		self.x = l
		self.y = t
	end
end

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

Movement = {}
function Movement:included(z_entity)
	
end
function Movement:movement_init()
	
	self.vector = Vector(0,0)
	self.velocity_x = self.vector.x
	self.vector_x, self.vector_y = 0
end



------------------------------------------------------
------------------------------------------------------
------------------------------------------------------

Player_control = {}

function Player_control:included(z_entity)
	
end

function Player_control:player_control_init()
--	self.movement_table
end
