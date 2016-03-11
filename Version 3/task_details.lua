
-- Version 3 : Smart Agenda
-- File : task_details.lua
-- Created by Laura Aubin
-- Created on March 10, 2016
-- Description: Here the user can view a more detailed display of their daily task.


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "class_options"

-- Create the scene object
local scene = composer.newScene( sceneName )

customName = "Custom name"

---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------

local background
local backButton
local todayTaskTextTitle
local todayTaskText
local tomorrowTaskText
local customNameText
local noText

-----------------------------------------------------------------------------------------
-- Local Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})

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

-- Set the background to be white
display.setDefault("background", 250, 255, 255)

---------------------------------------------------------------------------------------------------------

if (customName == "") then

    noText = display.newText ( "Nothing here yet", display.contentWidth/2,  300, "Arial", 80)
    noText:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( noText )

else

    --todayTask = "Research book"

    todayTaskTextTitle = display.newText ( "To finish today:", 310, 220, "Arial", 80)
    todayTaskTextTitle:setTextColor(60/255, 50/255, 100/255)

    todayTaskText = display.newText (todayTask, 240, 320, "Calibri", 65)
    todayTaskText:setTextColor(0/255, 30/255, 200/255)

    tomorrowTaskText = display.newText ( "Tomorrow:", 210, 440, "Arial", 70)
    tomorrowTaskText:setTextColor(60/255, 50/255, 100/255)

    customNameText = display.newText ( "Task 1: " .. customName, display.contentWidth/2, 90, "Calibri", 65)
    customNameText:setTextColor(150/255, 100/255, 240/255)

    sceneGroup:insert( todayTaskTextTitle )
    sceneGroup:insert( tomorrowTaskText )
    sceneGroup:insert( customNameText )

end

-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


-- Creating back button
backButton = widget.newButton( 
    {   

        width = 340,
        height = 125,

        id = "backButton",
        --label = "Add",

        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/3.7,
        y = -70,

        -- Insert the images here
        defaultFile = "Images/Back.png",
        overFile = "Images/backClicked.png",

        -- When the button is released, call the add screen transition function
        onRelease = backButtonClicked          
    } )

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