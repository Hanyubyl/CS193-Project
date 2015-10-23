dttimer = class('dttimer')

function dttimer:initialize(begin_effect, end_effect, timer)
     self.begin_list = {}
	 self.end_list = {}
	table.insert(self.begin_list, begin_effect)
	table.insert(self.end_list, end_effect)
	
	self.timer = timer
end

function dttimer:begin(obj)
	for k, v in ipairs(self.begin_list) do
		self.begin_list[k]()
	end
	print("begin")
	
end
	
function dttimer:expire(obj)
	print("expire")
	for k, v in ipairs(self.end_list) do
		self.end_list[k]()
	end
end

