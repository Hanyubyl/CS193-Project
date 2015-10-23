dttimer = class('dttimer')

function dttimer:initialize(effect, timer)
	self.timer = timer
end

function dttimer:begin(obj)
	print("begin")
	obj.envx = 0
	obj.envy = 0
end
	
function dttimer:expire(obj)
	print("expire")
	obj.envx = 1
	obj.envy = 1
end

