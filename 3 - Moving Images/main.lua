-- 3- Moving Images

-- Created by Laura Aubin 

-- Created on November 11, 2015

-- This program moves an image around the screen, controlling speed and

-- Set game settings - hide status bar
display.setStatusBar(display.HiddenStatusBar)


-- Global variables
scrollSpeed = 1.6

-- Local variables (file location, width, height)
local backgroundImage = display.newImageRect("./Images/background.png", 650, 1060)
local ship = display.newImageRect("./Images/beetleship.png", 200, 200)

-- Set the initial x and y position
ship.x = 10
ship.y = 240

-- Set transparency 
ship.alpha = 1



local function MoveShip(event)
	-- Add scroll speed to x-value of the ship
	ship.x = ship.x + scrollSpeed
	-- Change transparency of the ship every time it moves
	ship.alpha = ship.alpha - 0.003
end 

-- Create event listener ("name", function name)
Runtime:addEventListener("enterFrame", MoveShip)