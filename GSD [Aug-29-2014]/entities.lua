Entity = Object:extend()
vector = require "hump.vector"

function Entity:new(ex, ey, e_id)
	self._e_type = e_type or "E_NIL"
	self._e_x = ex 
	self._e_y = ey 
	self._dead = false
	self._id = e_id
	self._e_xv = 0
	self._e_yv = 0
	self._velocity = 0
	self._angle = 0
	self._angularv = 0
	self.__PI = 3.1415926
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

function Entity:set_velocity(set_velo)
	self._velocity = set_velo
	self._e_xv = math.cos(self._angle/8 * self.__PI) * set_velo
	self._e_yv = math.sin(self._angle/8 * self.__PI) * set_velo
	print(self._e_xv, self._e_yv, self._angle)
end

function Entity:set_velocity(set_velo, set_angle)
	self._angle = set_angle
	self._velocity = set_velo
	self._e_xv = math.cos(self._angle/8 * self.__PI) * self._velocity
	self._e_yv = math.sin(self._angle/8 * self.__PI) * self._velocity
	print(self._e_xv, self._e_yv, self._angle)
end

function Entity:set_pos(set_x, set_y)
	self._e_x = set_x
	self._e_y = set_y
end

function Entity:set_angularv(set_a)
	self._angularv = set_a
end

function Entity:get_angularv()
	return self._angularv
end

function Entity:set_angle(set_a)
	self._angle = set_a % 16
end

function Entity:get_angle()
	return self._angle 
end
