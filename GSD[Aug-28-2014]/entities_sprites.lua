require "entities"

Sprite = Entity:extend()
--	e_x:
--	e_y:
--	e_id:
--	s_image:
--	sx:
--	sy:
--	sw:
--	sh:

function Sprite:new(ex, ey, e_id, s_image, sx, sy, sw, sh)
	Sprite.super.new(self, ex, ey, e_id)
	self._image = s_image
	self._image_w = sw
	self._image_h = sh
	self._quad = love.graphics.newQuad(sx, sy, sw, sh,s_image:getDimensions())
end

function Sprite:getImage()
	return self._image
end

function Sprite:draw_x()
	return self._e_x - self._image_w/2
end

function Sprite:draw_y()
	return self._e_y + self._image_h/2
end

function Sprite:get_quad()
	return self._quad
end