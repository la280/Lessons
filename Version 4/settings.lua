
-- Version 4 : Smart Agenda
-- File : settings.lua
-- Created by Laura Aubin
-- Created on April 26, 2016
-- Description: Settings


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "settings" 

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------


local function editTask1ButtonClicked( ) 

    if ( task1Color == "true" ) then

        task1:setTextColor(190/255, 180/255, 180/255)
        task1Color = "false"

        bookEssayTaskNumber = bookEssayTaskNumber - 1

    elseif ( task1Color == "false" ) then

        task1:setTextColor(60/255, 50/255, 100/255)
        task1Color = "true"
    end
end

---------------------------------------------------------------------------------------------

function removeBookEssayTasks( ) 

end

Runtime:addEventListener( "enterFrame", removeBookEssayTasks )


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

    task1 = display.newText ( "Research book", display.contentWidth/3, 0, "Arial", 55)
    task1:setTextColor(60/255, 50/255, 100/255)
    task1Color = "true"

    task2 = display.newText ( "Review essay's", display.contentWidth/3, 100, "Arial", 55)
    task2:setTextColor(60/255, 50/255, 100/255)

    task3 = display.newText ( "Rough draft", display.contentWidth/3, 200, "Arial", 55)
    task3:setTextColor(60/255, 50/255, 100/255)

    task4 = display.newText ( "Edit draft", display.contentWidth/3, 300, "Arial", 55)
    task4:setTextColor(60/255, 50/255, 100/255)

    task5 = display.newText ( "Final draft", display.contentWidth/3, 400, "Arial", 55)
    task5:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( task1 )
    sceneGroup:insert( task2 )
    sceneGroup:insert( task3 )
    sceneGroup:insert( task4 )
    sceneGroup:insert( task5 )


-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


    -- Creating an edit button
    editTask1Button = widget.newButton( 
        {   

            width = 80,
            height = 80,

            id = "editTask1Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.5,
            y = 0,

            -- Insert the images here
            defaultFile = "Images/Edit.png",
            overFile = "Images/EditPressed.png",

            -- When the button is released, call the edit screen transition function
            onRelease = editTask1ButtonClicked          
        } )

    sceneGroup:insert( editTask1Button )

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