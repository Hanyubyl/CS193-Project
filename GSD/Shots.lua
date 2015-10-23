-- Shots.lua

Shots = class('Shots', Entity)
Shots:include(Visual)
Shots:include(Bump)
Shots:include(Movement)
local Shots_filter = function(item, other)
	if other.isWall then
	--	item:mark_for_death()
		return 'touch' end
end

local Shots_collisions = function(cols)
	if cols.other.isWall then
		cols.item:mark_for_death()
	end
end

local IMG = load_transparent("shots.png", 255,0,255)
------------------------------------------------------------------
local ani_list = {  1, 
					-- state name, frames, length of each frame 
					{"idle_down", 4, 0.1}
				}
function Shots:initialize(world, object, dir, velo, timer, settings)
	
	Entity.initialize(self,world, object.center_x, object.center_y, settings)
	print("Shots created")
	self:visual_init_testt(IMG,8, 8, ani_list)
	self:bump_init(self.world, 'Shots', object.x, object.y, 8, 8)
	self:movement_init()
	self.isShots = true
	self.timer = timer
	self.shotvelo = velo
	self.dir = dir
	dir_to_velo(self, self.dir, self.shotvelo)
	
end

function Shots:draw()
--[[	if v_dbg then self:bump_dbg_draw()
	--	love.graphics.rectangle("fill",tx, ty, self.rect_w, self.rect_l)
	end	]]--
	self:visual_draw_test()
end


function Shots:remove()
	self:bump_remove()
end

function Shots:update(dt)
--	self:bump_get_collisions(nil, self.x, self.y)
	self:vis_update(dt)
	self.timer = self.timer - dt
	if self.timer < 0 then
		self:mark_for_death()
	end
	local future_x = self.x + self.velo.x * dt
	local future_y = self.y + self.velo.y * dt
	local cols, len = self:bump_move(Shots_filter, future_x, future_y)
	self:bump_collisions(cols, len, Shots_collisions)

end

function Shots:get_IMG_loc()
	self:visual_get_IMG_loc()
end