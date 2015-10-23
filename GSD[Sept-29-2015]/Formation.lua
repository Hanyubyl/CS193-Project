	--Box that defines boundaries of formations.


Formation = class('Formation', Entity)


Formation:include(Visual)
Formation:include(Bump)
Formation:include(Movement)

local Formation_filter = function(item, other)
	if other.isWall then return 'slide' end
end
local nil_filter = function(item, other)
	
end
-----------------------------------------
function Formation:initialize(world, pc, settings)
	
	self.player_list = pc.player_table
	Entity.initialize(self,world, pc.player_table[pc.active_player].x, pc.player_table[pc.active_player].y, settings)
	
	
	self.Formation_table = {}
	
	self:bump_init(self.world, 'Formation', pc.player_table[pc.active_player].x, pc.player_table[pc.active_player].y, pc.player_count*32,32)
	print("Formation created")
	
	self:movement_init(0,0)
	
	self.isFormation = true
	self.state = "default"
	self.active_formation = 0
	
	for i,v in ipairs(self.player_list) do
		self.player_list[i]:bump_move(nil_filter, self.x + 32*i -32, self.y)
	end
	
end

function Formation:update(dt)
	self.dt = dt
--	self.x = self.player_list[1].x
--	self.y = self.player_list[1].y
	if self.velo.x ~= 0 or self.velo.y ~= 0 then
	
		-- for diagonal speed consistency
		local diag_cnst = 0.707
		local isDiag = 0
		if self.dpverti and self.dphoriz then
			isDiag = 1
		end
		
		
		
		local future_x = self.x + self.velo.x * dt * (diag_cnst ^ isDiag)
		local future_y = self.y + self.velo.y * dt * (diag_cnst ^ isDiag)
		self:bump_move(Formation_filter, future_x, future_y)
	end	
end

function Formation:draw()
	if v_dbg then self:bump_dbg_draw()
		love.graphics.rectangle("fill",tx, ty, self.rect_w, self.rect_l)
	end	
end

function Formation:inputdown(key)
	--if self.kb_time <= 0 then
		if key == "dpup" then
			self.direction = 3
			self.vis_state = "move_up"
			self.dpup = true
			self:veloup(self.default_speed)
		end
		if key == "dpdown" then
			self.direction = 7
			self.vis_state = "move_down"
			self.dpdown = true
			self:velodown(self.default_speed)
		end
		if key == "dpleft" then
			self.direction = 5
			self.vis_state = "move_left"
			self.dpleft = true
			self:veloleft(self.default_speed)
		end
		if key == "dpright" then
			self.direction = 1
			self.vis_state = "move_right"
			self.dpright = true
			self:veloright(self.default_speed)
		end
	
		if key == "a" then
	--	Shanghai:new(self.world, dir_spawn_calc(self.x, self.y, self.direction, 20, 0))
	--		self:grab_start()
		end
	--end
		if key == "b" then
		--	self:attack_spawn()
		end
end

function Formation:inputup(key)
	
	if key == "dpup" and self.dpup then
		self.dpup = false
		self:veloup_up(self.default_speed)
	end
	if key == "dpdown" and self.dpdown then
		self.dpdown = false
		self:velodown_up(self.default_speed)
	end
	if key == "dpleft" and self.dpleft then
		self.dpleft = false
		self:veloleft_up(self.default_speed)
	end
	if key == "dpright" and self.dpright then
		self.dpright = false
		self:veloright_up(self.default_speed)
	end
	if key == "a" then
		
	end	
end

function Formation:zeroinputs()
	if self.dpup then
		self.dpup = false
		self:moveup_up(self.default_speed)
		self.direction = self:other_horiz()
		
	end
	if self.dpdown then
		self.dpdown = false
		self:movedown_up(self.default_speed)
		self.direction = self:other_horiz()
	end
	if self.dpleft then
		self.dpleft = false
		self:moveleft_up(self.default_speed)
		self.direction = self:other_verti()
	end
	if self.dpright then
		self.dpright = false
		self:moveright_up(self.default_speed)
		self.direction = self:other_verti()
	end
end

function Formation:remove()
	self:bump_remove()
end