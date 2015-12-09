-- 6 - Interacting Images
-- Created by Laura Aubin
-- Created on December 4, 2015

---------------------------------------------------------------------------------------
   
-- Use the physics library
local physics = require("physics")

-- Start the physics engine
physics.start()

-- Create the background image
local background = display.newImageRect("./Images/background.jpg", 320, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

---------------------------------------------------------------------------------------
-- Create objects
---------------------------------------------------------------------------------------

-- Create the floor and set it's position
local floor = display.newImageRect("./Images/ground.png", 330, 100)
floor.x = display.contentCenterX
floor.y = 540

-- Make the floor transparent
floor.alpha = floor.alpha - 10

-- Make the floor static
physics.addBody(floor, "static", {friction=0.1})

-- Create a box object and set it's initial position
local box = display.newImageRect("./Images/box.png", 60, 60)
box.x = display.contentCenterX
box.y = 500

-- Make the box dynamic so that it will move
physics.addBody(box, "dynamic", {density=0.2, friction=0.1, bounce=0.5})

---------------------------------------------------------------------------------------
-- Create more boxes
---------------------------------------------------------------------------------------

-- Create an array of box objects so that it will move
local boxes = {}

-- Do the following 5 times
for loopCounter = 1,5 do
		-- Add a new box object to the list at the given position
		boxes[loopCounter] = display.newImageRect("./Images/box.png", 90, 90)
		-- Set x and y position of each box
		boxes[loopCounter].x = 70 + (loopCounter + 150)
		boxes[loopCounter].y = 306
		-- Make each box dynamic so that it will bounce
		physics.addBody(boxes[loopCounter], "dynamic", {density=0.2, friction=0.1, bounce=0.5})
end