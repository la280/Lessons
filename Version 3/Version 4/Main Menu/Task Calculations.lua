
-- Version 4 : Smart Agenda
-- File : Task Calculations.lua
-- Created by Laura Aubin
-- Created on April 19, 2016
-- Description: These are the calculations that evaluate and organize the function of workload

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "Task Calculations"

dueDateVariables = require( "Due Date.Variables" )
dueDateAndTime = require( "Due Date.Date and Time Functions" )


---------------------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------------------


-- Create a daily workload calculator
function incrimentedWorkloadCalculation( ) 

    -- If we are working with the book essay
    if ( specifiedTask == "Book Essay" ) then

    	-- Subtract one complete day
    	time = time - 1

    	print("****!!!!TIME =",time)

        -- The number of steps divided by how much time you have to complete it
        dailyWorkLoad = bookEssayTaskNumber/time
      
         print("*** Incrimented work load =", dailyWorkLoad)
    end
end 

---------------------------------------------------------------------------------------------------------

function dailyWorkLoadDetails()

	if ( dailyWorkLoad >= dailyWorkLoadValue ) then

		-- Next task
		nextBookEssayTaskNumber( ) 
		-- Prep for next timer
		timerSetUp( ) 

		-- New workload parameters
		incrimentedWorkloadCalculation( ) 
		-- New number of days between due date and today
		daysCalculator()

		-- Repeat this function with the timer
		Runtime:addEventListener( "enterFrame", workload_ )

	elseif ( dailyWorkLoad < dailyWorkLoadValue ) then

		timerSetUp( ) 

		incrimentedWorkloadCalculation( ) 
		daysCalculator()

		Runtime:addEventListener( "enterFrame", workload_ )
	end
end

---------------------------------------------------------------------------------------------------------

function _bookEssayWorkload( ) 

	print ("*** Book essay task number =", bookEssayTaskNumber)
	print ("*** Base workload =", dailyWorkLoadValue)
	print ("*** Incrimented workload =", dailyWorkLoad)

	daysCalculator()

	print ("*** Days between now and today", time)

	timerSetUp( ) 

	function workload_( ) 

		now = os.time()

		-- Between 0 and 1, can only complete one task max. each day
		if ( (dailyWorkLoadValue > 0) and (dailyWorkLoadValue <= 1) ) then

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime ) 
			--print("*** Time =", dailyEndTime - ( now - dailyStartTime ) )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				dailyWorkLoadDetails()
			end
		end

		-- Between 1 and 2, can only complete two tasks max. each day
		if ( (dailyWorkLoadValue > 1) and (dailyWorkLoadValue < 2) ) then

			if ( (dailyWorkLoad > 0) and (dailyWorkLoad <= 1) ) then

				displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )
				--print("*** Time =", dailyEndTime - ( now - dailyStartTime ) )

				if ( now > (dailyStartTime + dailyEndTime) ) then

					-- Remove this event listener so that the function does not repeat itself
					Runtime:removeEventListener( "enterFrame", workload_ )

					-- Next task
					nextBookEssayTaskNumber( ) 
					-- Prep for next timer
					timerSetUp( ) 

					-- New workload parameters
					incrimentedWorkloadCalculation( ) 
					-- New number of days between due date and today
					daysCalculator()

					-- Repeat this function with the timer
					Runtime:addEventListener( "enterFrame", workload_ )
				end

			elseif ( (dailyWorkLoad > 1) and (dailyWorkLoad < 2) ) then

				displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )
				--print("*** Time =", dailyEndTime - ( now - dailyStartTime ) )

				if ( now > (dailyStartTime + dailyEndTime) ) then

					-- Remove this event listener so that the function does not repeat itself
					Runtime:removeEventListener( "enterFrame", workload_ )

					-- Next task - two tasks
					nextBookEssayTaskNumber( ) 
					nextBookEssayTaskNumber( ) 
					-- Prep for next timer
					timerSetUp( )

					-- New workload parameters
					incrimentedWorkloadCalculation( ) 
					-- New number of days between due date and today
					daysCalculator()

					-- Visual representation that there are two tasks being done
					todayTaskText.text = "2 steps today"

					-- Repeat this function with the timer
					Runtime:addEventListener( "enterFrame", workload_ )
				end
			end
		end
	end

	Runtime:addEventListener( "enterFrame", workload_ )
end 