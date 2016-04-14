
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

-- Use widget library
local backgroundColours = require( "_Background colours" )

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
additionalTasks = ""

customNameTextField = ""

dailyEndTime = ""
now = os.time()

-- The number of days from today until the due date
timeSpan = 1

-- Create a variable that prevents the daily workload from repeating
callCheck = ""
currentStep = "0"

---------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------

local background

local okayButton
local checkButton
local addButton
local helpButton
local todayButton

local timeSpanDays = timeSpan

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

-- *************************************
-- Create a function that moves onto the next task since the current one is completed.
local function checkButtonClicked( ) 

    -- The number of steps divided by how much time you have to complete it
    dailyWorkLoad = bookEssayTaskNumber/timeSpanDays

    -- This is the number that remains constant 
    dailyWorkLoadValue = dailyWorkLoad

     print("*** Daily work load =", dailyWorkLoad)

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

local function nextBookEssayTaskNumber( ) 

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
-----------------------------------------------------------------------------------------

-- Prep for next timer
local function timerSetUp( ) 

  -- Reset the visual timer
  dailyEndTime = 5
  displayDailyTime.text = dailyEndTime

  -- Initial time
  dailyStartTime = os.time()
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Increase workload each finished day
local function increaseDailyWorkload( ) 

  dailyWorkLoad = dailyWorkLoad + dailyWorkLoadValue
  print("*** Daily workload =", dailyWorkLoad)
end 

-----------------------------------------------------------------------------------------
-- BOOK ESSAY WORKLOADs
-----------------------------------------------------------------------------------------

local function bookEssay2( ) 

  callCheck = "0.9-1.9"
  currentStep = "2"
                 
  -- Everytime this function repeats, now is always 1 second later
  now = os.time()

  -- Display text showing the countdown to the dailyEndTime
  displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

    if ( now > dailyStartTime + dailyEndTime ) then
        
       -- Remove this event listener so that the function does not repeat 
       Runtime:removeEventListener( "enterFrame", checkDailyTime2 )

       timeSpanDays = timeSpanDays - 1

       timerSetUp( ) 
       increaseDailyWorkload( )
       nextBookEssayTaskNumber( )
    end
end 

-----------------------------------------------------------------------------------------

local function bookEssay3( ) 

  callCheck = "1.9-2.9"
  currentStep = "3"

print("********************************")

   -- Everytime this function repeats, now is always 1 second later
   now = os.time()
    
   -- Display text showing the countdown to the dailyEndTime
   displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

    if ( now > dailyStartTime + dailyEndTime ) then

        print("*** BETWEEN 1.9 AND 2.9!!!")

       -- Remove this event listener so that the function does not repeat 
       Runtime:removeEventListener( "enterFrame", checkDailyTime3 )

       timeSpanDays = timeSpanDays - 1

       timerSetUp( ) 
       increaseDailyWorkload( ) 
       nextBookEssayTaskNumber( )
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

        -- This is the number that remains constant 
        dailyWorkLoadValue = dailyWorkLoad

         print("*** Daily work load =", dailyWorkLoad)

    end
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create a function that is called when we are working with the book essay
local function bookEssayWorkload( ) 

  if ( timeSpan == 1 ) then

    todayTaskText.text = "Finish all" 

  else 

      -- If the workload is between 0 and 0.9
      if  ( (dailyWorkLoad > 0) and (dailyWorkLoad < 0.9) ) then

          -- The call between 0 and 0.9 for the daily workload
          callCheck = "0-0.9"
          currentStep = "1"

          timeSpanDays = timeSpanDays - 1

          print("*** Workload between 0 and 0.9")

---------------------------------------------------------------------------------------------------------

          -- Separating from the timer so that this variable can have a delay with the present time so
          -- that the calculation can be possible instead of zero.
          dailyStartTime = os.time()

          -- Create countdown function for one day
          local function checkDailyTime( event )
              
             now = os.time()
             -- Number of seconds in one day
             dailyEndTime = 5
          
             -- Display text showing the countdown to the dailyEndTime
             displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

              if ( now > (dailyStartTime + dailyEndTime) ) then

                 -- Remove this event listener so that the function does not repeat itself
                 Runtime:removeEventListener( "enterFrame", checkDailyTime )

                -- Change the text to notify when the timer is done
                 displayDailyTime.text = ( "!!!" )  
                 print("*** Daily time =", displayDailyTime.text)

                 timerSetUp( ) 
                 increaseDailyWorkload( ) 
                 nextBookEssayTaskNumber( )  

              end
          end

          -- Call the checkDailyTime every second
          Runtime:addEventListener( "enterFrame", checkDailyTime )

      end

      -------------------------------------------------------------------------------------------------

          -- Create countdown function for one day
          local function checkDailyTimeWithoutNewTask( event )
              
          -- This prevents the daily task from progressing on the same day 
          if ( callCheck == "0-0.9" ) then

             now = os.time()
             -- Number of seconds in one day
             dailyEndTime = 5
          
             -- Display text showing the countdown to the dailyEndTime
             displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

              if ( now > (dailyStartTime + dailyEndTime) ) then

                 -- Remove this event listener so that the function does not repeat itself
                 Runtime:removeEventListener( "enterFrame", checkDailyTimeWithoutNewTask )

                -- Change the text to notify when the timer is done
                 displayDailyTime.text = ( "!!!" )  
                 print("*** Daily time =", displayDailyTime.text)

                 timerSetUp( ) 
                 increaseDailyWorkload( ) 

              end
          end
      end

          -- Call the checkDailyTime every second
          Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask )

  ----------------------------------------------------------------------------------------------------------   

      timerSetUp( )

      local function checkDailyTime2( event )

        if ( (dailyWorkLoad > 0.9) and (dailyWorkLoad < 1.9) ) then

            if ( currentStep == "0" ) then

              dailyEndTime = 0 
              additionalTasksText.text = "+ Research book"

              -- Work for step 0
              bookEssay2( )
              -- Work for step 1
              bookEssay2( )

            elseif ( currentStep == "1" ) then

              additionalTasksText.text = ""
              bookEssay2( )
            end
         end
      end

        -- Call the function checkDailyTime2 every second
        Runtime:addEventListener( "enterFrame", checkDailyTime2 )

      -------------------------------------------------------------------------------------------------

      -- Create countdown function for one day
      local function checkDailyTimeWithoutNewTask2( event )
          
          -- This prevents the daily task from progressing on the same day 
          if ( callCheck == "0.9-1.9" ) then

             now = os.time()
             -- Number of seconds in one day
             dailyEndTime = 5
          
             -- Display text showing the countdown to the dailyEndTime
             displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

              if ( now > (dailyStartTime + dailyEndTime) ) then

                 -- Remove this event listener so that the function does not repeat itself
                 Runtime:removeEventListener( "enterFrame", checkDailyTimeWithoutNewTask2 )

                -- Change the text to notify when the timer is done
                 displayDailyTime.text = ( "!!!" )  
                 print("*** Daily time =", displayDailyTime.text)

                 timerSetUp( ) 
                 increaseDailyWorkload( ) 

                 -- Check if this function needs to be called again
                 if ( (dailyWorkLoad > 0.9) and (dailyWorkLoad < 1.9) ) then

                      Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask2 )
                 end

              end
          end
      end

          -- Call the checkDailyTime every second
          Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask2 )

  -----------------------------------------------------------------------------------------

      local function checkDailyTime3( event )

          if ( (dailyWorkLoad > 1.9) and (dailyWorkLoad < 2.9) ) then

              additionalTasksText.text = ""

                if ( currentStep == "0" ) then

              elseif ( currentStep == "1" ) then

              elseif ( currentStep == "2" ) then

                bookEssay3( ) 

              end
          end
      end

       -- Call the function checkDailyTime3 every second
      Runtime:addEventListener( "enterFrame", checkDailyTime3 )

      -------------------------------------------------------------------------------------------------

      -- Create countdown function for one day
      local function checkDailyTimeWithoutNewTask3( event )

          -- This prevents the daily task from progressing on the same day 
          if ( callCheck == "1.9-2.9" ) then
              
             now = os.time()
             
             -- Number of seconds in one day
             dailyEndTime = 5
          
             -- Display text showing the countdown to the dailyEndTime
             displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

              if ( now > (dailyStartTime + dailyEndTime) ) then

                 -- Remove this event listener so that the function does not repeat itself
                 Runtime:removeEventListener( "enterFrame", checkDailyTimeWithoutNewTask3 )

                -- Change the text to notify when the timer is done
                 displayDailyTime.text = ( "!!!" )  
                 --print("*** Daily time =", displayDailyTime.text)
                 print("--------------------------------------------")

                 timerSetUp( ) 
                 increaseDailyWorkload( ) 

                 -- Check if this function needs to be called again
                 if ( (dailyWorkLoad > 1.9) and (dailyWorkLoad < 2.9) ) then

                      Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask3 )
                 end

              end
          end 
      end

      -- Call the checkDailyTime every second
      Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask3 )

  -----------------------------------------------------------------------------------------
   
      local function checkDailyTime4( event )

          if ( (dailyWorkLoad > 2.9) and (dailyWorkLoad < 3.9) ) then

              callCheck = "2.9-3.9"

             -- Everytime this function repeats, now is always 1 second later
             now = os.time()
              
             -- Display text showing the countdown to the dailyEndTime
             displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

              if ( now > dailyStartTime + dailyEndTime ) then

                  print("*** BETWEEN 2.9 AND 3.9!!!")

                 -- Remove this event listener so that the function does not repeat 
                 Runtime:removeEventListener( "enterFrame", checkDailyTime4 )

                 timeSpanDays = timeSpanDays - 1

                 timerSetUp( ) 
                 increaseDailyWorkload( ) 
                 nextBookEssayTaskNumber( )

              end
          end
      end

       -- Call the function checkDailyTime4 every second
      Runtime:addEventListener( "enterFrame", checkDailyTime4 )

      -------------------------------------------------------------------------------------------------

      -- Create countdown function for one day
      local function checkDailyTimeWithoutNewTask4( event )

          -- This prevents the daily task from progressing on the same day 
          if ( callCheck == "2.9-3.9" ) then

              now = os.time()

              -- Number of seconds in one day
              dailyEndTime = 5
      
             -- Display text showing the countdown to the dailyEndTime
             displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

              if ( now > (dailyStartTime + dailyEndTime) ) then

                 -- Remove this event listener so that the function does not repeat itself
                 Runtime:removeEventListener( "enterFrame", checkDailyTimeWithoutNewTask4 )

                -- Change the text to notify when the timer is done
                 displayDailyTime.text = ( "!!!" )  
                 print("*** Daily time =", displayDailyTime.text)

                 timerSetUp( ) 
                 increaseDailyWorkload( ) 

                 -- Check if this function needs to be called again
                 if ( (dailyWorkLoad > 2.9) and (dailyWorkLoad < 3.9) ) then

                      Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask4 )
                 end

              end
          end
      end

      -- Call the checkDailyTime every second
      Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask4 )

  -----------------------------------------------------------------------------------------

      local function checkDailyTime5( event )

         if ( (dailyWorkLoad > 3.9) and (dailyWorkLoad < 4.9) ) then

              callCheck = "3.9-4.9"

             -- Everytime this function repeats, now is always 1 second later
             now = os.time()
              
             -- Display text showing the countdown to the dailyEndTime
             displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

              if ( now > dailyStartTime + dailyEndTime ) then

                  print("*** BETWEEN 3.9 AND 4.9!!!")

                 -- Remove this event listener so that the function does not repeat 
                 Runtime:removeEventListener( "enterFrame", checkDailyTime5 )

                  timeSpanDays = timeSpanDays - 1
                  print ("*** TIME SPAN =", timeSpanDays)

                  timerSetUp( ) 
                 increaseDailyWorkload( ) 
                 nextBookEssayTaskNumber( )

              end
          end
      end 

       -- Call the function checkDailyTime5 every second
      Runtime:addEventListener( "enterFrame", checkDailyTime5 )

      -------------------------------------------------------------------------------------------------

      -- Create countdown function for one day
      local function checkDailyTimeWithoutNewTask5( event )

          -- This prevents the daily task from progressing on the same day 
          if ( callCheck == "3.9-4.9" ) then
              
             now = os.time()
             -- Number of seconds in one day
             dailyEndTime = 5
          
             -- Display text showing the countdown to the dailyEndTime
             displayDailyTime.text = dailyEndTime - ( now - dailyStartTime )

              if ( now > (dailyStartTime + dailyEndTime) ) then

                 -- Remove this event listener so that the function does not repeat itself
                 Runtime:removeEventListener( "enterFrame", checkDailyTimeWithoutNewTask5 )

                -- Change the text to notify when the timer is done
                 displayDailyTime.text = ( "!!!" )  
                 print("*** Daily time =", displayDailyTime.text)

                 timerSetUp( ) 
                 increaseDailyWorkload( ) 

                 -- Check if this function needs to be called again
                 if ( (dailyWorkLoad > 3.9) and (dailyWorkLoad < 4.9) ) then

                      Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask5 )
                 end
              end
          end
      end

          -- Call the checkDailyTime every second
          Runtime:addEventListener( "enterFrame", checkDailyTimeWithoutNewTask5 )
    end
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- Create button on the today text that takes the user to the task_details screen
local function moreButtonClicked( ) 

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

    -- The countdown text that represents one day in seconds
    displayDailyTime = display.newText( dailyEndTime, display.contentWidth/1.10, 1140, "Helvetica", 60 )
    displayDailyTime:setTextColor(60/255, 50/255, 100/255)

    -- Additional tasks in one day
    additionalTasksText = display.newText( additionalTasks, display.contentWidth/1.6, -25, "Arial", 53 )
    additionalTasksText:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( addText )
    sceneGroup:insert( helpText )
    sceneGroup:insert( customNameTextDisplay )
    sceneGroup:insert( typeOptionTextDisplay )
    sceneGroup:insert( classOptionTextDisplay )
    sceneGroup:insert( todayTaskText )
    sceneGroup:insert( displayDailyTime )
    sceneGroup:insert( additionalTasksText )

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

            width = 110,
            height = 100,

            id = "editButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.175,
            y = 160,

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

    --------------------------------------------------------------------------------

    -- Creating a more button
    moreButton = widget.newButton( 
        {   

            width = 110,
            height = 100,

            id = "moreButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.175,
            y = display.contentHeight/20,

            -- Insert the images here
            defaultFile = "Images/more.png",
            overFile = "Images/morePressed.png",

            -- When the button is released, call the more button function
            onRelease = moreButtonClicked       
        } )

    moreButton.alpha = 0.6

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
    sceneGroup:insert( moreButton )

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

    timeSpan = daysBetweenTodayAndDue
    print("*** Time span =", timeSpan)

    -----------------------------------------------------------------------------------------   

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
        
        dailyWorkloadCalculation( ) 

    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then 

      -- If we are working with the book essay
      if (typeOption == "Book Essay") then    

          bookEssayWorkload( )
      end 

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