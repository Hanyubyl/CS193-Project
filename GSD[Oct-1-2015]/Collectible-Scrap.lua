Player = class('Player', Entity)
Player:include(Visual)
Player:include(Bump)
Player:include(Movement)

local IMG_shanghai = load_transparent("shanghai_back.png", 255,0,255)

function Player:initialize(world, x, y, settings)
	Entity.initialize(self,world, x, y, settings)
	print("Player " .. self.id .. " created")
	self:visual_init(IMG_shanghai, 0, 0, 36, 36)
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
	elseif(dpad_table[1] == 1) then
		dx = speed * dt
	end
	if(dpad_table[2] == -1) then
		dy = -speed * dt
	elseif(dpad_table[2] == 1) then
		dy = speed * dt
	end
	
	if dx ~= 0 or dy ~= 0 then
		local future_x, future_y = self.x + dx, self.y + dy 
		self:bump_slide(nil, future_x, future_y)
	end
end
 
function Player:get_IMG_loc()
	self:visual_get_IMG_loc()
end

function Player:remove()
	self:bump_remove()
end