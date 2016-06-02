
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
sceneName = "due_date"

dueDateVariables = require( "Main Menu.variables" )


-- Create the scene object
local scene = composer.newScene( sceneName )


------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------


local dueDate
local year

local date

local todayNumber = os.date("%d")

local now = os.time()
local startTime = os.time()
local endTime = 154

dateAndTimeFunctions_ = require( "Due Date.Date and Time Functions" )

-----------------------------------------------------------------------------------------

function assigningValueToTime()

    time = A
    Runtime:removeEventListener( "enterFrame", assigningValueToTime )

    -- The workload calculation requires the task type component
    if ( specifiedTask == "Book Essay") then

       dailyWorkloadCalculation( ) 
    end
end

-----------------------------------------------------------------------------------------

function assigningValueToTime2()

    time2 = B
    Runtime:removeEventListener( "enterFrame", assigningValueToTime2 )

    -- The workload calculation requires the task type component
    if ( specifiedTask2 == "Option2") then

       dailyWorkloadCalculation( ) 
    end
end


-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view


---------------------------------------------------------------------------------------------------------
-- Create countdown timer
---------------------------------------------------------------------------------------------------------


-- Create countdown function
local function checkTime( event )

   local now = os.time()
   -- Display text showing the countdown to the endTime
   displayTime.text = endTime - ( now - startTime )

   if ( now > startTime + endTime ) then
      -- Change the text to notify when the timer is done
       displayTime.text = ( "Time's up" )
       Runtime:removeEventListener( "enterFrame", checkTime )
   end
end

Runtime:addEventListener( "enterFrame", checkTime )

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

-- Checks what month the user writes
Runtime:addEventListener( "enterFrame", monthNumber )

--Runtime:addEventListener( "enterFrame", daysCalculator )

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