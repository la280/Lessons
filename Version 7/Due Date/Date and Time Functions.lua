
-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "due_date_functions"


-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------


-- From today until due date
function daysCalculator( )

    if ( specifiedTask == "Book Essay" ) then

        if (dayNumber == "") then

            daysBetweenTodayAndDue = ""

        elseif (dayNumber ~= "") then 
            
            daysBetweenTodayAndDue = (dayNumber - (os.date("%d"))) + daysFromThisMonth - daysFromOurMonth

            A = daysBetweenTodayAndDue
        end

        -- Since in the year 2016, we are finished with these months
        if (monthName == "January") then

            monthName = "Invalid year"

        elseif (monthName == "February") then

            monthName = "Invalid year"

        elseif (monthName == "March") then

            monthName = "Invalid year"
        end
    end

    ---------------------------------------------

    if ( specifiedTask2 == "Option2" ) then

        if (dayNumber == "") then

            daysBetweenTodayAndDue2 = ""

        elseif (dayNumber ~= "") then 
            
            daysBetweenTodayAndDue2 = (dayNumber - (os.date("%d"))) + daysFromThisMonth - daysFromOurMonth

            B = daysBetweenTodayAndDue2
        end

        -- Since in the year 2016, we are finished with these months
        if (monthName == "January") then

            monthName = "Invalid year"

        elseif (monthName == "February") then

            monthName = "Invalid year"

        elseif (monthName == "March") then

            monthName = "Invalid year"
        end
    end
end