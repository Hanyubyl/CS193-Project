-- Player_Controller.lua

Player_Controller = class('Player_Controller')

------------------------------------------------------------------
function Player_Controller:initialize(world, settings)
	
	self.player_table = {}
	self.player_count = 0
	print("Player_Controller created")
	self.isPlayer_Controller = true
	self.state = "default"
	self.active_player = 1
	self.cam_coord_x = 0
	self.cam_coord_y = 0
	self.formation = {}
	self.formation_active = false
	
	self.dpup = false
	self.dpdown = false
	self.dpleft = false
	self.dpright = false 
	self.dpverti = false
end

function Player_Controller:add_player(pl)
	table.insert(self.player_table, pl)
	self.player_count = self.player_count+1
	print("added player")
end

function Player_Controller:active()
	print("TEST")
	return self.player_table[active_player]
end
function Player_Controller:inputdown(key)
	if self.state == "flat" then
		self.formation:inputdown(key)
		
		if key == "y" then 
			self.formation:remove()
			self.formation_active = toggle(self.formation_active)
			self.state = "follow"
		end
	elseif self.state == "tall" then

	elseif self.state == "box" then
	
	elseif self.state == "follow" or self.state == "default" then
		self:follow_leader_inputdown(self.player_table[self.active_player], key)
		
		
		
		--(self.player_table[self.active_player]):inputdown(key)
		if key == "rightshoulder" then
			self:switchup(self.active_player)
		elseif key == "leftshoulder" then
			self:switchdown(self.active_player)
		end
		
		if key == "v" then
			--SWITCH FORMATIONS
			if self.formation_active == false then
				print("FALSE")
				self.formation = Formation:new(world, self)
				self.formation_active = toggle(self.formation_active)
				self:zeroinputs(self.player_table[self.active_player])
				self.state = "flat"
			elseif self.formation_active == true then
				print("TRUE")
				self.formation:remove()
				self.formation_active = toggle(self.formation_active)
			end
		end
	elseif self.state == "break" then
	
	end
end

function Player_Controller:switchup(active)
			print(self.active_player)
			print(self.player_count)
			self:zeroinputs(self.player_table[active])
			self.active_player = (active)%self.player_count + 1
end
function Player_Controller:switchdown(active)
			print(self.active_player)
			
			self:zeroinputs(self.player_table[active])			
			self.active_player = self.active_player - 1
			if self.active_player == 0 then
				self.active_player = self.player_count
			end
end

function Player_Controller:inputup(key)
	if self.state == "flat" then
		self.formation:inputup(key)
	elseif self.state == "tall" then

	elseif self.state == "box" then
	
	elseif self.state == "follow" or self.state == "default" then
		--Behavior comment: Active player is controlled by dpad, everyone else is following in a group
		
		self:follow_leader_inputup(self.player_table[self.active_player], key)
		--(self.player_table[self.active_player]):inputup(key)
	elseif self.state == "break" then
	
	end
end

function Player_Controller:remove_player(player_num)
	
end

function Player_Controller:get_cam_coords()
	return self.cam_coord_x, self.cam_coord_y
end

function Player_Controller:cam_coord_set(obj)
	self.cam_coord_x = obj.x
	self.cam_coord_y = obj.y
end


function Player_Controller:update(dt)	
		self:cam_coord_set(self.player_table[self.active_player])
end
function Player_Controller:draw()
	for i, v in ipairs(self.player_table) do
		player_table[v]:draw()
	end
end

function self_freeze(var)
	local timer = var	
	print(timer)
end
function Player_Controller:follow_leader_inputdown(player, key, para)
	paraspeed = para or player.default_speed
--	if player.kb_time <= 0 then
		if key == "dpup" then
			player.vis_direction = 3
			player.vis_state = "move_up"
			self.dpup = true
			self.dpverti = true
			player:veloup(paraspeed)
		end
		if key == "dpdown" then
			player.vis_direction = 7
			player.vis_state = "move_down"
			self.dpdown = true
			self.dpverti = true
			player:velodown(paraspeed)
		end
		if key == "dpleft" then
			player.vis_direction = 5
			player.vis_state = "move_left"
			self.dpleft = true
			self.dphoriz = true
			player:veloleft(paraspeed)
		end
		if key == "dpright" then
			player.vis_direction = 1
			player.vis_state = "move_right"
			self.dpright = true
			self.dphoriz = true
			player:veloright(paraspeed)
		end
	
		if key == "a" then
			--player.vis_state = "attack_right"
			player:shoot()
			
			--self-freeze when attacking
		--	player:status_effect(self_freeze(5))
		end
	--end
		if key == "b" then
			player:set_hp_current(player.hp_current*.5)
		end
end	
function Player_Controller:follow_leader_inputup(player, key, para)

	paraspeed = para or player.default_speed
	if key == "dpup" and self.dpup then
		self.dpup = false
		self.dpverti = false
		player:veloup_up(paraspeed)
		player.vis_direction = self:other_horiz(player)
	end
	if key == "dpdown" and self.dpdown then
		self.dpdown = false
		self.dpverti = false
		player:velodown_up(player.default_speed)
		player.vis_direction = self:other_horiz(player)
	end
	if key == "dpleft" and self.dpleft then
		self.dpleft = false
		self.dphoriz = false
		player:veloleft_up(player.default_speed)
		player.vis_direction = self:other_verti(player)
	end
	if key == "dpright" and self.dpright then
		self.dpright = false
		self.dphoriz = false
		player:veloright_up(player.default_speed)
		player.vis_direction = self:other_verti(player)
	end
	if self.dphoriz  == false and self.dpverti == false then
		if player.vis_direction == 1 then
			player.vis_state = "idle_right"
		elseif player.vis_direction == 3 then
			player.vis_state = "idle_up"
		elseif player.vis_direction == 5 then
			player.vis_state = "idle_left"
		elseif player.vis_direction == 7 then
			player.vis_state = "idle_down"
		end
	end

	if key == "a" then
		
	end	
end
function Player_Controller:zeroinputs(player)
	if self.dpup then
		self.dpup = false
		player:veloup_up(player.default_speed)
		player.vis_direction = self:other_horiz(player)
		
	end
	if self.dpdown then
		self.dpdown = false
		player:velodown_up(player.default_speed)
		player.vis_direction = self:other_horiz(player)
	end
	if self.dpleft then
		self.dpleft = false
		player:veloleft_up(player.default_speed)
		player.vis_direction = self:other_verti(player)
	end
	if self.dpright then
		self.dpright = false
		player:veloright_up(player.default_speed)
		player.vis_direction = self:other_verti(player)
	end
end

function  Player_Controller:other_horiz(player)
	if (self.dpright) then 
		player.vis_state = "move_right"
		return 1
	elseif (self.dpleft) then
		player.vis_state = "move_left"
		return 5
	end
	self.dphoriz = false
	return player.vis_direction
end

function  Player_Controller:other_verti(player)
	if (self.dpup) then 
		player.vis_state = "move_up"
		return 3
	elseif (self.dpdown) then
		player.vis_state = "move_down"
		return 7
	end
	self.dpverti = false
	return player.vis_direction
end