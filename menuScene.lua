-- create a scene object
local scene = storyboard.newScene()

-- funtion called when the scene's view does not exist

function scene:createScene(inEvent)

	print("menuScene", "createScene()")

	-- adding objects
	local menubground = display.newImage("menubground.png")
	menubground.x = display.contentWidth / 2
	menubground.y = display.contentHeight / 2
	menubground.xScale = 2
	menubground.yScale = 2
	self.view:insert(menubground) --self.view is the DisplayGroup created by storyboard

	-- adding header centered on the screen
	local header = display.newImage("header.png")
	header.x = display.contentCenterX
	header.y = display.contentCenterY - 160
	self.view:insert(header) 
	
	-- adding texts and event handlers
	local txtNewGame = display.newText("Uusi peli", 0,0, Verdana, 50)
	txtNewGame:setTextColor(25,255,71)
	txtNewGame.x = display.contentCenterX
	txtNewGame.y = display.contentCenterY - 30
	txtNewGame:addEventListener("touch", 
		function(inEvent)
			if inEvent.phase == "ended" then
				clearGameData()
				print("menuScene", "Uusi peli tapped")
				storyboard.gotoScene("gameScene", "slideRight", 500)
			end
		end)
	self.view:insert(txtNewGame) 
	
	local txtContinue = display.newText("Jatka peliä", 0,0, Verdana, 50)
	txtContinue:setTextColor(25,255,71)
	txtContinue.x = display.contentCenterX
	txtContinue.y = display.contentCenterY + 40
	txtContinue:addEventListener("touch", 
		function(inEvent)
			if inEvent.phase == "ended" then
				loadGameData()
				print("menuScene", "Jatka peliä tapped")
				storyboard.gotoScene("gameScene", "slideRight", 500)
			end
		end)
	self.view:insert(txtContinue) 
	
	local txtQuit = display.newText("Poistu", 0,0, Verdana, 50)
	txtQuit:setTextColor(25,255,71)
	txtQuit.x = display.contentCenterX
	txtQuit.y = display.contentCenterY + 110
	txtQuit:addEventListener("touch", 
		function(inEvent)
			if inEvent.phase == "ended" then
				print("menuScene", "Poistu tapped")
				-- transition.to method allows to change (animate) attributes of an object over time
				-- object to be animated (scene.view) and two attributes alpha and time, alpha meaning 
				-- the target value and time in milliseconds of animation to take complete
				transition.to(scene.view, {alpha = 0, time = 500, 
				onComplete = function()
					os.exit()
				end})
			end
		end)
	self.view:insert(txtQuit) 
	
end -- end create scene

-- function called before scene has moved on screen

function scene:willEnterScene(inEvent)
	
	print("menuScene", "WillEnterScene()")
	
end -- ending WillEnterScene

-- function called after scene has moved on screen

function scene:enterScene(inEvent)
	
	print("menuScene", "enterScene()")
	
end -- ending enterScene

-- function called before scene moves off the screen

function scene:exitScene(inEvent)

	print("menuScene", "exitScene()")
	
end --ending exitScene

-- function called after scene has moved off screen

function scene:didExitScene(inEvent)

	print("menuScene", "didExitScene()")
	
end -- endin didExitScene

-- function called removing scene

function scene:destroyScene(inEvent)

	print("menuScene", "destroyScene()")
	
	-- clear up
	menubground:removeSelf()
	menubground = nil
	header:removeSelf()
	header = nil
	txtNewGame:removeSelf()
	txtNewGame = nil
	txtContinue:removeSelf()
	txtContinue = nil
	txtQuit:removeSelf()
	txtQuit = nil
	
	
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