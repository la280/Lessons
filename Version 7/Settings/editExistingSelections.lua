
-- Version 6 : Smart Agenda
-- File : editExistingSelections.lua
-- Created by Laura Aubin
-- Created on May 10, 2016
-- Description: All your existing tables are displayed 


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "editExistingSelections" 

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------


local function backFromSettingsSelectionClicked()

    composer.gotoScene( "Settings.settings_menu", {effect = "zoomInOutFade", time = 500})
end

---------------------------------------------------------------------------------------------

function taskName1Clicked()

    composer.gotoScene( "Settings.EditOption1", {effect = "zoomInOutFade", time = 400})
end


-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ----------------------------------------------------------------------------------------

    taskName1 = display.newText ( table1Name, display.contentWidth/2, 280, "Arial", 60)
    taskName1:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( taskName1 )

    -----------------------------------------------------------------------------------------
    -- Button widgets
    -----------------------------------------------------------------------------------------   

        backFromSettingsSelection = widget.newButton( 
            {   

                width = 290,
                height = 120,

                id = "backFromSettingsEditButton",

                -- Set its position on the screen relative to the screen size
                x = display.contentWidth/4,
                y = -50,

                -- Insert the images here
                defaultFile = "Images/Back.png",
                overFile = "Images/Back2.png",

                -- When the button is released, call the add screen transition function
                onRelease = backFromSettingsSelectionClicked          
            } )

        sceneGroup:insert( backFromSettingsSelection )
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

        taskName1.text = table1Name
       
-----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then

        -- 'touch' calls too many times
        taskName1:addEventListener('tap', taskName1Clicked)
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