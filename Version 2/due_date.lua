
-- Version 2 : Smart Agenda
-- File : due_date.lua
-- Created by Laura Aubin
-- Created on February 2, 2016
-- Description: User specifies when the assignment is due.


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "help_screen"

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------

local background
local now = os.time()
local startTime = os.time()
local endTime = 5


-----------------------------------------------------------------------------------------
-- Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    print("*** Back button clicked")

--------------------------------------------------------------------------------
--Custom Name textbox creation
-----------------------------------------------------------------------------------------

customNameTextField = customNameTextField

local function textListener(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        customName = (event.text)

    end
end

-- Create text field (horizontal, vertical, width, height)
customNameTextField = native.newTextField( 380, 254, 635, 105 )

customNameTextField:addEventListener("userInput", textListener)

-----------------------------------------------------------------------------------------

    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})
end  
 

-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view



-----------------------------------------------------------------------------------------
-- Background & static objects
-----------------------------------------------------------------------------------------


-- Set the background color
display.setDefault("background", 220/255, 210/255, 205/255)
    
---------------------------------------------------------------------------------------------------------

todayWordText = display.newText ( "Today:", 130, 200, "Arial", 65)
todayWordText:setTextColor(60/255, 50/255, 100/255)

todayText = display.newText ( os.date("%A %m, %d, %Y") , display.contentWidth/2, 300, "Arial", 55)
todayText:setTextColor(60/255, 50/255, 100/255)

displayTime = display.newText( endTime, display.contentWidth/1.28, 178, "Helvetica", 51 )
displayTime:setTextColor(60/255, 50/255, 100/255)

sceneGroup:insert( todayWordText )
sceneGroup:insert( todayText )
sceneGroup:insert( displayTime )

--if (os.date("%m")) = 02


---------------------------------------------------------------------------------------------------------
-- -- Create countdown timer
---------------------------------------------------------------------------------------------------------


-- Create countdown function
local function checkTime( event )

   local now = os.time()
   -- Display text showing the countdown to the endTime
   displayTime.text = endTime - ( now - startTime )

   if ( now > startTime + endTime ) then
      -- Change the text to notify when the timer is done
       displayTime.text = ( "Time's up" )
   end
end

Runtime:addEventListener( "enterFrame", checkTime )


-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


-- Creating back button
backButton = widget.newButton( 
    {   

        width = 305,
        height = 115,

        id = "backButton",
        --label = "Add",

        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/4.13,
        y = 10,

        -- Insert the images here
        defaultFile = "Images/Back.png",
        overFile = "Images/backClicked.png",

        -- When the button is released, call the add screen transition function
        onRelease = backButtonClicked          
    } )

-----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( backButton )

end 


-----------------------------------------------------------------------------------------
-- Global scene function - show, hide, destroy
-----------------------------------------------------------------------------------------


-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
-----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then       
        
    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    if ( phase == "will" ) then

-----------------------------------------------------------------------------------------

        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.

    elseif ( phase == "did" ) then

    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    
end 

-----------------------------------------------------------------------------------------
-- Scene event listeners
-----------------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene