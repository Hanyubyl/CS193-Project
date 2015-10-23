Lockblock = class('Lockblock', Entity)
Lockblock:include(Visual)
Lockblock:include(Bump)

local Lockblock_collisions = function(cols)
	if cols.other.isPlayer and cols.item.iskeylocked and cols.other.keys > 0 then
		cols.item.iskeylocked = false
		cols.item.isWall = true
		cols.other:keys_sub()
		cols.item.vis_state = "unlock"
	--	cols.item:mark_for_death()
	end
end	
	ani_list = {  2, 
					-- state name, frames, length of each frame 
					{"idle_down", 1, 5},
					{"unlock", 4, 0.15},
				}
IMG = load_transparent("lockblock.png", 255,0,255)
	
local Lockblock_filter = function(item, other)
	if other.isPlayer then return 'slide'
	end
end

function Lockblock:initialize(world, object, settings)
	Entity.initialize(self,world, object.x, object.y, settings)
	self:bump_init(world, "Lockblock", object.x, object.y, 32,32)
	self.isLockblock = true
	self.timer = .45
	self.iskeylocked = true
	self:visual_init_testt(IMG,32, 32, ani_list)
	
end

function Lockblock:draw()
	if v_dbg then self:bump_dbg_draw() end	
	self:visual_draw_test()
end


function Lockblock:update(dt)
	self:vis_update(dt)
	local actualX, actualY, cols, len = world:check(self, self.x, self.y, Lockblock_filter)
	self:bump_collisions(cols, len, Lockblock_collisions)
	if self.iskeylocked == false then
		self.timer = self.timer - dt
	end
	
	if self.timer < 0 then
		self:mark_for_death()
	end
	
end


function Lockblock:remove()
	self:bump_remove()
end