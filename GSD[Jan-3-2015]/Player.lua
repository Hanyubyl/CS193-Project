Player = class('Player', Entity)
Player:include(Visual)
Player:include(Bump)
Player:include(Movement)
local Player_filter = function(other)
	local collided_name = other.type
	return collided_name == "Shanghai" 
end

local IMG = load_transparent("shanghaisprite.png", 255,0,255)

function Player:initialize(world, x, y, settings)
	Entity.initialize(self,world, x, y, settings)
	print("Player" .. self.id .. " created")
	self:visual_init(IMG, 0, 0, 32, 32,8)
	self:bump_init(self.world, 'Player', x, y, 20,20)
	self:movement_init()
end

function Player:draw()
	self:visual_draw()
	if v_dbg then self:bump_dbg_draw()
		love.graphics.rectangle("fill",tx, ty, self.rect_w, self.rect_l)
	end	
end

function Player:update(dt)
	local dx, dy = 0, 0
	local speed = 200
	
	if(dpad_table[1] == -1) then
		dx = -speed * dt
		self.current_frame = 3
	elseif(dpad_table[1] == 1) then
		dx = speed * dt
		self.current_frame = 7
	end
	if(dpad_table[2] == -1) then
		dy = -speed * dt
		self.current_frame = 1
		if(dpad_table[1] == -1) then
			self.current_frame = 2
		elseif (dpad_table[1] == 1) then
			self.current_frame = 8
		end
	elseif(dpad_table[2] == 1) then
		dy = speed * dt
		self.current_frame = 5
		if(dpad_table[1] == -1) then
			self.current_frame = 4
		elseif (dpad_table[1] == 1) then
			self.current_frame = 6
		end
	end
	
	if dx ~= 0 or dy ~= 0 then
		local future_x, future_y = self.x + dx, self.y + dy 
		self:bump_slide(Player_filter, future_x, future_y)
	end
	
end
 
function Player:get_IMG_loc()
	self:visual_get_IMG_loc()
end

function Player:remove()
	self:bump_remove()
end