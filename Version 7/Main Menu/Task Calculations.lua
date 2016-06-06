
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

	-- The visual date
	dayNumberManipulate = dayNumberManipulate + 1
	dayNumberManipulate3 = dayNumberManipulate3 + 1
	dayNumberManipulate4 = dayNumberManipulate4 + 1

	--------------------------------------------------------------------
	if ( dayNumberManipulate > 9 ) then

		dateMainDate.text =  dayNumberManipulate
		dateMainDateMainScreen.text = dayNumberManipulate

	elseif ( dayNumberManipulate <= 9 ) then

		dateMainDate.text = "0" .. dayNumberManipulate
		dateMainDateMainScreen.text = "0" .. dayNumberManipulate
	end
	--------------------------------------------------------------------
	-- Ridiculously long if statement...
	if ( dayNumberManipulate == 2 ) then

			dateMainDate1.text = "31"
			dateMainDate1MainScreen.text = "31"
			dateMainDate2.text = "01"
			dateMainDate2MainScreen.text = "01"

			dateMainDay1.text = "TUES"
			dateMainDay2.text = "WED"
			dateMainDay.text = "THU"
			dateMainDay3.text = "FRI"
			dateMainDay4.text = "SAT"

			dateMainDay1MainScreen.text = "TUES"
			dateMainDay2MainScreen.text = "WED"
			dateMainDayMainScreen.text = "THU"
			dateMainDay3MainScreen.text = "FRI"
			dateMainDay4MainScreen.text = "SAT"

		elseif ( dayNumberManipulate == 3 ) then

			dateMainDate1.text = "01"
			dateMainDate1MainScreen.text = "01"
			dateMainDate2.text = "02"
			dateMainDate2MainScreen.text = "02"

			dateMainDay1.text = "WED"
			dateMainDay2.text = "THU"
			dateMainDay.text = "FRI"
			dateMainDay3.text = "SAT"
			dateMainDay4.text = "SUN"

			dateMainDay1MainMenu.text = "WED"
			dateMainDay2MainMenu.text = "THU"
			dateMainDayMainMenu.text = "FRI"
			dateMainDay3MainMenu.text = "SAT"
			dateMainDay4MainMenu.text = "SUN"

		elseif ( dayNumberManipulate == 4 ) then

			dateMainDate1.text = "02"
			dateMainDate1MainScreen.text = "02"
			dateMainDate2.text = "03"
			dateMainDate2MainScreen.text = "03"

			dateMainDay1.text = "THU"
			dateMainDay2.text = "FRI"
			dateMainDay.text = "SAT"
			dateMainDay3.text = "SUN"
			dateMainDay4.text = "MON"

			dateMainDay1MainMenu.text = "THU"
			dateMainDay2MainMenu.text = "FRI"
			dateMainDayMainMenu.text = "SAT"
			dateMainDay3MainMenu.text = "SUN"
			dateMainDay4MainMenu.text = "MON"

		elseif ( dayNumberManipulate == 5 ) then

			dateMainDate1.text = "03"
			dateMainDate1MainScreen.text = "03"
			dateMainDate2.text = "04"
			dateMainDate2MainScreen.text = "04"

			dateMainDay1.text = "FRI"
			dateMainDay2.text = "SAT"
			dateMainDay.text = "SUN"
			dateMainDay3.text = "MON"
			dateMainDay4.text = "TUES"

			dateMainDay1MainMenu.text = "FRI"
			dateMainDay2MainMenu.text = "SAT"
			dateMainDayMainMenu.text = "SUN"
			dateMainDay3MainMenu.text = "MON"
			dateMainDay4MainMenu.text = "TUES"

		elseif ( dayNumberManipulate == 6 ) then

			dateMainDate1.text = "04"
			dateMainDate1MainScreen.text = "04"
			dateMainDate2.text = "05"
			dateMainDate2MainScreen.text = "05"

			dateMainDay1.text = "SAT"
			dateMainDay2.text = "SUN"
			dateMainDay.text = "MON"
			dateMainDay3.text = "TUES"
			dateMainDay4.text = "WED"

			dateMainDay1MainMenu.text = "SAT"
			dateMainDay2MainMenu.text = "SUN"
			dateMainDayMainMenu.text = "MON"
			dateMainDay3MainMenu.text = "TUES"
			dateMainDay4MainMenu.text = "WED"

		elseif ( dayNumberManipulate == 7 ) then

			dateMainDate1.text = "05"
			dateMainDate1MainScreen.text = "05"
			dateMainDate2.text = "06"
			dateMainDate2MainScreen.text = "06"

			dateMainDay1.text = "SUN"
			dateMainDay2.text = "MON"
			dateMainDay.text = "TUES"
			dateMainDay3.text = "WED"
			dateMainDay4.text = "THU"

			dateMainDay1MainMenu.text = "SUN"
			dateMainDay2MainMenu.text = "MON"
			dateMainDayMainMenu.text = "TUES"
			dateMainDay3MainMenu.text = "WED"
			dateMainDay4MainMenu.text = "THU"

		elseif ( dayNumberManipulate == 8 ) then

			dateMainDate1.text = "06"
			dateMainDate1MainScreen.text = "06"
			dateMainDate2.text = "07"
			dateMainDate2MainScreen.text = "07"

			dateMainDay1.text = "MON"
			dateMainDay2.text = "TUES"
			dateMainDay.text = "WED"
			dateMainDay3.text = "THU"
			dateMainDay4.text = "FRI"

			dateMainDay1MainMenu.text = "MON"
			dateMainDay2MainMenu.text = "TUES"
			dateMainDayMainMenu.text = "WED"
			dateMainDay3MainMenu.text = "THU"
			dateMainDay4MainMenu.text = "FRI"

		elseif ( dayNumberManipulate == 9 ) then

			dateMainDate1.text = "07"
			dateMainDate1MainScreen.text = "07"
			dateMainDate2.text = "08"
			dateMainDate2MainScreen.text = "08"

			dateMainDay1.text = "TUES"
			dateMainDay2.text = "WED"
			dateMainDay.text = "THU"
			dateMainDay3.text = "FRI"
			dateMainDay4.text = "SAT"

			dateMainDay1MainMenu.text = "TUES"
			dateMainDay2MainMenu.text = "WED"
			dateMainDayMainMenu.text = "THU"
			dateMainDay3MainMenu.text = "FRI"
			dateMainDay4MainMenu.text = "SAT"

		elseif ( dayNumberManipulate == 10 ) then

			dateMainDate1.text = "08"
			dateMainDate1MainScreen.text = "08"
			dateMainDate2.text = "09"
			dateMainDate2MainScreen.text = "09"

			dateMainDay1.text = "WED"
			dateMainDay2.text = "THU"
			dateMainDay.text = "FRI"
			dateMainDay3.text = "SAT"
			dateMainDay4.text = "SUN"

			dateMainDay1MainMenu.text = "WED"
			dateMainDay2MainMenu.text = "THU"
			dateMainDayMainMenu.text = "FRI"
			dateMainDay3MainMenu.text = "SAT"
			dateMainDay4MainMenu.text = "SUN"

		elseif ( dayNumberManipulate == 11 ) then

			dateMainDate1.text = "09"
			dateMainDate1MainScreen.text = "09"
			dateMainDate2.text = "10"
			dateMainDate2MainScreen.text = "10"

		elseif ( dayNumberManipulate == 12 ) then

			dateMainDate1.text = "10"
			dateMainDate1MainScreen.text = "10"
			dateMainDate2.text = "11"
			dateMainDate2MainScreen.text = "11"

		elseif ( dayNumberManipulate == 13 ) then

			dateMainDate1.text = "11"
			dateMainDate1MainScreen.text = "11"
			dateMainDate2.text = "12"
			dateMainDate2MainScreen.text = "12"

		elseif ( dayNumberManipulate == 14 ) then

			dateMainDate1.text = "12"
			dateMainDate1MainScreen.text = "12"
			dateMainDate2.text = "13"
			dateMainDate2MainScreen.text = "13"

		elseif ( dayNumberManipulate == 15 ) then

			dateMainDate1.text = "13"
			dateMainDate1MainScreen.text = "13"
			dateMainDate2.text = "14"
			dateMainDate2MainScreen.text = "14"

		elseif ( dayNumberManipulate == 16 ) then

			dateMainDate1.text = "14"
			dateMainDate1MainScreen.text = "14"
			dateMainDate2.text = "15"
			dateMainDate2MainScreen.text = "15"

		elseif ( dayNumberManipulate == 17 ) then

			dateMainDate1.text = "15"
			dateMainDate1MainScreen.text = "15"
			dateMainDate2.text = "16"
			dateMainDate2MainScreen.text = "16"

		elseif ( dayNumberManipulate == 18 ) then

			dateMainDate1.text = "16"
			dateMainDate1MainScreen.text = "16"
			dateMainDate2.text = "17"
			dateMainDate2MainScreen.text = "17"

		elseif ( dayNumberManipulate == 19 ) then

			dateMainDate1.text = "17"
			dateMainDate1MainScreen.text = "17"
			dateMainDate2.text = "18"
			dateMainDate2MainScreen.text = "18"

		elseif ( dayNumberManipulate == 20 ) then

			dateMainDate1.text = "18"
			dateMainDate1MainScreen.text = "18"
			dateMainDate2.text = "19"
			dateMainDate2MainScreen.text = "19"

		elseif ( dayNumberManipulate == 21 ) then

			dateMainDate1.text = "19"
			dateMainDate1MainScreen.text = "19"
			dateMainDate2.text = "20"
			dateMainDate2MainScreen.text = "20"

		elseif ( dayNumberManipulate == 22 ) then

			dateMainDate1.text = "20"
			dateMainDate1MainScreen.text = "20"
			dateMainDate2.text = "21"
			dateMainDate2MainScreen.text = "21"

		elseif ( dayNumberManipulate == 23 ) then

			dateMainDate1.text = "21"
			dateMainDate1MainScreen.text = "21"
			dateMainDate2.text = "22"
			dateMainDate2MainScreen.text = "22"

		elseif ( dayNumberManipulate == 24 ) then

			dateMainDate1.text = "22"
			dateMainDate1MainScreen.text = "22"
			dateMainDate2.text = "23"
			dateMainDate2MainScreen.text = "23"

		elseif ( dayNumberManipulate == 25 ) then

			dateMainDate1.text = "23"
			dateMainDate1MainScreen.text = "23"
			dateMainDate2.text = "24"
			dateMainDate2MainScreen.text = "24"

		elseif ( dayNumberManipulate == 26 ) then

			dateMainDate1.text = "24"
			dateMainDate1MainScreen.text = "24"
			dateMainDate2.text = "25"
			dateMainDate2MainScreen.text = "25"

		elseif ( dayNumberManipulate == 27 ) then

			dateMainDate1.text = "25"
			dateMainDate1MainScreen.text = "25"
			dateMainDate2.text = "26"
			dateMainDate2MainScreen.text = "26"

		elseif ( dayNumberManipulate == 28 ) then

			dateMainDate1.text = "26"
			dateMainDate1MainScreen.text = "26"
			dateMainDate2.text = "27"
			dateMainDate2MainScreen.text = "27"

		elseif ( dayNumberManipulate == 29 ) then

			dateMainDate1.text = "27"
			dateMainDate1MainScreen.text = "27"
			dateMainDate2.text = "28"
			dateMainDate2MainScreen.text = "28"

		elseif ( dayNumberManipulate == 30 ) then

			dateMainDate1.text = "28"
			dateMainDate1MainScreen.text = "28"
			dateMainDate2.text = "29"
			dateMainDate2MainScreen.text = "29"
	end
	--------------------------------------------------------------------
	if ( dayNumberManipulate3 > 9 ) then

		dateMainDate3.text = dayNumberManipulate3
		dateMainDate3MainScreen.text = dayNumberManipulate3

	elseif ( dayNumberManipulate3 <= 9 ) then

		dateMainDate3.text = "0" .. dayNumberManipulate3
		dateMainDate3MainScreen.text = "0" .. dayNumberManipulate3
	end
	--------------------------------------------------------------------
	if ( dayNumberManipulate4 > 9 ) then

		dateMainDate4.text = dayNumberManipulate4
		dateMainDate4MainScreen.text = dayNumberManipulate4

	elseif ( dayNumberManipulate4 <= 9 ) then

		dateMainDate4.text = "0" .. dayNumberManipulate4
		dateMainDate4MainScreen.text = "0" .. dayNumberManipulate4
	end

	----------------------------------------------------------------------

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

	if ( specifiedTask == "Book Essay") then

		table.remove(t, 1 )
		todayTask = t[1]

		if ( t[1] == nil) then

			todayTaskText.text = "Completed!"
			tasksDisplayHideButtonClicked()

		elseif ( t[1] ~= nil) then

			todayTaskText.text = "Today: " .. todayTask
		end

	    print("*** Today's task =", todayTask) 

	    bookEssayTaskNumber = table.maxn( t )

		dailyWorkloadCalculation( )

        if ( t[1] ~= nil ) then 

            toDo1.text = "Today: " .. t[1]
        end
        if ( t[1] == nil ) then 

            toDo1.text = ""
        end

        if ( t[2] ~= nil ) then 

            toDo2.text = "Next: " .. t[2]
        end
        if ( t[2] == nil ) then 

            toDo2.text = ""
        end

        if ( t[3] ~= nil ) then 

            toDo3.text = t[3]
        end
        if ( t[3] == nil ) then 

            toDo3.text = ""
        end

        if ( t[4] ~= nil ) then 

            toDo4.text = t[4]
        end
        if ( t[4] == nil ) then 

            toDo4.text = ""
        end

        if ( t[5] ~= nil ) then 

            toDo5.text = t[5]
        end
        if ( t[5] == nil ) then 

            toDo5.text = ""
        end
         
        if ( t[6] ~= nil ) then 

            toDo6.text = t[6]
        end
        if ( t[6] == nil ) then 

            toDo6.text = ""
        end
	end
end 