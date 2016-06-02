
-- Version 2 : Smart Agenda
-- File : splash_screen.lua
-- Created by Laura Aubin
-- Created on January 08, 2016
-- Description: Program runs through the splash screen and goes to the main menu.


-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create scene object
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------

-- The local variables for this scene
local logo

--------------------------------------------------------------------------------------------
-- Local functions
--------------------------------------------------------------------------------------------


-- The function that will go to the main menu 
local function gotoMainMenu()

    composer.gotoScene( "Main Menu.main_menu", {effect = "flipFadeOutIn", time = 500})
end


-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- Insert the logo image
    logo = display.newImageRect("Images/Splash.png", 700, 1000)

    -- Set the initial x and y position of the logo
    logo.x = display.contentWidth/2
    logo.y = display.contentHeight/2

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( logo )

end 

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    local phase = event.phase

-----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    elseif ( phase == "did" ) then

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 500, gotoMainMenu)          
        
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