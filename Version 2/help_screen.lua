
-- Version 2 : Smart Agenda
-- File : help_screen.lua
-- Created by Laura Aubin
-- Created on January 09, 2016
-- Description: User help screen with instructions and tutorials


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


-----------------------------------------------------------------------------------------
-- Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    print("*** Back button clicked")

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
display.setDefault("background", 255, 255, 255)

background = display.newImage("Images/Screens/instructions.png")

background.x = display.contentCenterX
background.y = display.contentCenterY
background.width = display.contentWidth
background.height = display.contentHeight*1.4

-- Associate objects within this scene 
sceneGroup:insert( background )

-- Send the background image to the back layer so all other objects can be on top
background:toBack()
    

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
        y = 37,

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