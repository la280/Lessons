-- 5 - Buttons
-- Created on November 27, 2015 
-- This program does something from clicking a button.

---------------------------------------------------------------------------------------------------------
-- Local Variables
---------------------------------------------------------------------------------------------------------

-- Local variables 
local backgroundImage = display.newImageRect("Images/background.png", 1000, 2000)
local ButtonUnpressed = display.newImageRect("Images/BlueButton.png", 300, 110)
local ButtonPressed = display.newImageRect("Images/OrangeButton.png", 300, 110)

local ButtonPressedWidth = ButtonPressed.width
local ButtonPressedHeight = ButtonPressed.height 

-- Boolean variable to know if we clicked the button
local clickedOnButton = false

-- Create two variables for x and y button position
local buttonLocationX = display.contentWidth/2
local buttonLocationY = display.contentHeight/2

local textObject = display.newText("Clicked!", display.contentWidth/2, display.contentHeight/4, nil, 70)
textObject:setTextColor(1,1,153/255)

local instructions = display.newText("Click, hold, and pass over the button!", display.contentWidth/2, 320, nil, 20)
textObject:setTextColor(1,1,153/255)

---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------

-- Set initial x and y position of the Buttons
ButtonPressed.x = buttonLocationX
ButtonPressed.y = buttonLocationY
ButtonUnpressed.x = buttonLocationX
ButtonUnpressed.y = buttonLocationY

print ("*** ButtonPressedWidth = " .. ButtonPressedWidth)
print ("*** ButtonPressedHeight = " .. ButtonPressedHeight)

-- Make the unpressed button visible and the pressed button invisible
ButtonUnpressed.isVisible = true
ButtonPressed.isVisible = false

-- Hide the text initially
textObject.isVisible = false

---------------------------------------------------------------------------------------------------------
-- Touch Function
---------------------------------------------------------------------------------------------------------

-- Function for character movement 
local function TouchListener(touch)

	if (touch.phase == "began") then
		--Check if within image parameters
		if ( ((buttonLocationX - ButtonPressedWidth/2) < touch.x) and
			 ((buttonLocationX + ButtonPressedWidth/2) > touch.x) and
			 ((buttonLocationY - ButtonPressedHeight/2) < touch.y) and
			 ((buttonLocationY + ButtonPressedHeight/2) > touch.y) ) then

			-- Display pressed button after click
			ButtonUnpressed.isVisible = false
			ButtonPressed.isVisible = true
			textObject.isVisible = true
			clickedOnButton = true

		else

			-- Display that the unpressed button has been clicked
			ButtonUnpressed.isVisible = true
			ButtonPressed.isVisible = false
			-- Hide text
			textObject.isVisible = false
			clickedOnButton = false
		end
	end

	-- If object on screen has been moved, update it's x and y values to where it is being moved
	if (touch.phase == "moved") then
		-- Check if within object's boundaries
		if ( ((buttonLocationX - ButtonPressedWidth/2) < touch.x) and
			 ((buttonLocationX + ButtonPressedWidth/2) > touch.x) and
			 ((buttonLocationY - ButtonPressedHeight/2) < touch.y) and
			 ((buttonLocationY + ButtonPressedHeight/2) > touch.y) and
			 clickedOnButton == true) then

			-- Display that the pressed button has been clicked
			ButtonUnpressed.isVisible = false
			ButtonPressed.isVisible = true
			-- Display text
			textObject.isVisible = false
		else
			-- Display that the unpressed button has been clicked
			ButtonUnpressed.isVisible = true
			ButtonPressed.isVisible = false
			-- Hide text
			textObject.isVisible = false
		end
	end

	if (touch.phase == "ended") then
		-- Display that the unpressed button has been clicked
		ButtonUnpressed.isVisible = true
		ButtonPressed.isVisible = false
		-- Hide text
		textObject.isVisible  = false
	end
end

-- TouchListener will be called if the object on the screen is touched
Runtime:addEventListener("touch", TouchListener)