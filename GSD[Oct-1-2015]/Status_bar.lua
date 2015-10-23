Status_bar = class('Status_bar', Entity)

Status_bar:include(Visual)

local IMG = load_transparent("hpmana.png", 255,0,255)

local ani_list = {1,
					-- state name, frames, length of each frame 
					{"idle_down", 1, 100}
}

function Status_bar:initialize(obj, bar_l,bar_w)
	self.obj = player
	self.x = 10
	self.y = 10
	
	self.bar_l = bar_l or 200
	self.bar_w = bar_w or 10
	
	--self:visual_init_testt(IMG, 200, 40, ani_list)
	
	--setup bars

end

function Status_bar:draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", 10,10,(self.obj.hp_current/self.obj.hp_max)*200,20)
	love.graphics.setColor(0, 100, 255)
	love.graphics.rectangle("fill", 10,30,(self.obj.mp_current/self.obj.mp_max)*200,20)

end

function Status_bar:update(dt)
	

end

