
function load_transparent(base_image, trans_r, trans_g, trans_b)
	base_image_ = love.graphics.newImage(base_image)
	local base_image_data = base_image_:getData()
	function trans_function(x,y,r,g,b,a)
		if r == trans_r and g == trans_g and b == trans_b
		then a = 0 end
		return r,g,b,a
	end
	base_image_data:mapPixel(trans_function)
	return love.graphics.newImage(base_image_data)
end

function cut_sheet(base_image, x, y, w, h)
	local cut_sprite = love.image.newImageData(w,h)
	for i = 0, w-1 do
		for j = 0, h-1 do
			cut_sprite:setPixel(i, j,
				base_image:getData():getPixel(x+i, y+j))
		end
	end
	return love.graphics.newImage(cut_sprite)
end

function spritearr8(sprite_sheet)
	local w = sprite_sheet:getWidth()
	local sprites = {}
	for i = 1, 8 do
		sprites[i] = love.graphics.newImage("magenta36.png")
	end
	for i = 1, 8 do
		sprites[i] = cut_sheet(sprite_sheet, 0, w*(i-1), w, w)
	end
	return sprites
end