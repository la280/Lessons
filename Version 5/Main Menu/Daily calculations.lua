
-- Version 4 : Smart Agenda
-- File : Daily Calculations.lua
-- Created by Laura Aubin
-- Created on April 19, 2016
-- Description: These are the calculations that determine daily workload and tasks

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "Daily calculations"


-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------


function nextBookEssayTaskNumber( ) 

    -- Remove the first task from the table 
    table.remove(t, 1 )--"Research book")

    -- Today task = the first item in the table
    todayTask = t[1]
    -- Change the text
    todayTaskText.text = todayTask
    print("*** Today's task =", todayTask) 

    bookEssayTaskNumber = table.maxn( t )
end

-----------------------------------------------------------------------------------------

-- Increase workload each finished day
function increaseDailyWorkload( ) 

  dailyWorkLoad = dailyWorkLoad + dailyWorkLoadValue
  print("*** Daily workload =", dailyWorkLoad) 
end

-----------------------------------------------------------------------------------------

-- Prep for next timer
function timerSetUp( ) 

  -- Reset the visual timer
  dailyEndTime = 5
  displayDailyTime.text = dailyEndTime

  -- Initial time
  dailyStartTime = os.time()
end 

-----------------------------------------------------------------------------------------

-- Create a daily workload calculator
function dailyWorkloadCalculation( ) 

    -- If we are working with the book essay
    if (bookEssayTaskNumber == "5") then

        -- The number of steps divided by how much time you have to complete it
        dailyWorkLoad = bookEssayTaskNumber/timeSpan

        -- This is the number that remains constant 
        dailyWorkLoadValue = dailyWorkLoad
        
         print("***! Daily work load =", dailyWorkLoad)

    end
end 