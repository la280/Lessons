
-- Version 2 : Smart Agenda
-- File : _Background colours
-- Created by Laura Aubin
-- Created on April 13, 2016
-- Description: Background colour dots

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Create the scene object
local scene = composer.newScene( sceneName )

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- Name this scene
sceneName = "Background colours"


---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------


local blackDotButton
local whiteDotButton
local blueDotButton
local greenDotButton
local purpleDotButton
local redDotButton


-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

end 

--------------------------------------------------------------------------------------------

function scene:show( event )

    local sceneGroup = self.view

    local phase = event.phase

    if ( phase == "will" ) then
       
    elseif ( phase == "did" ) then      
        
    end
end 

-----------------------------------------------------------------------------------------

function scene:hide( event )

    local sceneGroup = self.view

    local phase = event.phase

    if ( phase == "will" ) then

    elseif ( phase == "did" ) then

    end
end 

-----------------------------------------------------------------------------------------

function scene:destroy( event )

    local sceneGroup = self.view

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