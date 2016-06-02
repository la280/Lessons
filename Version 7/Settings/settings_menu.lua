
-- Version 6 : Smart Agenda
-- File : settings_menu.lua
-- Created by Laura Aubin
-- Created on April 26, 2016
-- Description: Settings menu


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "settings_menu" 

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------


local function backFromSettingsMenuButtonClicked(event)

    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
end

---------------------------------------------------------------------------------------------

function editExistingSelectionsClicked(event)

    composer.gotoScene( "Settings.editExistingSelections", {effect = "zoomInOutFade", time = 500})
end

---------------------------------------------------------------------------------------------

function addMoreTasksClicked(event)

    composer.gotoScene( "Settings.addMoreTasks", {effect = "zoomInOutFade", time = 500})
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
    
    -- Set the background to be white
    display.setDefault("background", 250, 255, 255)

    background = display.newImage("Images/Screens/Settings.png")

    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.width = display.contentWidth
    background.height = display.contentHeight*1.4

    -- Associate objects within this scene  
    sceneGroup:insert( background )

    -- Send the background image to the back layer so all other objects can be on top
    background:toBack()

    ----------------------------------------------------------------------------------------

    editExistingDetailsText = display.newText ( "EDIT EXISTING DETAILS", display.contentWidth/2, 280, "Arial", 50)
    editExistingDetailsText:setTextColor(60/255, 50/255, 100/255)

    addMoreTasksText = display.newText ( "ADD MORE TASKS", display.contentWidth/2, 580, "Arial", 50)
    addMoreTasksText:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( editExistingDetailsText )
    sceneGroup:insert( addMoreTasksText )

    -----------------------------------------------------------------------------------------
    -- Button widgets
    -----------------------------------------------------------------------------------------   

        backFromSettingsMenuButton = widget.newButton( 
            {   

                width = 290,
                height = 120,

                id = "backFromSettingsMenuButton",

                -- Set its position on the screen relative to the screen size
                x = display.contentWidth/4,
                y = -50,

                -- Insert the images here
                defaultFile = "Images/Back.png",
                overFile = "Images/Back2.png",

                -- When the button is released, call the add screen transition function
                onRelease = backFromSettingsMenuButtonClicked          
            } )

        sceneGroup:insert( backFromSettingsMenuButton )
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

        -- 'touch' calls too many times
        editExistingDetailsText:addEventListener('tap', editExistingSelectionsClicked)
        addMoreTasksText:addEventListener('tap', addMoreTasksClicked)
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