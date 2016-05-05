
-- Version 2 : Smart Agenda
-- File : due_date.lua
-- Created by Laura Aubin
-- Created on February 2, 2016
-- Description: User specifies when the assignment is due.


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "due_date"

dueDateVariables = require( "Main Menu.variables" )


-- Create the scene object
local scene = composer.newScene( sceneName )


------------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
------------------------------------------------------------------------------------------


monthName = os.date("%B")
dayNumber = os.date("%d")

-- Number of days in each month
daysInThisMonth = 30
daysInJanuary = 31
daysInFebruary = 28
daysInMarch = 31
daysInApril = 30
daysInMay = 31
daysInJune = 30
daysInJuly = 31
daysInAugust = 31
daysInSeptember = 30
daysInOctober = 31
daysInNovember = 30
daysInDecember = 31

-- Number of days in each month since the beginning of the year
daysFromThisMonth = 0

daysFromJanuary = 31
daysFromFebruary = 59
daysFromMarch = 90
daysFromApril = 120
daysFromMay = 151
daysFromJune = 181
daysFromJuly = 212
daysFromAugust = 243
daysFromSeptember = 273
daysFromOctober = 404
daysFromNovember = 434
daysFromDecember = 465

daysFromOurMonth = daysFromApril


------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------


local background
local backButton
local blueBackground
local blueBackground2
local checkMarkEmpty
local checkMarkFull
local displayTime
local todayText
local todayWordText
local dueDateWordText
local dueDate
local year

local date

local todayNumber = os.date("%d")

local now = os.time()
local startTime = os.time()
local endTime = 154

dateAndTimeFunctions_ = require( "Due Date.Date and Time Functions" )


-----------------------------------------------------------------------------------------
-- Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    print("*** Back button clicked")
    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})
end  
 
-----------------------------------------------------------------------------------------

local function monthTextFieldListener(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        monthName = (event.text)

    end
end

-----------------------------------------------------------------------------------------

function dayNumberTextFieldListener(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        dayNumber = (event.text)

        -- When the textbox is being edited, call the calculation event listener
        Runtime:addEventListener( "enterFrame", daysCalculator )

        Runtime:addEventListener( "enterFrame", assigningValueToTime )
    end
end

-----------------------------------------------------------------------------------------

function assigningValueToTime()

    time = A
    Runtime:removeEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------------

local function monthNumber(Event)

    if (monthName == "January") then

        monthNumber = 1
        daysFromThisMonth = daysFromJanuary

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "February") then

        monthNumber = 2
        daysFromThisMonth = daysFromFebruary

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "March") then

        monthNumber = 3
        daysFromThisMonth = daysFromMarch

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "April") then

        monthNumber = 4
        daysFromThisMonth = daysFromApril

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "May") then

        monthNumber = 5
        daysFromThisMonth = daysFromMay

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "June") then

        monthNumber = 6
        daysFromThisMonth = daysFromJune

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "July") then

        monthNumber = 7
        daysFromThisMonth = daysFromJuly

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "August") then

        monthNumber = 8
        daysFromThisMonth = daysFromAugust

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "September") then

        monthNumber = 9
        daysFromThisMonth = daysFromSeptember

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "October") then

        monthNumber = 10
        daysFromThisMonth = daysFromOctober

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "November") then

        monthNumber = 11
        daysFromThisMonth = daysFromNovember

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    elseif (monthName == "December") then

        monthNumber = 12
        daysFromThisMonth = daysFromDecember

        checkMarkEmpty.isVisible = false
        checkMarkFull.isVisible = true

    else

        checkMarkEmpty.isVisible = true
        checkMarkFull.isVisible = false

    end
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


    -- Set the background color
    display.setDefault("background", 255/255, 255/255, 255/255)
        
    ---------------------------------------------------------------------------------------------------------

    todayWordText = display.newText ( "Today:", 160, 200, "Georgia", 80)
    todayWordText:setTextColor(60/255, 50/255, 100/255)

    dueDateWordText = display.newText ( "Due date:", 200, 470, "Georgia", 75)
    dueDateWordText:setTextColor(60/255, 50/255, 100/255)

    year = display.newText ( ", 2016", 610, 565, "Arial", 65)
    year:setTextColor(60/255, 50/255, 100/255)

    --monthFormat = display.newText ( "Months: full name and \n a captial in front \n ex, August", 330, 770, "Arial", 55)
    --monthFormat:setTextColor(60/255, 50/255, 100/255)

    blueBackground = display.newImageRect("Images/Popup/Popup-Background.png", display.contentWidth/1.02, display.contentHeight/4)
    blueBackground.x = display.contentWidth/2
    blueBackground.y = display.contentHeight/4.1
    blueBackground.alpha = 0.23

    blueBackground2 = display.newImageRect("Images/Popup/Popup-Background.png", display.contentWidth/1.02, display.contentHeight/4)
    blueBackground2.x = display.contentWidth/2
    blueBackground2.y = display.contentHeight/1.95
    blueBackground2.alpha = 0.23

    checkMarkEmpty = display.newImageRect("Images/greyCheckMark.png", 55, 70)
    checkMarkEmpty.x = display.contentWidth/16.5
    checkMarkEmpty.y = display.contentHeight/1.81
    checkMarkEmpty.isVisible = false

    checkMarkFull = display.newImageRect("Images/greenCheckMark.png", 55, 70)
    checkMarkFull.x = display.contentWidth/16.5
    checkMarkFull.y = display.contentHeight/1.81
    checkMarkFull.isVisible = false

    -- month number = %m
    todayText = display.newText ( os.date("%A, %B %d, %Y") , display.contentWidth/2, 300, "Arial", 55)
    todayText:setTextColor(60/255, 50/255, 100/255)

    displayTime = display.newText( endTime, display.contentWidth/1.28, 178, "Helvetica", 51 )
    displayTime:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( todayWordText )  
    sceneGroup:insert( dueDateWordText )
    sceneGroup:insert( todayText )
    sceneGroup:insert( year )
    sceneGroup:insert( blueBackground )
    sceneGroup:insert( blueBackground2 )
    sceneGroup:insert( checkMarkEmpty )
    sceneGroup:insert( checkMarkFull )
    sceneGroup:insert( displayTime )

    displayTime.isVisible = false


---------------------------------------------------------------------------------------------------------
-- Create countdown timer
---------------------------------------------------------------------------------------------------------


-- Create countdown function
local function checkTime( event )

   local now = os.time()
   -- Display text showing the countdown to the endTime
   displayTime.text = endTime - ( now - startTime )

   if ( now > startTime + endTime ) then
      -- Change the text to notify when the timer is done
       displayTime.text = ( "Time's up" )
       Runtime:removeEventListener( "enterFrame", checkTime )
   end
end

Runtime:addEventListener( "enterFrame", checkTime )

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

-- Checks what month the user writes
Runtime:addEventListener( "enterFrame", monthNumber )

--Runtime:addEventListener( "enterFrame", daysCalculator )

---------------------------------------------------------------------------------------------------------
-- Button widgets
---------------------------------------------------------------------------------------------------------   


    -- Creating back button
    backButton = widget.newButton( 
        {   

            width = 305,
            height = 115,

            id = "backButton",
            --label = "Add",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4.13,
            y = 10,

            -- Insert the images here
            defaultFile = "Images/Back.png",
            overFile = "Images/backClicked.png",

            -- When the button is released, call the add screen transition function
            onRelease = backButtonClicked          
        } )

    -----------------------------------------------------------------------------------------

        -- Associating button widgets with this scene
        sceneGroup:insert( backButton )

end 


-----------------------------------------------------------------------------------------
-- Global scene function - show, hide, destroy
-----------------------------------------------------------------------------------------


-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
-----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then  

        -- Create text field (horizontal, vertical, width, height)
        monthTextField = native.newTextField( 230, 570, 320, 105 )
        monthTextField:addEventListener("userInput", monthTextFieldListener)

        dayNumberTextField = native.newTextField( 460, 570, 120, 105 )
        dayNumberTextField:addEventListener("userInput", dayNumberTextFieldListener)

        if (monthName ~= "") then

            monthTextField.text = monthName
            dayNumberTextField.text = dayNumber
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

        monthTextField:removeSelf()
        dayNumberTextField:removeSelf()

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