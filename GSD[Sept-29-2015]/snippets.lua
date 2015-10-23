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

function dir_to_velo(self, dir, velo)

	if dir == 1 then
		self:veloright(velo)
	elseif dir == 3 then
		self:veloup(velo)
	elseif dir == 5 then
		self:veloleft(velo)
	elseif dir == 7 then
		self:velodown(velo)
	end
end