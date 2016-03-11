
-- Version 2 : Smart Agenda
-- File : main_menu.lua
-- Created by Laura Aubin
-- Created on January 08, 2016
-- Description: Main menu for app

---------------------------------------------------------------------------------------------------------
-- MAIN_MENU
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "main_menu"

-- Create the scene object
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
---------------------------------------------------------------------------------------------------------

customName = ""
typeOption = ""
classOption = ""
todayTask = ""

customNameTextField = ""

dailyEndTime = ""
now = os.time()

-- The number of days from today until the due date
-- *** Temporarily set to 8 days
timeSpan = 8


-----------------------------------------------------------------------------------------
-- DATE AND TIME
-----------------------------------------------------------------------------------------


    -- Number of seconds since January 1st, 1970
    -- now = os.time()

    -- -- Constant time values (in seconds)
    -- -- 60s * 60h * 24h * 7d
    -- MINUTE = 60
    -- HOUR = 3600 
    -- DAY = 86400
    -- WEEK = 604800

    -- -- The number of seconds in a year : 60s * 60min * 24h * 365days
    -- NUM_SECONDS_YEAR = (60 * 60 * 24 * 365)
    -- -- The number of seconds in a day
    -- NUM_SECONDS_DAY = (60 * 60 * 24)



    -- -- The weekday
    -- --print("*** Today =", os.date("%A") ) 

    -- -- Formatted for the year - month - day, hour : minute : seconds
    -- --print( os.date("*** Timestamp = %Y-%m-%dT%X%z") )

    -- print( os.date("*** Timestamp = %A, %m %d, %Y"))

    -- -- Since January 1st, 1970 : number of seconds in a day * days in 46 years
    -- secondsSince1970 = ((60 * 60 * 24) * (365.25 * 46))
    -- print("*** Number of seconds in 46 years =", secondsSince1970)

    -- -- Number of seconds in a day * 49 days since January 1st
    -- secondsSinceJan = ((60 * 60 * 24) * 49)
    -- print("*** Number of seconds since January 1st =", secondsSinceJan)

    -- print("*** BF time =", (NUM_SECONDS_YEAR * 46) + (NUM_SECONDS_DAY * 32))
    -- print("*** CO time =", secondsSince1970 + secondsSinceJan + (HOUR * 13) + (MINUTE * 51))
    -- print("*** OS time =", os.time())

    -- -- The time within this year
    -- print("*** CA time =",  os.time() - (NUM_SECONDS_YEAR * 45))

    -- ---------------------------------------------------------------------------------------------------------

    -- -- The number of years since January 1st, 1970
    -- yearsSince = os.time() / NUM_SECONDS_YEAR
    -- print("*** Years since =", yearsSince)

    -- thisYear = yearsSince + 1970
    -- print("*** This year =", thisYear)

    -- ---------------------------------------------------------------------------------------------------------

    -- -- The time within this year
    -- timeWithinYear = os.time() - (NUM_SECONDS_YEAR * 45)

    -- thisDay = timeWithinYear / (60 * 60 * 24)

    -- print("*** Days since =", thisDay)


    -- -- The number of days since January 1st, 1970
    -- daysSince = os.time() / NUM_SECONDS_DAY
    -- print("*** Days since =", daysSince)

    -- thisDay = daysSince / 365

    -- print("*** This day =", thisDay)

    -- -- Number of days in all months since January 1st
    -- -- +1 since today is not considered a full day 
    -- -- -31 days in January
    -- print("*** This day =", (thisDay + 1) - 31)

    -- if ("%m" == "01") then
    --     print ("*** Month one")
    -- elseif ("%m" == "02") then
    --     print ("*** Month two")
    -- end

    ---------------------------------------------------------------------------------------------------------

    -- The number of months since January 1st, 1970

    -- 31 days in January
    -- if (thisDay < 31) then
    --     print ("*** This month is January")

    -- -- Between 31 days in January and up to 60 (31 + 29 days in February)
    -- --elseif (31 < thisDay < 60) then
    -- elseif (thisDay > 31) then
    --     print ("*** This month is February")
    -- end

---------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------

local background

local okayButton
local checkButton
local addButton
local helpButton
local blackDotButton
local whiteDotButton
local blueDotButton
local greenDotButton
local purpleDotButton
local redDotButton
local todayButton


-----------------------------------------------------------------------------------------
-- TRANSITION BUTTON FUNCTIONS
-----------------------------------------------------------------------------------------

-- When the add button is clicked, call this function
local function addButtonClicked( )

    print("*** Add button clicked")

    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})
end  

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create transition function to help screen
local function helpButtonClicked( )

    composer.gotoScene( "help_screen", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create transition function to add screen by the edit button
local function editButtonClicked( )

    if (customName == "") then

        popupText.isVisible = true
        popupBackground.isVisible = true
        baseBackground.isVisible = true

        okayButton.isVisible = true
        okayButton:toFront()

    else 

        composer.gotoScene( "add_screen", {effect = "flipFadeOutIn", time = 500})
    end
end

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create transition function to close the popup menu
local function okayButtonClicked( ) 

    print("*** Okay button clicked")

    baseBackground.isVisible = false
    popupBackground.isVisible = false
    popupText.isVisible = false
    okayButton.isVisible = false

    showTasksButton.isVisible = true
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create background colour change function - black
local function blackButtonClicked( ) 

    display.setDefault("background", 30/255, 30/255, 30/255)
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create background colour change function - white
local function whiteButtonClicked( ) 

    display.setDefault("background", 250/255, 250/255, 250/255)
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create background colour change function - blue
local function blueButtonClicked( ) 

    display.setDefault("background", 35/255, 115/255, 230/255)
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create background colour change function - green
local function greenButtonClicked( ) 

    display.setDefault("background", 35/255, 230/255, 90/255)
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create background colour change function - purple
local function purpleButtonClicked( ) 

    display.setDefault("background", 150/255, 65/255, 230/255)
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create background colour change function - red
local function redButtonClicked( ) 

    display.setDefault("background", 230/255, 30/255, 35/255)
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create a function that moves onto the next task since the current one is completed.
local function checkButtonClicked( ) 

    if (bookEssayTaskNumber == "5") then

        -- The next task
        bookEssayTaskNumber = "4"
        todayTask = "Review essay's"

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)
        print("*** Today's task =", todayTask)

    elseif (bookEssayTaskNumber == "4") then
        
        -- The next task
        bookEssayTaskNumber = "3"
        todayTask = "Rough draft" 

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)
        print("*** Today's task =", todayTask)

    elseif (bookEssayTaskNumber == "3") then
        
        -- The next task
        bookEssayTaskNumber = "2"
        todayTask = "Edit draft" 

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)
        print("*** Today's task =", todayTask)

    elseif (bookEssayTaskNumber == "2") then
        
        -- The next task
        bookEssayTaskNumber = "1"
        todayTask = "Final draft" 

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)
        print("*** Today's task =", todayTask)

    elseif (bookEssayTaskNumber == "1") then
        
        -- The next task
        bookEssayTaskNumber = "0"
        todayTask = "Completed!" 

        todayTaskText.text = todayTask

        print("*** Book essay task number =", bookEssayTaskNumber)
        print("*** Today's task =", todayTask)

    elseif (bookEssayTaskNumber == "0") then
        
        -- No more tasks
        todayTask = "Completed!" 

        todayTaskText.text = todayTask

        print("*** Today's task =", todayTask)

    end
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
 
-- Create function that displays all the current task items
local function tabButtonClicked( ) 

    print("*** Tab button clicked")

    -- Popup background that covers everything else in the scene
    baseBackground = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight * 2)
    baseBackground.x = display.contentWidth/2
    baseBackground.y = display.contentHeight/2

    -- Set transparency of the background
    baseBackground.alpha = 0.4

    -- Popup box image
    popupBackground = display.newImageRect("Images/Popup/PopupBackground.png", 600, 670)
    popupBackground.x = display.contentWidth/2
    popupBackground.y = display.contentHeight/2.9

    -- Set transparency of the popup background
    popupBackground.alpha = 0.8

        if (typeOption == "Book Essay") then

            -- Overlay text
            popupText = display.newText ( "              All Tasks: \n\n 1:  Read and research \n            your book \n 2:   Review your essay \n 3:   Write a rough draft \n 4:      Edit your draft \n 5:  Write your final draft", display.contentWidth/2, display.contentHeight/3.6, "Arial", 53)
            popupText:setTextColor(10/255, 20/255, 10/255)

            showTasksButton.isVisible = false

        end

        okayButton.isVisible = true
        okayButton:toFront()
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- *** Only temporary while daily timer does not work correctly
-- Create a refresh button on the home screen
local function refreshButton( ) 

    if (displayDailyTime.text == ( "!!!" )) then

        print("*** Daily time =", displayDailyTime.text)

    elseif (displayDailyTime.text == ( "" )) then

        print("*** No daily time.")
    end
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create a daily workload calculator
local function dailyWorkloadCalculation( ) 

    -- If we are working with the book essay
    if (bookEssayTaskNumber == "5") then

        -- The number of steps divided by how much time you have to complete it
        dailyWorkLoad = bookEssayTaskNumber/timeSpan

         print("*** Daily work load =", dailyWorkLoad)

    end
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create a function that is called when we are working with the book essay
local function bookEssayWorkload( ) 

    -- If the workload is between 0 and 0.9
    if  ( (dailyWorkLoad > 0) and (dailyWorkLoad < 0.9) ) then

        print("*** Workload between 0 and 0.9")

---------------------------------------------------------------------------------------------------------

        -- Separating from the timer so that this variable can have a delay with the present time so
        -- that the calculation can be possible instead of zero.
        dailyStartTime = os.time()

        -- Create countdown function for one day
        local function checkDailyTime( event )
            
           now = os.time()
           dailyEndTime = 4
            
           -- Display text showing the countdown to the dailyEndTime
           displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

            if ( now > (dailyStartTime + dailyEndTime) ) then

               -- Remove this event listener so that the function does not repeat 
               Runtime:removeEventListener( "enterFrame", checkDailyTime )

              -- Change the text to notify when the timer is done
               displayDailyTime.text = ( "!!!" )  
               print("*** Daily time =", displayDailyTime.text)

               -- After one day is finished,
               dailyWorkLoad = dailyWorkLoad + 1
               print("*** Daily workload =", dailyWorkLoad)

-----------------------------------------------------------------------------------------------------

                    if (bookEssayTaskNumber == "5") then

                        -- The next task
                        bookEssayTaskNumber = "4"
                        todayTask = "Review essay's"

                        todayTaskText.text = todayTask

                        print("*** Book essay task number =", bookEssayTaskNumber)
                       -- print("*** Today's task =", todayTask)

-----------------------------------------------------------------------------------------------------

                    elseif (bookEssayTaskNumber == "4") then
            
                        -- The next task
                        bookEssayTaskNumber = "3"
                        todayTask = "Rough draft" 

                        todayTaskText.text = todayTask

                        print("*** Book essay task number =", bookEssayTaskNumber)
                        --print("*** Today's task =", todayTask)

                    elseif (bookEssayTaskNumber == "3") then
                        
                        -- The next task
                        bookEssayTaskNumber = "2"
                        todayTask = "Edit draft" 

                        todayTaskText.text = todayTask

                        print("*** Book essay task number =", bookEssayTaskNumber)
                        --print("*** Today's task =", todayTask)

                    elseif (bookEssayTaskNumber == "2") then
                        
                        -- The next task
                        bookEssayTaskNumber = "1"
                        todayTask = "Final draft" 

                        todayTaskText.text = todayTask

                        print("*** Book essay task number =", bookEssayTaskNumber)
                        --print("*** Today's task =", todayTask)

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

                    end -- Closes elseif statement

-------------------------------------------------------------------------------------------
       
            end  -- Closes time check

        end -- Closes function

        -- Call the checkDailyTime every second
        Runtime:addEventListener( "enterFrame", checkDailyTime )

    end -- Closes workload

-----------------------------------------------------------------------------------------   

    local function checkDailyTime2( event )

        if ( (dailyWorkLoad > 0.9) and (dailyWorkLoad < 1.9) ) then

             print("*** Workload between 0.9 and 1.9")

           now = os.time()
           dailyEndTime = 4
            
           -- Display text showing the countdown to the dailyEndTime
           displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

                if ( now > dailyStartTime + dailyEndTime ) then

                   -- Remove this event listener so that the function does not repeat 
                   Runtime:removeEventListener( "enterFrame", checkDailyTime2 )

                  -- Change the text to notify when the timer is done
                   displayDailyTime.text = ( "!!!" )  
                   print("*** Daily time =", displayDailyTime.text)

                   -- After one day is finished,
                   dailyWorkLoad = dailyWorkLoad + 1
                   print("*** Daily workload =", dailyWorkLoad)

---------------------------------------------------------------------------------------------------------

                        if (bookEssayTaskNumber == "5") then

                            -- The next task
                            bookEssayTaskNumber = "4"
                            todayTask = "Review essay's"

                            todayTaskText.text = todayTask

                            print("*** Book essay task number =", bookEssayTaskNumber)
                           -- print("*** Today's task =", todayTask)

        -----------------------------------------------------------------------------------------------

                        elseif (bookEssayTaskNumber == "4") then
                
                            -- The next task
                            bookEssayTaskNumber = "3"
                            todayTask = "Rough draft" 

                            todayTaskText.text = todayTask

                            print("*** Book essay task number =", bookEssayTaskNumber)
                            --print("*** Today's task =", todayTask)

                        elseif (bookEssayTaskNumber == "3") then
                            
                            -- The next task
                            bookEssayTaskNumber = "2"
                            todayTask = "Edit draft" 

                            todayTaskText.text = todayTask

                            print("*** Book essay task number =", bookEssayTaskNumber)
                            --print("*** Today's task =", todayTask)

                        elseif (bookEssayTaskNumber == "2") then
                            
                            -- The next task
                            bookEssayTaskNumber = "1"
                            todayTask = "Final draft" 

                            todayTaskText.text = todayTask

                            print("*** Book essay task number =", bookEssayTaskNumber)
                            --print("*** Today's task =", todayTask)

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

                        end -- Closes this elseif

-----------------------------------------------------------------------------------------------------
            
                end -- Closes timecheck

        end -- Closes workload
      
    end -- Closes function  

     -- Call the function checkDailyTime2 every second
     Runtime:addEventListener( "enterFrame", checkDailyTime2 )

         -----------------------------------------------------------------------------------------

    --         -- If the workload is between 1.9 and 2.9    
    --         elseif ( (dailyWorkLoad > 1.9) and (dailyWorkLoad < 2.9) ) then

    --             print("*** Workload between 1.9 and 2.9")

    -- -----------------------------------------------------------------------------------------

    --         -- If the workload is between 2.9 and 3.9    
    --         elseif ( (dailyWorkLoad > 2.9) and (dailyWorkLoad < 3.9) ) then

    --             print("*** Workload between 2.9 and 3.9")

    -- -----------------------------------------------------------------------------------------

    --         -- If the workload is between 3.9 and 4.9    
    --         elseif ( (dailyWorkLoad > 3.9) and (dailyWorkLoad < 4.9) ) then

    --             print("*** Workload between 3.9 and 4.9")

    --         end
    --     end
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create button on the today text that takes the user to the task_details screen
local function todayButtonClicked( ) 

    composer.gotoScene( "task_details", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view


-----------------------------------------------------------------------------------------
-- Background & static objects
-----------------------------------------------------------------------------------------


    -- Set the background to be white
    display.setDefault("background", 255, 255, 255)

    background = display.newImage("Images/Screens/Home.png")

    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.width = display.contentWidth
    background.height = display.contentHeight*1.4

    -- Associate objects within this scene 
    sceneGroup:insert( background )

    -- Send the background image to the back layer so all other objects can be on top
    background:toBack()

------------------------------------------------------------------------------------------

    -- Buttton overlay text
    addText = display.newText ( "ADD", display.contentWidth/2, 420, "Arial", 60)
    addText:setTextColor(60/255, 50/255, 100/255)

    helpText = display.newText ( "HELP", display.contentWidth/2, 700, "Arial", 60)
    helpText:setTextColor(60/255, 50/255, 100/255)

    -- Input items from the add screen, displayed on the main screen
    customNameTextDisplay = display.newText (customName, display.contentWidth/2.5, 35, "Arial", 53)
    customNameTextDisplay:setTextColor(60/255, 50/255, 100/255)

    typeOptionTextDisplay = display.newText (typeOption, display.contentWidth/2.5, 110, "Arial", 53)
    typeOptionTextDisplay:setTextColor(60/255, 50/255, 100/255)

    classOptionTextDisplay = display.newText (classOption, display.contentWidth/2.5, 190, "Arial", 53)
    classOptionTextDisplay:setTextColor(60/255, 50/255, 100/255)

    -- Today's task 
    todayTaskText = display.newText (todayTask, display.contentWidth/1.58, -75, "Verdana", 54)
    todayTaskText:setTextColor(60/255, 50/255, 100/255)

    displayDailyTime = display.newText( dailyEndTime, display.contentWidth/1.17, 170, "Helvetica", 60 )
    displayDailyTime:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( addText )
    sceneGroup:insert( helpText )
    sceneGroup:insert( customNameTextDisplay )
    sceneGroup:insert( typeOptionTextDisplay )
    sceneGroup:insert( classOptionTextDisplay )
    sceneGroup:insert( todayTaskText )
    sceneGroup:insert( displayDailyTime )

------------------------------------------------------------------------------------------

    -- Popup background that covers everything else in the scene
    baseBackground = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight * 2)
    baseBackground.x = display.contentWidth/2
    baseBackground.y = display.contentHeight/2

    -- Set transparency of the background
    baseBackground.alpha = 0.4
    baseBackground.isVisible = false

    -- Popup box image
    popupBackground = display.newImageRect("Images/Popup/PopupBackground.png", 600, 320)
    popupBackground.x = display.contentWidth/2
    popupBackground.y = display.contentHeight/2

    -- Set transparency of the popup background
    popupBackground.alpha = 0.7
    popupBackground.isVisible = false

    -- Overlay text
    popupText = display.newText ( " This task has not yet \n       been created.", display.contentWidth/2, display.contentHeight/2.3, "Arial", 53)
    popupText:setTextColor(10/255, 20/255, 10/255)

    popupText.isVisible = false


-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


    -- Creating an add button
    addButton = widget.newButton( 
        {   

            width = 670,
            height = 170,

            id = "addButton",
            --label = "Add",

            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight/2.45,

            -- Insert the images here
            defaultFile = "Images/blue.png",
            overFile = "Images/bluePressed.png",

            -- When the button is released, call the add screen transition function
            onRelease = addButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating a help button
    helpButton = widget.newButton( 
        {   

            width = 670,
            height = 173,

            id = "helpButton",
            --label = "Add",

            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight/1.45,

            -- Insert the images here
            defaultFile = "Images/green.png",
            overFile = "Images/greenPressed.png",

            -- When the button is released, call the help screen transition function
            onRelease = helpButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating an edit button
    editButton = widget.newButton( 
        {   

            width = 100,
            height = 100,

            id = "editButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.18,
            y = 40,

            -- Insert the images here
            defaultFile = "Images/Edit.png",
            overFile = "Images/EditPressed.png",

            -- When the button is released, call the edit screen transition function
            onRelease = editButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating a color change button - black
    blackDotButton = widget.newButton( 
        {   

            width = 50,
            height = 50,

            id = "blackDotButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.45,
            y = 1135,

            -- Insert the images here
            defaultFile = "Images/Colour dots/blackDot.png",
            overFile = "Images/Colour dots/blackDot.png",

            -- When the button is released, call this function
            onRelease = blackButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating a color change button - white
    whiteDotButton = widget.newButton( 
        {   

            width = 50,
            height = 50,

            id = "whiteDotButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.24,
            y = 1135,

            -- Insert the images here
            defaultFile = "Images/Colour dots/whiteDot.png",
            overFile = "Images/Colour dots/whiteDot.png",

            -- When the button is released, call this function
            onRelease = whiteButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating a color change button - blue
    blueDotButton = widget.newButton( 
        {   

            width = 50,
            height = 50,

            id = "blueDotButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.1,
            y = 1135,

            -- Insert the images here
            defaultFile = "Images/Colour dots/blueDot.png",
            overFile = "Images/Colour dots/blueDot.png",

            -- When the button is released, call this function
            onRelease = blueButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating a color change button - green
    greenDotButton = widget.newButton( 
        {   

            width = 50,
            height = 50,

            id = "greenDotButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.94,
            y = 1135,

            -- Insert the images here
            defaultFile = "Images/Colour dots/greenDot.png",
            overFile = "Images/Colour dots/greenDot.png",

            -- When the button is released, call this function
            onRelease = greenButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating a color change button - purple
    purpleDotButton = widget.newButton( 
        {   

            width = 50,
            height = 50,

            id = "purpleDotButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.8,
            y = 1135,

            -- Insert the images here
            defaultFile = "Images/Colour dots/purpleDot.png",
            overFile = "Images/Colour dots/purpleDot.png",

            -- When the button is released, call this function
            onRelease = purpleButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating a color change button - red
    redDotButton = widget.newButton( 
        {   

            width = 50,
            height = 50,

            id = "redDotButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.68,
            y = 1135,

            -- Insert the images here
            defaultFile = "Images/Colour dots/redDot.png",
            overFile = "Images/Colour dots/redDot.png",

            -- When the button is released, call this function
            onRelease = redButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating a checkbox button
    checkButton = widget.newButton( 
        {   

            width = 50,
            height = 50,

            id = "checkButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/10.5,
            y = -74,

            -- Insert the images here
            defaultFile = "Images/Check.png",
            overFile = "Images/CheckPressed.png",

            -- When the button is released, call this function
            onRelease = checkButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

    -- Create a show all tab button
    showTasksButton = widget.newButton( 
        {   

            width = 80,
            height = 80,

            id = "showTasksButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.11,
            y = -99,

            -- Insert the images here
            defaultFile = "Images/Tab.png",
            overFile = "Images/TabPressed.png",

            -- When the button is released, call this function
            onRelease = tabButtonClicked          
        } )

    showTasksButton.alpha = 0.7
    showTasksButton.isVisible = false

    --------------------------------------------------------------------------------

    -- Creating an okay button
    okayButton = widget.newButton( 
        {   

            width = 450,
            height = 120,

            id = "okayButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight/1.73,

            -- Insert the images here
            defaultFile = "Images/Popup/Okay.png",
            overFile = "Images/Popup/OkayPressed.png",

            -- When the button is released, call the okay button function
            onRelease = okayButtonClicked       
        } )

    -- Set transparency of the okay button
    okayButton.alpha = 0.9
    okayButton.isVisible = false
    okayButton:toFront()

    -----------------------------------------------------------------------------------------

    -- Create a button that takes the user to the task_details page
    todayButton = widget.newButton( 
        {   

            width = 179,
            height = 65,

            id = "todayButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4.2,
            y = -73,

            -- Insert the images here
            defaultFile = "Images/blue2.png",
            overFile = "Images/bluePressed.png",

            -- When the button is released, call this function
            onRelease = todayButtonClicked          
        } )

        todayButton.alpha = 0.2

    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( addButton )
    sceneGroup:insert( helpButton )
    sceneGroup:insert( editButton )
    sceneGroup:insert( blackDotButton )
    sceneGroup:insert( whiteDotButton )
    sceneGroup:insert( blueDotButton )
    sceneGroup:insert( greenDotButton )
    sceneGroup:insert( purpleDotButton )
    sceneGroup:insert( redDotButton )
    sceneGroup:insert( checkButton )
    sceneGroup:insert( showTasksButton )
    sceneGroup:insert( okayButton )
    sceneGroup:insert( todayButton )

    -- Bring the button text above everything else
    addText:toFront()
    helpText:toFront()
    okayButton:toFront()
end 


-----------------------------------------------------------------------------------------
-- Global scene function - show, hide, destroy
-----------------------------------------------------------------------------------------


-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    -- Update the display texts
    customNameTextDisplay.text = customName
    typeOptionTextDisplay.text = typeOption
    classOptionTextDisplay.text = classOption
    todayTaskText.text = todayTask

    -----------------------------------------------------------------------------------------   

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then

        print("*** REPEAT CHECK")
        
        dailyWorkloadCalculation( ) 

        -- If we are working with the book essay
        if (typeOption == "Book Essay") then    

            bookEssayWorkload( )
        end

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