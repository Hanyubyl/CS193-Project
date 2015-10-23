Minion_Lance = class('Minion_Lance', Entity)
Minion_Lance:include(Visual)
Minion_Lance:include(Bump)
Minion_Lance:include(Movement)
Minion_Lance:include(Minion)

local IMG = load_transparent("Shanghaisprite.png", 255,0,255)
------------------------------------------------------------------
function Minion_Lance:initialize(world, x, y, direction, scale, settings)
	Entity.initialize(self,world, x, y, settings)
	print("Minion" .. self.id .. " created")
	self:visual_init(IMG, 0, 0, 32, 32,8)
	self:bump_init(self.world, 'Minion_Lance', x, y, 20,20)
	self:movement_init()
	self.isMinion = true
	self.timer = 0
	self.direction = direction
	self.scale = scale
end

function Minion_Lance:draw()
	self:visual_draw()
	if v_dbg then self:bump_dbg_draw() end	
end

function Minion_Lance:attack()
	-- spawn attack
	local attack = Attack:new(self.world, self.x, self.y, 100, 5)
	table.insert(attacks, attack)
end

function Minion_Lance:update(dt)
	
	if self.timer < .99 then
		self.timer = self.timer + dt
		local frame = math.floor(self.timer * 8)+1
		if frame > 8 then
			frame = 8
		end
		self.current_frame =  frame
		print(self.current_frame)
	else
		self.timer = 0
	end
end
