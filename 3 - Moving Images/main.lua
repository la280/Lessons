-- 3- Moving Images

-- Created by Laura Aubin 

-- Created on November 11, 2015

-- This program moves an image around the screen, controlling speed and

-- Set game settings - hide status bar
display.setStatusBar(display.HiddenStatusBar)


-- Global variables
scrollSpeed1 = 1.6
scrollSpeed2 = -0.7
scrollSpeed3 = -0.3

-- Local variables (file location, width, height)
local backgroundImage = display.newImageRect("./Images/background.png", 650, 1060)
local ship = display.newImageRect("./Images/beetleship.png", 200, 200)
local planet = display.newImageRect("./Images/planet.png", 300, 300)
local star = display.newImageRect("./Images/star.png", 100, 100)
local star2 = display.newImageRect("./Images/star.png", 60, 60)
local star3 = display.newImageRect("./Images/star.png", 30, 30)
local star4 = display.newImageRect("./Images/star.png", 40, 40)

-- Set the initial x and y position
ship.x = 10
ship.y = 185
planet.x = 270
planet.y = 400
star.x = 300
star.y = 30
star2.x = 140
star2.y = 50
star3.x = 70
star3.y = 10
star4.x = 210
star4.y = 100

-- Set transparency 
ship.alpha = 1
planet.alpha = 0


local function MoveShip(event)
	-- Add scroll speed to x-value of the ship
	ship.x = ship.x + scrollSpeed1
	-- Speed of planet
	planet.x = planet.x + scrollSpeed2
	-- Speed of stars
	star.x = star.x + scrollSpeed3
	star2.x = star2.x + scrollSpeed3
	star3.x = star3.x + scrollSpeed3
	star4.x = star4.x + scrollSpeed3


	-- Change transparency of the ship every time it moves
	ship.alpha = ship.alpha - 0.002
	-- Planet transparency
	planet.alpha = planet.alpha + 0.006
end 

-- Create event listener ("name", function name)
Runtime:addEventListener("enterFrame", MoveShip)