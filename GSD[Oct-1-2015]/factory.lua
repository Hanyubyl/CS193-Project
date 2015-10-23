Factory = class('Factory')

function Factory:init()
	self.to_be_created = {}
end

create = function(self, type, x, y, settings)
    table.insert(self.to_be_created, {type = type, x = x, y = y, settings = settings})
end

createPostWorldStep = function(self)
    for _, o in ipairs(self.to_be_created) do
        local entity = nil
        if o.type then entity = _G[o.type](self, o.x, o.y, o.settings) end
        self:add(entity)
    end
    self.to_be_created = {}
end

