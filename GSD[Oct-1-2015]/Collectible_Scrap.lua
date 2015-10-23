Collectible_Scrap = class('Collectible_Scrap', Entity)
Collectible_Scrap:include(Visual)
Collectible_Scrap:include(Bump)

local Collectible_Scrap_filter = function(item, other)
	if other.isPlayer then return 'cross'
	end
end

local IMG = load_transparent("scrap.png", 255,0,255)

function Collectible_Scrap:initialize(world, x, y, settings)
	Entity.initialize(self,world, x, y, settings)
	--print("Collectible_Scrap " .. self.id .. " created")
	self:visual_init(IMG, 0, 0, 32, 32,2)
	self:bump_init(self.world, "Collectible_Scrap", x, y, 20,20)
end

function Collectible_Scrap:draw()
	self:visual_draw()
	if v_dbg then self:bump_dbg_draw()
	love.graphics.rectangle("fill",tx, ty, self.rect_w, self.rect_l)
	end	
end



function Collectible_Scrap:update(dt)

	local actualX, actualY, cols, len = world:check(self, self.x, self.y, Collectible_Scrap_filter)
	if len ~= 0 then
		self:mark_for_death()
	end
end
 
function Collectible_Scrap:get_IMG_loc()
	self:visual_get_IMG_loc()
end

function Collectible_Scrap:remove()
	self:bump_remove()
end