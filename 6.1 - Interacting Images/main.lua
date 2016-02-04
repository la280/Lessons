-- 6.1 - Interacting Images
-- Created by Laura Aubin
-- Created on December 10, 2015

-------------------------------------------------------------------------------
-- Initial settings
-------------------------------------------------------------------------------

-- Starting Engines
local physics = require ("physics")

-- Starting Engine
physics.start( )

-------------------------------------------------------------------------------
-- Create objects
-------------------------------------------------------------------------------

-- Create ground
local group = display.newImage("./Images/ground.png", 0, 0)

--Setting it's position

ground.x = display.contentCenterX
ground.y = display.contentHeight

-- Changing width and height
ground.width = 