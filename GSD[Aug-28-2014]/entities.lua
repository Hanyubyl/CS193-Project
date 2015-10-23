Entity = Object:extend()

function Entity:new(ex, ey, e_id)
	self._e_type = e_type or "E_NIL"
	self._e_x = ex 
	self._e_y = ey 
	self._dead = false
	self._id = e_id
	self._e_xv = 0
	self._e_yv = 0
	if(e_dbg == 1) then
		print("entity " .. self._id .. " created at " .. self._e_x .. "_" .. self._e_y .. ".")
	end
end

function Entity:get_x()
	return self._e_x
end

function Entity:get_y()
	return self._e_y
end

function Entity:get_xv()
	return self._e_xv
end

function Entity:get_yv()
	return self._e_yv
end

function Entity:get_id()
	return self._id
end