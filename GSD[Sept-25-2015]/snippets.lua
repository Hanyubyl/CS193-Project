function dir_spawn_calc(zx,zy,zdirection,zw,zh,zoffsetx,zoffsety)
	-- calculation based pointing right -->
	
	if zdirection == 1 then
		local x = zx + zoffsetx
		local y = zy - zoffsety
		local w = zw
		local h = zh
	elseif zdirection == 3 then
		local x = zx + zoffsety
		local y = zy - zoffsetx
		local w = zh
		local h = zw
	elseif zdirection == 5 then
		local x = zx - zoffsetx
		local y = zy + zoffsety
		local w = zw
		local h = zh		
	elseif zdirection == 7 then
		local x = zx - zoffsety
		local y = zy + zoffsetx
		local w = zh
		local h = zw	
	end
	
	return x,y
end

function dir_move_calc(dx, dy)


end
