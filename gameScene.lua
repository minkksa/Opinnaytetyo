-- create a scene object
local scene = storyboard.newScene()

local json = require("json")
--local products = require("products")

local group = 1

-- funtion called when the scene's view does not exist

function scene:createScene(inEvent)

	print("gameScene", "createScene()")

	-- adding background
	local bgstore = display.newImage("bgstore.png")
	bgstore.x = display.contentWidth / 2
	bgstore.y = display.contentHeight / 2
	bgstore.xScale = 2
	bgstore.yScale = 2
	self.view:insert(bgstore) --self.view is the DisplayGroup created by storyboard

	-- adding categories
	local group1 = display.newImage("group1.png")
	group1.x = display.contentCenterX - 350
	group1.y = display.contentCenterY - 180
	self.view:insert(group1) 
	
	local group2 = display.newImage("group2.png")
	group2.x = display.contentCenterX - 250
	group2.y = display.contentCenterY - 180
	self.view:insert(group2) 
	
	local group3 = display.newImage("group3.png")
	group3.x = display.contentCenterX - 150
	group3.y = display.contentCenterY - 180
	self.view:insert(group3) 
	
	-- adding purchasable objects and event handlers
	
	

	
	
	-- adding amount of money and target
	
	local floor = display.newImage("floor.png")
	floor.x = display.contentCenterX + 200
	floor.y = display.contentCenterY + 200
	self.view:insert(floor) 
	
	local target = display.newImage("target.png")
	target.x = display.contentCenterX + 200
	target.y = display.contentCenterY + 100
	self.view:insert(floor) 
		
end -- end create scene

-- function called before scene has moved on screen

function scene:willEnterScene(inEvent)
	
	print("gameScene", "WillEnterScene()")
	
end -- ending WillEnterScene

-- function called after scene has moved on screen

function scene:enterScene(inEvent)
	
	print("gameScene", "enterScene()")
	
end -- ending enterScene

-- function called before scene moves off the screen

function scene:exitScene(inEvent)

	print("gameScene", "exitScene()")
	
end --ending exitScene

-- function called after scene has moved off screen

function scene:didExitScene(inEvent)

	print("gameScene", "didExitScene()")
	
end -- endin didExitScene

-- function called removing scene

function scene:destroyScene(inEvent)

	print("gameScene", "destroyScene()")
	
	-- clear up
	bgstore:removeSelf()
	bgstore = nil
	header:removeSelf()
	header = nil
	
end -- ending destroyScene

-- execution

print("menuScene", "Beginning execution");

-- Add scene lifecycle event handlers.
scene:addEventListener("createScene", scene);
scene:addEventListener("willEnterScene", scene);
scene:addEventListener("enterScene", scene);
scene:addEventListener("exitScene", scene);
scene:addEventListener("didExitScene", scene);
scene:addEventListener("destroyScene", scene);

return scene;