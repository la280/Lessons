
-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "due_date_functions"


-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------

-- From today until due date
function daysCalculator( )

    if (dayNumber == "") then

        daysBetweenTodayAndDue = ""

    elseif (dayNumber ~= "") then 
        
        daysBetweenTodayAndDue = (dayNumber - (os.date("%d"))) + daysFromThisMonth - daysFromOurMonth

        A = daysBetweenTodayAndDue

        print("**** ", A)
    end

    -- Since in the year 2016, we are finished with these months
    if (monthName == "January") then

        monthName = "Invalid year"

    elseif (monthName == "February") then

        monthName = "Invalid year"

    elseif (monthName == "March") then

        monthName = "Invalid year"

    elseif (monthName == "April") then

        monthName = "Invalid year"
    end
end