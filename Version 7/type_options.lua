
-- Version 2 : Smart Agenda
-- File : type_options.lua
-- Created by Laura Aubin
-- Created on January 12, 2016
-- Description: Menu options for the type of assignment, under the add screen.


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "type_options"

-- Create the scene object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- Local Transition functions
-----------------------------------------------------------------------------------------


 -- When the option 1 button is clicked, call this function
function optionOneClicked( )

    typeOption = "Book Essay"

    print("*** Option 1, book essay clicked")
    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})

-----------------------------------------------------------------------------------------

-- Book essay tasks = (5): Research book
--                    (4): Review essay's
--                    (3): Rough draft
--                    (2): Edit draft
--                    (1): Final draft

-- State initial book essay characteristics
    bookEssayTaskNumber = table.maxn(t)
    todayTask = t[1]
    specifiedTask = "Book Essay"

    -- The workload calculation requires the time component
    if ( daysBetweenTodayAndDue ~= 0) then

        dailyWorkloadCalculation( ) 
    end

    print("*** Book essay task number =", bookEssayTaskNumber)
end  

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

 -- When the option 1 button is clicked, call this function
function option2Clicked( )

    typeOption = table2Name

    print("*** Option 2 clicked: ",table2Name)
    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})

    -- State initial characteristics
    option2TaskNumber = table.maxn(t2)
    todayTask = t2[1]
    specifiedTask2 = "Option2" 

    -- The workload calculation requires the time component
    if ( daysBetweenTodayAndDue2 ~= 0) then

        dailyWorkloadCalculation( ) 
    end

    print("*** Option 2 task number =", option2TaskNumber)
end  


-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
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