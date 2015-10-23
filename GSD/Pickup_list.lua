function Key_init(pickup, object)
	print("Key created at " .. "(" .. object.x .. ", " .. object.y .. ")")
	pickup.isKey = true
	
	-- draw init
	pickup.ani_list = {  2, 
					-- state name, frames, length of each frame 
					{"idle_down", 1, 0.5},
					{"flicker", 4, 0.05},
				}
	pickup.IMG = load_transparent("keysprite.png", 255,0,255)
	pickup:visual_init_testt(pickup.IMG,16, 32, pickup.ani_list)	
	pickup.timer = 1

	-- Bump init
	pickup:bump_init(pickup.world, "Key", object.x, object.y, 16,32)
	
	--draw function
	function pickup:draw()
		if v_dbg then self:bump_dbg_draw() end	
		pickup:visual_draw_test()
	end
	--update function
	function pickup:update(dt)
		pickup:vis_update(dt)
		pickup.timer = pickup.timer - dt
		if pickup.timer < 0 then
			if pickup.vis_state == "idle_down" then
				pickup.vis_state = "flicker"
				pickup.vis_frame = 1
				pickup.timer = .15
			elseif pickup.vis_state == "flicker" then
				pickup.vis_state = "idle_down"
				pickup.vis_frame = 1
				pickup.timer = 1
			end
		end		
		
		local Key_collisions = function(cols)
			if cols.other.isPlayer then
				cols.item:mark_for_death()
				cols.other:keys_add()
			end
		end		
		
		
		local actualX, actualY, cols, len = world:check(pickup, pickup.x, pickup.y, Pickup_filter)
		pickup:bump_collisions(cols, len, Key_collisions)
	--	if cols.other.isPlayer 
		
	end
end