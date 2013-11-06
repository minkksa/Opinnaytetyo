-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- GLOBAL IMPORTS

json = require("json") -- allows quick way to save objects in universal format
storyboard = require("storyboard")
storyboard.purgeOnSceneChange = true -- purge the scenes whenever the game transitions away from them

-- GLOBAL VARIABLES

-- store all game data that needs to be saved
gameData = {
	
	-- saving current level
	level = 1,
	
	-- saving current score
	score = 0

}

-- saving game data
function saveGameData()

	local path = system.pathForFile("gameData.json", system.DocumentsDirectory) -- give full path to the file we are working with
	if path ~= nil then
		local filehandle = io.open(path, "w+") -- io.open accepts the path and mode "w+" which erases all previous data and overwrites it
		filehandle:write(json.encode(gameData)) -- method write() accepts list of arguments that can be strings or numbers.
												-- json.encode() method converts the gamData object to a string of JSON
		io.close(filehandle)
	end
	
end -- end saving game data

-- Loading game data
function loadGameData()

	local path = system.pathForFile("gameData.json", system.DocumentsDirectory)
	if path ~= nil then
		local filehandle = io.open(path, "r") -- io.open accepts the path and mode "r" which is for reading
		if filehandle == nil then
			clearGameData()
		else
			gameData = json.decode(filehandle:read("*a")) -- if the file is open, method read() with value "a"
														-- which reads the whole file. On the end of file, returns empty string
		end
	end
	
end -- end loading game data

-- reseting game state to defaults and deleting persistent files from storage
function clearGameData()

	gameData.level = 1
	gameData.score = 0
	saveGameData()
	
end -- end clearGameData

-- hiding status bar
display.setStatusBar(display.HiddenStatusBar)

math.randomseed(os.time())

-- starting menuScene
print("Going to menuScene") -- log message printed to console window
storyboard.gotoScene("menuScene", "slideRight", 500)

