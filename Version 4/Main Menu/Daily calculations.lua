
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

    if (bookEssayTaskNumber == "5") then

        -- The next task
        bookEssayTaskNumber = "4" 
        todayTask = "Review essay's"

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)
       -- print("*** Today's task =", todayTask)

    elseif (bookEssayTaskNumber == "4") then

        -- The next task
        bookEssayTaskNumber = "3"
        todayTask = "Rough draft" 

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)

    elseif (bookEssayTaskNumber == "3") then
        
        -- The next task
        bookEssayTaskNumber = "2"
        todayTask = "Edit draft" 

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)

    elseif (bookEssayTaskNumber == "2") then
        
        -- The next task
        bookEssayTaskNumber = "1"
        todayTask = "Final draft" 

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)

    elseif (bookEssayTaskNumber == "1") then
        
        -- The next task
        bookEssayTaskNumber = "0"
        todayTask = "Completed!" 

        todayTaskText.text = todayTask

        print("*** Today's task =", todayTask)

    elseif (bookEssayTaskNumber == "0") then
        
        -- No more tasks
        todayTask = "Completed!" 

        todayTaskText.text = todayTask

        print("*** Today's task =", todayTask)

    end
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
        
         print("*** Daily work load =", dailyWorkLoad)

    end
end 