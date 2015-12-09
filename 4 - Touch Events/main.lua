-- 4 - Touch Events
-- Created on November 17, 2015 
-- This program places an image on the screen that can be moved with your finger.

-- Local variables (file location, width, height)
local backgroundImage = display.newImageRect("./Images/background.png", 650, 1060)
local ship = display.newImageRect("./Images/beetleship.png", 220, 220)

local girl = display.newImageRect("./Images/girl.png", 250, 250)

-- Get image properties and assign to local variables
local shipWidth = ship.width
local shipHeight = ship.height

local girlWidth = girl.width
local girlHeight = girl.height


-- Set initial x and y position
girl.x = 160
girl.y = 200

-- Function to move the image
local function TouchListener(touch) 

	-- Condition for beginning touch
	if (touch.phase == "begin") then

	end

	-- Condition for held or moving images
	if (touch.phase == "moved") then

		-- Checks if you are inside the rectangle of the ship, it's boundaries 
		if ( ((ship.x - shipWidth/2) < touch.x) and 
			 ((ship.x + shipWidth/2) > touch.x) and 
		     ((ship.y - shipHeight/2) < touch.y) and 
		     ((ship.y + shipHeight/2) > touch.y) ) then
		
			-- Dynamic parameters
			ship.x = touch.x
			ship.y = touch.y
		end

	-- If not inside the ship rectangle, then don't do anything.
	end

	-- Condition for touch release
	if (touch.phase == "ended") then

	end
end

local function TouchListenerGirl(touch)

	-- Condition for beginning touch
	if (touch.phase == "begin") then

	end

	-- Condition for held or moving images
	if (touch.phase == "moved") then

		-- Checks if you are inside the rectangle of the girl, it's boundaries 
		if ( ((girl.x - girlWidth/2) < touch.x) and 
			 ((girl.x + girlWidth/2) > touch.x) and 
		     ((girl.y - girlHeight/2) < touch.y) and 
		     ((girl.y + girlHeight/2) > touch.y) ) then
		
			-- Dynamic parameters
			girl.x = touch.x
			girl.y = touch.y
		end

	-- If not inside the girl's rectangle, then don't do anything.
	end

	-- Condition for touch release
	if (touch.phase == "ended") then

	end
end


--Create a runtime at a touch event : TouchListener is the function name
Runtime:addEventListener("touch", TouchListener)
Runtime:addEventListener("touch", TouchListenerGirl)