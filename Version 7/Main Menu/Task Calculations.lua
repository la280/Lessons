
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

    -- No more tasks
    if ( time == 0 ) then

        todayTask = "Completed!" 

        todayTaskText.text = todayTask 

        print("*** Finished task =", todayTask)
    end
end 

---------------------------------------------------------------------------------------------------------

function dailyWorkLoadDetails() 

	if ( dailyWorkLoad >= dailyWorkLoadValue ) then 

		-- Next task
		--nextBookEssayTaskNumber( ) 
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
		bookEssayTaskNumber = table.maxn( t )

		if ( (dailyWorkLoad > 0) and (dailyWorkLoad <= 1) ) then

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( ) 

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		-------------------------------------------------------------

		elseif ( (dailyWorkLoad > 1) and (dailyWorkLoad <= 2) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "2 steps today"

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		-------------------------------------------------------------

		elseif ( (dailyWorkLoad > 2) and (dailyWorkLoad <= 3) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "3 steps today"

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		-------------------------------------------------------------

		elseif ( (dailyWorkLoad > 3) and (dailyWorkLoad <= 4) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "4 steps today"

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		-------------------------------------------------------------

		elseif ( (dailyWorkLoad > 4) and (dailyWorkLoad <= 5) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "5 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		elseif ( (dailyWorkLoad > 5) and (dailyWorkLoad <= 6) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "6 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		elseif ( (dailyWorkLoad > 6) and (dailyWorkLoad <= 7) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "7 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		elseif ( (dailyWorkLoad > 7) and (dailyWorkLoad <= 8) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "8 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		elseif ( (dailyWorkLoad > 8) and (dailyWorkLoad <= 9) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "9 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end

		elseif ( (dailyWorkLoad > 9) and (dailyWorkLoad <= 10) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "10 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workload_ )

				-- New workload parameters
				incrimentedWorkloadCalculation( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workload_ )
			end
		end
	end

	Runtime:addEventListener( "enterFrame", workload_ )
end 

-----------------------------------------------------------------------------------------

-- Create a function that moves onto the next task since the current one is completed.
function checkButtonClicked( ) -- *******************************

	table.remove(t, 1 )
	todayTask = t[1]
	todayTaskText.text = todayTask
    print("*** Today's task =", todayTask) 

    bookEssayTaskNumber = table.maxn( t )

	dailyWorkloadCalculation( )
end 