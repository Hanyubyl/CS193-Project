Inventory = class('Inventory')
Inventory:include(Visual)

------------------------------------------------------------------
function Inventory:initialize(obj)
	self.obj = obj
	print("Inventory created")
	self.isInventory = true
	
end


function Inventory:draw()
	love.graphics.print("Keys: " .. self.obj.keys, 0, 70)
end


function Inventory:update()

end