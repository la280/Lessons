
-- 7 - Math and Timers
-- Created by Laura Aubin
-- Created on December 14, 2015
-- Use timers to make objects appear & disappear at random intervals

-----------------------------------------------------------------------------------------
-- Local variables
-----------------------------------------------------------------------------------------

local background = display.newImageRect("./Images/background.png", 400, 600)

local mole = display.newImage("Images/mole.png", 180, 370)

local moleWhacked = 0

local scoreCover = display.newRect(200, 3, 200, 70) 

local score = display.newText("Score: "..moleWhacked, 200, 0, Arial, 50 )

-----------------------------------------------------------------------------------------
-- Initialize
-----------------------------------------------------------------------------------------

-- Background image location 
background.anchorX = 0
background.y = 250

scoreCover:setFillColor(2/255, 80/255, 100/255)

-- Mole size
mole:scale(0.2, 0.2)

mole.isVisible = false

