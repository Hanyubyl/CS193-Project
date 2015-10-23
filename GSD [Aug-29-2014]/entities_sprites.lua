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
function Sprite:new(ex, ey, e_id, s_image, sw, sh)
	Sprite.super.new(self, ex, ey, e_id)
	self._image = load_transparent(s_image,255,0,255)

	self._image_w = sw or self._image:getWidth()
	self._image_h = sh or self._image:getHeight()
	
	if(e_dbg == 1) then
		print("image is " .. self._image_w .. "_" .. self._image_h)
	end
end

function Sprite:draw_x()
	return self._e_x - self._image_w/2
end

function Sprite:draw_y()
	return self._e_y - self._image_h/2
end

function Sprite:get_quad()
	return self._quad
end

function Sprite:get_image()
	return self._image
end

Sprite8 = Sprite:extend()

function Sprite8:new(ex, ey, e_id, s_image, sw, sh)
	Sprite8.super.new(self, ex, ey, e_id, s_image, sw, sh)
	
	self._Sprite8_8 = spritearr8(self._image)
	if(e_dbg == 1) then
		print("image is " .. self._image_w .. "_" .. self._image_h)
	end
end

function Sprite8:get_image()
 
	if(self._angle <= 5 and self._angle > 3) then
		rSprite8 = self._Sprite8_8[1] 
	elseif(self._angle <= 7 and self._angle > 5) then
		rSprite8 = self._Sprite8_8[2] 
	elseif(self._angle <= 9 and self._angle > 7) then
		rSprite8 = self._Sprite8_8[3] 
	elseif(self._angle <= 11 and self._angle > 9) then
		rSprite8 = self._Sprite8_8[4] 
	elseif(self._angle <= 13 and self._angle > 11) then
		rSprite8 = self._Sprite8_8[5] 
	elseif(self._angle <= 15 and self._angle > 13) then
		rSprite8 = self._Sprite8_8[6] 
	elseif(self._angle <= 1 or self._angle > 15) then
		rSprite8 = self._Sprite8_8[7] 
	elseif(self._angle <= 3 and self._angle > 1) then
		rSprite8 = self._Sprite8_8[8] 
	else
		rSprite8 = _Sprite8_8[1]
	end
	return	rSprite8
end
