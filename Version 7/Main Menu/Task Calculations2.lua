
-- Version 6 : Smart Agenda
-- File : Task Calculations2.lua
-- Created by Laura Aubin
-- Created on May 16, 2016
-- Description: Calculations for option 2

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "Task Calculations2"

dueDateVariables = require( "Due Date.Variables" )
dueDateAndTime = require( "Due Date.Date and Time Functions" )


---------------------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------------------


-- Create a daily workload calculator
function incrimentedWorkloadCalculation2( ) 

    if ( specifiedTask2 == "Option2" ) then

    	-- Subtract one complete day
    	time2 = time2 - 1

    	print("****!!!!TIME_2 =",time2)

        -- The number of steps divided by how much time you have to complete it
        dailyWorkLoad2 = option2TaskNumber/time2
      
         print("*** Incrimented work load =", dailyWorkLoad2)
    end

    -- No more tasks
    if ( time2 == 0 ) then

        todayTask = "Completed!" 

        todayTaskText.text = todayTask 

        print("*** Finished task =", todayTask)
    end
end 

---------------------------------------------------------------------------------------------------------

function dailyWorkLoadDetails2() 

	if ( dailyWorkLoad2 >= dailyWorkLoadValue2 ) then 

		-- Prep for next timer 
		timerSetUp( ) 

		-- New workload parameters 
		incrimentedWorkloadCalculation2( ) 
		-- New number of days between due date and today 
		daysCalculator() 

		-- Repeat this function with the timer 
		Runtime:addEventListener( "enterFrame", workloadOption2) 

	elseif ( dailyWorkLoad2 < dailyWorkLoadValue2 ) then

		timerSetUp( ) 

		incrimentedWorkloadCalculation2( ) 
		daysCalculator()

		Runtime:addEventListener( "enterFrame", workloadOption2 )
	end
end

---------------------------------------------------------------------------------------------------------

function option2Workload( ) 

	print ("*** Option 2 task number =", option2TaskNumber)
	print ("*** O2 Base workload =", dailyWorkLoadValue2)
	print ("*** O2 Incrimented workload =", dailyWorkLoad2)

	daysCalculator()

	print ("*** O2 Days between now and today", time2)

	timerSetUp( ) 

	function workloadOption2( ) 

		now = os.time()
		option2TaskNumber = table.maxn( t2 )

		if ( (dailyWorkLoad2 > 0) and (dailyWorkLoad2 <= 1) ) then

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( ) 

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		-------------------------------------------------------------

		elseif ( (dailyWorkLoad2 > 1) and (dailyWorkLoad2 <= 2) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "2 steps today"

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		-------------------------------------------------------------

		elseif ( (dailyWorkLoad2 > 2) and (dailyWorkLoad2 <= 3) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "3 steps today"

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		-------------------------------------------------------------

		elseif ( (dailyWorkLoad2 > 3) and (dailyWorkLoad2 <= 4) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "4 steps today"

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then

				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		-------------------------------------------------------------

		elseif ( (dailyWorkLoad2 > 4) and (dailyWorkLoad2 <= 5) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "5 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		elseif ( (dailyWorkLoad2 > 5) and (dailyWorkLoad2 <= 6) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "6 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		elseif ( (dailyWorkLoad2 > 6) and (dailyWorkLoad2 <= 7) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "7 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		elseif ( (dailyWorkLoad2 > 7) and (dailyWorkLoad2 <= 8) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "8 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		elseif ( (dailyWorkLoad2 > 8) and (dailyWorkLoad2 <= 9) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "9 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end

		elseif ( (dailyWorkLoad2 > 9) and (dailyWorkLoad2 <= 10) ) then

			-- Visual representation that there are two tasks being done
			todayTaskText.text = "10 steps today" 

			displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

			if ( now > (dailyStartTime + dailyEndTime) ) then
				
				-- Remove this event listener so that the function does not repeat itself
				Runtime:removeEventListener( "enterFrame", workloadOption2 )

				-- New workload parameters
				incrimentedWorkloadCalculation2( ) 
				-- New number of days between due date and today
				daysCalculator()

				-- Prep for next timer
				timerSetUp( )

				-- Repeat this function with the timer
				Runtime:addEventListener( "enterFrame", workloadOption2 )
			end
		end
	end

	Runtime:addEventListener( "enterFrame", workloadOption2 )
end 

-----------------------------------------------------------------------------------------

-- Create a function that moves onto the next task since the current one is completed.
function checkButtonClicked( ) -- *******************************

	table.remove(t2, 1 )
	todayTask = t2[1]
	todayTaskText.text = todayTask
    print("*** Today's task =", todayTask) 

    option2TaskNumber = table.maxn( t2 )

	dailyWorkloadCalculation( )
end 