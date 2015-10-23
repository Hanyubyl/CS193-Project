Maptile = class('Maptile', Entity)
Maptile:include(Bump)

local function maptile_properties_init(properties, self)
	for k,v in pairs(properties) do
		if k == "damage" then
			self.hazard = v
		elseif k == "repel" then
			self.repel = v
		elseif k == "spikes" then
			self.spikes = true
		elseif k == "pushdir" then
			self.pushdir = properties[k]
		end
	end
end

local  Maptile_filter = function(item, other)
	if other.isPlayer then
		return "cross"
	end 
end

local Maptile_collisions = function(cols)
	if cols.other.isPlayer then
		if cols.item.spikes then
		
			--damage portion
			cols.other:sub_hp(50)

			if cols.other.knockback then
					return
			end
			function es1()
				
				cols.other.knockback = true
				cols.other.envx = 0
				cols.other.envy = 0
				
				cols.other:kb_velodir(100, cols.normal)

			end
			
			function ee1()
				cols.other:kill_kb_velo()
				cols.other.envx = 1
				cols.other.envy = 1
			end
			function ee2()
				cols.other.knockback = false
			end
			cols.other:dttimer_add(dttimer:new(es1, ee1, .1))
			cols.other:dttimer_add(dttimer:new(nil, ee2, .5))
		end
		if cols.item.pushdir then
			function es1()
				
				cols.other.knockback = true
				cols.other.envx = 0
				cols.other.envy = 0
				if cols.item.pushdir == "left" then
					cols.other.kb_velo.x = -300
				end
				if cols.item.pushdir == "down" then
					cols.other.kb_velo.y = 300
				end
			end
			
			function ee1()
				cols.other.knockback = false
				cols.other:kill_kb_velo()
				cols.other.envx = 1
				cols.other.envy = 1
			end
			cols.other:dttimer_add(dttimer:new(es1, ee1, .1))
		end
	end
end


function Maptile:initialize(world, object, settings)
	--local tile_offset = 8
	Entity.initialize(self,world, object.x, object.y, settings)
	print("Maptile created")
	self:bump_init(self.world, 'Maptile', object.x, object.y, object.width, object.height)
	
	self.isMaptile = true
	maptile_properties_init(object.properties, self)
end

function Maptile:remove()
	self:bump_remove()
end

function Maptile:update(dt)
	
	local cols, len = self:bump_move(Maptile_filter, self.x, self.y)
	self:bump_collisions(cols, len, Maptile_collisions)
end

function Maptile:draw()
		if v_dbg then self:bump_dbg_draw() end	
end