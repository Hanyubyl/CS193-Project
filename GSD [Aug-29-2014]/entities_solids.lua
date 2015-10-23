require "entities"
Solids_hc = require 'hardoncollider'
Solid = Entity:extend()



function Solid:new(ex, ey, e_id)
	Solid.super.self(self)
	self.bounding_box = Solids_hc:addRectangle(self._e_x-10, self._e_y-10, 20,20)
end

