
-- Version 2 : Smart Agenda
-- File : add_screen.lua
-- Created by Laura Aubin
-- Created on January 09, 2016
-- Description: User input screen


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "add_screen"

-- Create the scene object
local scene = composer.newScene( sceneName )

print("*** Day =", DAY)

daysBetweenTodayAndDue = 0
daysBetweenTodayAndDue2 = 0
monthName = ""
dayNumber = 0


---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------


local background
local backButton
local typeButton
local classButton
local dueDateButton 

-- Just a time variable local to this scene, using global "time"
local timeCount


-----------------------------------------------------------------------------------------
-- Local Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function okayButtonClicked( )

    print("*** Back button clicked")
    print("*** Custom name textbox = ", customName)

        -- Create if else statement to make the show all tab button appear only when there is 
    -- a custom name input.
    if (customName == "") then

        --Nothing happens here
    else
        print("*** Tab is visible.")
        showTasksButton.isVisible = true
    end

    Runtime:addEventListener( "enterFrame", bookEssayInitiation )
    Runtime:addEventListener( "enterFrame", option2Initiation )

    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
end 

-----------------------------------------------------------------------------------------

local function cancelButtonClicked( )

    customName = ""
    typeOption = ""
    classOption = ""
    todayTask = ""
    daysBetweenTodayAndDue = 0

    JSONfile = require( "JSON.Book Essay" )
    Option2 = require( "JSON.Option2" )

    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
end 

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- When the okay text button is clicked, call this function
--local function okayButtonClicked( )

    --Runtime:addEventListener( "enterFrame", bookEssayInitiation ) 
    --Runtime:addEventListener( "enterFrame", option2Initiation )
    
    --composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
--end  

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- When the type button is clicked, call this function
local function typeButtonClicked( )

    print("*** Type button clicked")

    composer.gotoScene( "type_options", {effect = "zoomInOutFade", time = 500})
end

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- When the class button is clicked, call this function
local function classButtonClicked( )

    print("*** Class button clicked")

    composer.gotoScene( "class_options", {effect = "zoomInOutFade", time = 500})
end

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- When the due date button is clicked, call this function
local function dueDateButtonClicked( )

    print("*** Due date button clicked")

    composer.gotoScene( "Due Date.Due Date", {effect = "zoomInOutFade", time = 500})
end

-----------------------------------------------------------------------------------------

local function textListener(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        customName = (event.text)

    end
end

-----------------------------------------------------------------------------------------

local function dueDateDisplay( )

    -- If there is no date set yet, display nothing
    if (dayNumber == 0) then

        dueDateDisplayText.text = ""

    -- If the date is today, display nothing
    elseif (dayNumber == os.date("%d") and monthName == os.date("%B")) then

        dueDateDisplayText.text = ""

    -- If the date is in the future, display the due date
    elseif (dayNumber ~= 0) then

        dueDateDisplayText.text = monthName .. " " .. dayNumber .. ", 2016"
    end
end


-----------------------------------------------------------------------------------------

local function daysBetweenDisplay( )

    if ( specifiedTask == "Book Essay" ) then

        if (daysBetweenTodayAndDue == 0) then 

            daysBetweenDisplayText.text = ""

        elseif (daysBetweenTodayAndDue ~= 0) then

            if (daysBetweenTodayAndDue == 1) then

                daysBetweenDisplayText.text =  daysBetweenTodayAndDue .. " day from today" 

            elseif (daysBetweenTodayAndDue > 1) then

                daysBetweenDisplayText.text =  daysBetweenTodayAndDue .. " days from today"
            end
        end

    elseif ( specifiedTask2 == "Option2" ) then

        if (daysBetweenTodayAndDue2 == 0) then 

            daysBetweenDisplayText.text = ""

        elseif (daysBetweenTodayAndDue2 ~= 0) then

            if (daysBetweenTodayAndDue2 == 1) then

                daysBetweenDisplayText.text =  daysBetweenTodayAndDue2 .. " day from today" 

            elseif (daysBetweenTodayAndDue2 > 1) then

                daysBetweenDisplayText.text =  daysBetweenTodayAndDue2 .. " days from today"
            end
        end
    end
end

Runtime:addEventListener( "enterFrame", daysBetweenDisplay )

-----------------------------------------------------------------------------------------

local function monthNumberValues()

    if (monthName == "Jan") then

        --monthNumber = 1
        daysFromThisMonth = daysFromJanuary

    elseif (monthName == "Feb") then

        --monthNumber = 2
        daysFromThisMonth = daysFromFebruary

    elseif (monthName == "Mar") then

        --monthNumber = 3
        daysFromThisMonth = daysFromMarch

    elseif (monthName == "Apr") then

        --monthNumber = 4
        daysFromThisMonth = daysFromApril

    elseif (monthName == "May") then

        --monthNumber = 5
        daysFromThisMonth = daysFromMay

    elseif (monthName == "June") then

        --monthNumber = 6
        daysFromThisMonth = daysFromJune

    elseif (monthName == "July") then

        --monthNumber = 7
        daysFromThisMonth = daysFromJuly

    elseif (monthName == "Aug") then

        --monthNumber = 8
        daysFromThisMonth = daysFromAugust

    elseif (monthName == "Sept") then

        --monthNumber = 9
        daysFromThisMonth = daysFromSeptember

    elseif (monthName == "Oct") then

        --monthNumber = 10
        daysFromThisMonth = daysFromOctober

    elseif (monthName == "Nov") then

        --monthNumber = 11
        daysFromThisMonth = daysFromNovember

    elseif (monthName == "Dec") then

        --monthNumber = 12
        daysFromThisMonth = daysFromDecember
    else
    end
end

-----------------------------------------------------------------------------------

local function typeMenuButtonClicked ()

    typeMenuOption1Button.alpha = 0.8
    typeOption1.alpha = 0.9
end 

local function typeMenuButtonClicked2 ()

    typeMenuOption1Button.alpha = 0
    typeOption1.alpha = 0

    typeOption1show.isVisible = true
end 

-----------------------------------------------------------------------------------

local function classMenuButtonClicked ()

    classMenuOption1Button.alpha = 0.8
    classOption1Text.alpha = 0.9
end 

local function classMenuButtonClicked2 ()

    classMenuOption1Button.alpha = 0
    classOption1Text.alpha = 0

    classOption1Textshow.isVisible = true
end 

-----------------------------------------------------------------------------------

local function typeMenuFunctionsClicked ()

    -- If the menu is visible
    if ( typeMenuOption1Button.alpha == 0.8 ) then

        -- Run the function that that makes things non-visible
        typeMenuButtonClicked2()

    elseif ( typeMenuOption1Button.alpha == 0 ) then

        typeMenuButtonClicked()
    end
end

-----------------------------------------------------------------------------------

local function classMenuFunctionsClicked ()

    -- If the menu is visible
    if ( classMenuOption1Button.alpha == 0.8 ) then

        -- Run the function that that makes things non-visible
        classMenuButtonClicked2()

    elseif ( classMenuOption1Button.alpha == 0 ) then

        classMenuButtonClicked()
    end
end

-----------------------------------------------------------------------------------

local function typeMenuFunctions2Clicked ()

    typeMenuButtonClicked2 ()

    typeOption = table1Name

    -- State initial book essay characteristics
    bookEssayTaskNumber = table.maxn(t)
    todayTask = t[1]
    specifiedTask = "Book Essay"

    -- The workload calculation requires the time component
    if ( daysBetweenTodayAndDue ~= 0) then

        dailyWorkloadCalculation( ) 
    end
end

-----------------------------------------------------------------------------------

local function classMenuFunctions2Clicked ()

    classMenuButtonClicked2 ()

    classOption = classOption1
end

-----------------------------------------------------------------------------------

local function calendarShowButtonClicked ()

    calendar.alpha = 1
    x.alpha = 0.4
    calendarHideButton.alpha = 0.9
    calendar2Button.isVisible = true
    calendar3Button.isVisible = true
    calendar4Button.isVisible = true
    calendar5Button.isVisible = true
    calendar6Button.isVisible = true
    calendar7Button.isVisible = true
    calendar8Button.isVisible = true
    calendar9Button.isVisible = true
    calendar10Button.isVisible = true
    calendar11Button.isVisible = true
    calendar12Button.isVisible = true
    calendar13Button.isVisible = true
    calendar14Button.isVisible = true
    calendar15Button.isVisible = true
    calendar16Button.isVisible = true
    calendar17Button.isVisible = true
    calendar18Button.isVisible = true
    calendar19Button.isVisible = true
    calendar20Button.isVisible = true
    calendar21Button.isVisible = true
    calendar22Button.isVisible = true
    calendar23Button.isVisible = true
    calendar24Button.isVisible = true
    calendar25Button.isVisible = true
    calendar26Button.isVisible = true
    calendar27Button.isVisible = true
    calendar28Button.isVisible = true
    calendar29Button.isVisible = true
    calendar30Button.isVisible = true

    typeText.alpha = 0
    typeBlock.alpha = 0
    typeMenuButton.alpha = 0
    classText.alpha = 0
    classBlock.alpha = 0
    classMenuButton.alpha = 0
    dueDateText.alpha = 0
    dueDateBlock.alpha = 0
    calendarShowButton.alpha = 0
    okayButton.alpha = 0
    okayButtonText.alpha = 0
    cancelButton.alpha = 0
    cancelButtonText.alpha = 0
    typeOption1show.alpha = 0
    classOption1Textshow.alpha = 0
end

-----------------------------------------------------------------------------------

local function calendarHideButtonClicked ()

    calendar.alpha = 0
    x.alpha = 0
    calendarHideButton.alpha = 0
    calendar2Button.isVisible = false
    calendar3Button.isVisible = false
    calendar4Button.isVisible = false
    calendar5Button.isVisible = false
    calendar6Button.isVisible = false
    calendar7Button.isVisible = false
    calendar8Button.isVisible = false
    calendar9Button.isVisible = false
    calendar10Button.isVisible = false
    calendar11Button.isVisible = false
    calendar12Button.isVisible = false
    calendar13Button.isVisible = false
    calendar14Button.isVisible = false
    calendar15Button.isVisible = false
    calendar16Button.isVisible = false
    calendar17Button.isVisible = false
    calendar18Button.isVisible = false
    calendar19Button.isVisible = false
    calendar20Button.isVisible = false
    calendar21Button.isVisible = false
    calendar22Button.isVisible = false
    calendar23Button.isVisible = false
    calendar24Button.isVisible = false
    calendar25Button.isVisible = false
    calendar26Button.isVisible = false
    calendar27Button.isVisible = false
    calendar28Button.isVisible = false
    calendar29Button.isVisible = false
    calendar30Button.isVisible = false

    typeText.alpha = 0.6
    typeBlock.alpha = 0.4
    typeMenuButton.alpha = 0.8
    classText.alpha = 0.6
    classBlock.alpha = 0.4
    classMenuButton.alpha = 0.8
    dueDateText.alpha = 0.6
    dueDateBlock.alpha = 0.4
    calendarShowButton.alpha = 1
    okayButton.alpha = 0.6
    okayButtonText.alpha = 0.8
    cancelButton.alpha = 0.7
    cancelButtonText.alpha = 0.8
    typeOption1show.alpha = 0.9
    classOption1Textshow.alpha = 0.9
end

-----------------------------------------------------------------------------------

local function calendar2ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 2
end

-----------------------------------------------------------------------------------

local function calendar3ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 3

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar4ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 4

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar5ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 5

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar6ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 6

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar7ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 7

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar8ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 8

    print("=====================")

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar9ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 9

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar10ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 10

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar11ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 11

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar12ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 12

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar13ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 13

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar14ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 14

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar15ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 15

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar16ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 16

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar17ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 17

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar18ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 18

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar19ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 19

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar20ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 20

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar21ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 21

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar22ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 22

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar23ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 23

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar24ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 24

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar25ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 25

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar26ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 26

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar27ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 27

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar28ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 28

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar29ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 29

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
end

-----------------------------------------------------------------------------------

local function calendar30ButtonClicked ()

    calendarHideButtonClicked ()

    dayNumber = 30

    -- ***NOTE: Run function monthNumberValues() in add_screen
    daysFromThisMonth = daysFromJune

    Runtime:addEventListener( "enterFrame", daysCalculator )
    Runtime:addEventListener( "enterFrame", assigningValueToTime )
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

    background = display.newImage("Images/Backgrounds/Light_Background.png")

    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.width = display.contentWidth
    background.height = display.contentHeight*1.4
    background.alpha = 0.9

    -- Associate objects within this scene 
    sceneGroup:insert( background )

    -- Send the background image to the back layer so all other objects can be on top
    background:toBack()

    ---------------------------------------------------------------------------------------------------------

    blackTop = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight/9)
    blackTop.x = display.contentWidth/2
    blackTop.y = -115
    blackTop.alpha = 0.6

    blackTop2 = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight/80)
    blackTop2.x = display.contentWidth/2
    blackTop2.y = -60
    blackTop2.alpha = 0.09

    blackBottom = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight/7)
    blackBottom.x = display.contentWidth/2
    blackBottom.y = 1150
    blackBottom.alpha = 0.4

    ----------------------------------------------------------------------------------

    dateMain = display.newImageRect("Images/DateDisplay/Main.png", 165, 290)
    dateMain.x = display.contentWidth/2
    dateMain.y = 80
    dateMain.alpha = 0.9

    dateLeft = display.newImageRect("Images/DateDisplay/Date2.png", 165, 240)
    dateLeft.x = display.contentWidth/3.39
    dateLeft.y = 55
    dateLeft.alpha = 0.9

    dateRight = display.newImageRect("Images/DateDisplay/Date2.png", 165, 240)
    dateRight.x = display.contentWidth/1.42
    dateRight.y = 55
    dateRight.alpha = 0.9

    dateFarLeft = display.newImageRect("Images/DateDisplay/Date3.png", 175, 240)
    dateFarLeft.x = display.contentWidth/10.37
    dateFarLeft.y = 55
    dateFarLeft.alpha = 0.8

    dateFarRight = display.newImageRect("Images/DateDisplay/Date3.png", 175, 240)
    dateFarRight.x = display.contentWidth/1.11
    dateFarRight.y = 55
    dateFarRight.alpha = 0.8

    ---------------------------------------------------------------------------------------------

    dateMainDay = display.newText ( weekDayName, display.contentWidth/2, -10, "Arial", 48)
    dateMainDay:setTextColor(250/255, 250/255, 250/255)

    dateMainDay1 = display.newText ( weekDayName1, display.contentWidth/9.35, -10, "Arial", 43)
    dateMainDay1:setTextColor(110/255, 110/255, 120/255)

    dateMainDay2 = display.newText ( weekDayName2, display.contentWidth/3.37, -10, "Arial", 43)
    dateMainDay2:setTextColor(110/255, 110/255, 120/255)

    dateMainDay3 = display.newText ( weekDayName3, display.contentWidth/1.425, -10, "Arial", 43)
    dateMainDay3:setTextColor(110/255, 110/255, 120/255)

    dateMainDay4 = display.newText ( weekDayName4, display.contentWidth/1.11, -10, "Arial", 43)
    dateMainDay4:setTextColor(110/255, 110/255, 120/255)

    ---------------------------------------------------------------------------------------------

    dateMainDate = display.newText ( dayNumberManipulate, display.contentWidth/2, 80, "Times New Roman", 117)
    dateMainDate:setTextColor(250/255, 250/255, 250/255) 

    dateMainDate1 = display.newText ( "31", display.contentWidth/9.35, 80, "Times New Roman", 110)
    dateMainDate1:setTextColor(110/255, 110/255, 120/255)

    dateMainDate2 = display.newText ( "01", display.contentWidth/3.37, 80, "Times New Roman", 110)
    dateMainDate2:setTextColor(110/255, 110/255, 120/255)

    dateMainDate3 = display.newText ( "03", display.contentWidth/1.425, 80, "Times New Roman", 110)
    dateMainDate3:setTextColor(110/255, 110/255, 120/255)

    dateMainDate4 = display.newText ( "04", display.contentWidth/1.11, 80, "Times New Roman", 110)
    dateMainDate4:setTextColor(110/255, 110/255, 120/255)

    ---------------------------------------------------------------------------------------------

    dateMainMonth = display.newText ( "JUNE", display.contentWidth/2, 165, "Arial", 35)
    dateMainMonth:setTextColor(250/255, 250/255, 250/255)

    ---------------------------------------------------------------------------------------------------------

    customNameBlock = display.newImageRect("Images/Menu Blocks/basic.png", display.contentWidth/1.2, display.contentHeight/8.8)
    customNameBlock.x = display.contentWidth/2
    customNameBlock.y = 400
    customNameBlock.alpha = 0.64

    typeBlock = display.newImageRect("Images/DropDown3.png", display.contentWidth/1.2, display.contentHeight/8.8)
    typeBlock.x = display.contentWidth/2
    typeBlock.y = 550
    typeBlock.alpha = 0.4

    classBlock = display.newImageRect("Images/DropDown3.png", display.contentWidth/1.2, display.contentHeight/8.8)
    classBlock.x = display.contentWidth/2
    classBlock.y = 700
    classBlock.alpha = 0.4

    dueDateBlock = display.newImageRect("Images/DropDown3.png", display.contentWidth/1.2, display.contentHeight/4)
    dueDateBlock.x = display.contentWidth/2
    dueDateBlock.y = 920
    dueDateBlock.alpha = 0.4

    ---------------------------------------------------------------------------------------------------------

    calendar = display.newImageRect("Images/CalendarJune.png", display.contentWidth, display.contentHeight/1.7)
    calendar.x = display.contentWidth/2
    calendar.y = 775
    calendar.alpha = 0

    x = display.newImageRect("Images/RedX.png", display.contentWidth/9.8, display.contentHeight/15)
    x.x = display.contentWidth/2
    x.y = 722
    x.alpha = 0

    ---------------------------------------------------------------------------------------------------------

    customNameText = display.newText ( "My custom name:", display.contentWidth/2, 315, "Helvetica", 40)
    customNameText:setTextColor(80/255, 80/255, 80/255)

    typeText = display.newText ( "Type:", 245, 550, "Impact", 80)
    --typeText:setTextColor(250/255, 250/255, 250/255)
    typeText:setTextColor(60/255, 50/255, 100/255)
    typeText.alpha = 0.6

    classText = display.newText ( "Class:", 235, 700, "Impact", 80)
    classText:setTextColor(60/255, 50/255, 100/255)
    classText.alpha = 0.6

    dueDateText = display.newText ( "Due date:", 235, 900, "Impact", 80)
    dueDateText:setTextColor(60/255, 50/255, 100/255)
    dueDateText.alpha = 0.6

    okayButtonText = display.newText ( "Okay", display.contentWidth/2.5, 1166, "Verdana", 33)
    okayButtonText:setTextColor(240/255, 240/255, 250/255)
    okayButtonText.alpha = 0.8

    cancelButtonText = display.newText ( "Cancel", display.contentWidth/1.7, 1167, "Verdana", 33)
    cancelButtonText:setTextColor(240/255, 240/255, 250/255)
    cancelButtonText.alpha = 0.8

    dueDateDisplayText = display.newText ( "", display.contentWidth/2, display.contentHeight/1.12, "Arial", 57)
    dueDateDisplayText:setTextColor(60/255, 50/255, 100/255)

    daysBetweenDisplayText = display.newText ("", display.contentWidth/3.24, display.contentHeight/1.01, "Arial", 37)
    daysBetweenDisplayText:setTextColor(50/255, 40/255, 90/255)

    typeOption1 = display.newText (table1Name, display.contentWidth/1.4, display.contentHeight/1.68, "Arial", 37)
    typeOption1:setTextColor(50/255, 40/255, 90/255)

    typeOption1show = display.newText (table1Name, display.contentWidth/1.4, display.contentHeight/1.87, "Arial", 37)
    typeOption1show:setTextColor(50/255, 40/255, 90/255)

    classOption1Text = display.newText (classOption1, display.contentWidth/1.4, display.contentHeight/1.35, "Arial", 37)
    classOption1Text:setTextColor(50/255, 40/255, 90/255)

    classOption1Textshow = display.newText (classOption1, display.contentWidth/1.4, display.contentHeight/1.46, "Arial", 37)
    classOption1Textshow:setTextColor(50/255, 40/255, 90/255)

    sceneGroup:insert( customNameBlock )
    sceneGroup:insert( typeBlock )
    sceneGroup:insert( classBlock )
    sceneGroup:insert( dueDateBlock )
    sceneGroup:insert( blackBottom )
    sceneGroup:insert( blackTop )
    sceneGroup:insert( blackTop2 )
    sceneGroup:insert( dateMain )
    sceneGroup:insert( dateLeft )
    sceneGroup:insert( dateRight )
    sceneGroup:insert( dateFarLeft )
    sceneGroup:insert( dateFarRight )
    sceneGroup:insert( dateMainDay )
    sceneGroup:insert( dateMainDay1 )
    sceneGroup:insert( dateMainDay2 )
    sceneGroup:insert( dateMainDay3 )
    sceneGroup:insert( dateMainDay4 )
    sceneGroup:insert( dateMainDate )
    sceneGroup:insert( dateMainDate1 )
    sceneGroup:insert( dateMainDate2 )
    sceneGroup:insert( dateMainDate3 )
    sceneGroup:insert( dateMainDate4 )
    sceneGroup:insert( dateMainMonth )
    sceneGroup:insert( customNameText )
    sceneGroup:insert( typeText )
    sceneGroup:insert( classText )
    sceneGroup:insert( dueDateText )
    sceneGroup:insert( okayButtonText )
    sceneGroup:insert( daysBetweenDisplayText )
    sceneGroup:insert( typeOption1 )
    sceneGroup:insert( classOption1Text )
    sceneGroup:insert( cancelButtonText )
    sceneGroup:insert( calendar )
    sceneGroup:insert( x )


-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


    -- Creating a back button
    backButton = widget.newButton( 
        {   

            width = 80,
            height = 75,

            id = "backButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/10,
            y = -115,

            -- Insert the images here
            defaultFile = "Images/LeftArrow.png",
            overFile = "Images/LeftArrowGreen.png",

            -- When the button is released, call the add screen transition function
            onRelease = backButtonClicked          
        } )

    backButton.alpha = 0

    -----------------------------------------------------------------------------------------   

    -- Creating an okay button
    okayButton = widget.newButton( 
        {   

            width = 55,
            height = 52,

            id = "okayButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.5,
            y = 1116,

            -- Insert the images here
            defaultFile = "Images/Check1.png",
            overFile = "Images/Check1Pressed.png",

            -- When the button is released, call the add screen transition function
            onRelease = okayButtonClicked          
        } )

        okayButton:toFront()
        okayButton.alpha = 0.6

    -----------------------------------------------------------------------------------------   

    -- Creating an okay button
    cancelButton = widget.newButton( 
        {   

            width = 65,
            height = 63,

            id = "cancelButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.7,
            y = 1115,

            -- Insert the images here
            defaultFile = "Images/x.png",
            overFile = "Images/xPressed.png",

            -- When the button is released, call the add screen transition function
            onRelease = cancelButtonClicked          
        } )

        cancelButton:toFront()
        cancelButton.alpha = 0.7

    -----------------------------------------------------------------------------------------   

    -- Creating a type drop down button
    typeMenuButton = widget.newButton( 
        {   

            width = 270,
            height = 68,

            id = "typeMenuButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.39,
            y = 545,

            -- Insert the images here
            defaultFile = "Images/Buttons/buttonGreen.jpeg",
            overFile = "Images/Menu Blocks/BasicPressed.png",

            -- When the button is released, call the add screen transition function
            onRelease = typeMenuFunctionsClicked          
        } )

    typeMenuButton.alpha = 0.23

    -----------------------------------------------------------------------------------------   

    typeMenuOption1Button = widget.newButton( 
        {   

            width = 270,
            height = 68,

            id = "typeMenuOption1Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.39,
            y = 612,

            -- Insert the images here
            defaultFile = "Images/Menu Blocks/Basic.png",
            overFile = "Images/Menu Blocks/Basic.png",

            -- When the button is released, call the add screen transition function
            onRelease = typeMenuFunctions2Clicked          
        } )

    typeMenuOption1Button.alpha = 0

    -----------------------------------------------------------------------------------------   

    -- Creating a type drop down button
    classMenuButton = widget.newButton( 
        {   

            width = 270,
            height = 68,

            id = "classMenuButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.39,
            y = 700,

            -- Insert the images here
            defaultFile = "Images/Menu Blocks/Basic.png",
            overFile = "Images/Menu Blocks/Basic.png",

            -- When the button is released, call the add screen transition function
            onRelease = classMenuFunctionsClicked          
        } )

    classMenuButton.alpha = 0.5

    -----------------------------------------------------------------------------------------   

    classMenuOption1Button = widget.newButton( 
        {   

            width = 270,
            height = 68,

            id = "classMenuOption1Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.39,
            y = 763,

            -- Insert the images here
            defaultFile = "Images/Menu Blocks/Basic.png",
            overFile = "Images/Menu Blocks/Basic.png",

            -- When the button is released, call the add screen transition function
            onRelease = classMenuFunctions2Clicked          
        } )

    classMenuOption1Button.alpha = 0

    -----------------------------------------------------------------------------------------   

    calendarShowButton = widget.newButton( 
        {   

            width = 270,
            height = 110,

            id = "calendarShowButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.39,
            y = 910,

            -- Insert the images here
            defaultFile = "Images/Menu Blocks/Basic.png",
            overFile = "Images/Menu Blocks/Basic.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendarShowButtonClicked          
        } )

    calendarShowButton.alpha = 0.4

    -----------------------------------------------------------------------------------------   

    calendarHideButton = widget.newButton( 
        {   

            width = 136,
            height = 120,

            id = "calendarHideButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.09,
            y = 534,

            -- Insert the images here
            defaultFile = "Images/fold5.png",
            overFile = "Images/fold6.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendarHideButtonClicked          
        } )

    calendarHideButton.alpha = 0

    -----------------------------------------------------------------------------------------   

    calendar2Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar2Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.559,
            y = 727,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar2ButtonClicked          
        } )

    calendar2Button.alpha = 0.5
    calendar2Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar3Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar3Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.28,
            y = 727,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar3ButtonClicked          
        } )

    calendar3Button.alpha = 0.5
    calendar3Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar4Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar4Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.08,
            y = 727,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar4ButtonClicked          
        } )

    calendar4Button.alpha = 0.5
    calendar4Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar5Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar5Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/11.3,
            y = 800,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar5ButtonClicked          
        } )

    calendar5Button.alpha = 0.5
    calendar5Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar6Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar6Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4.5,
            y = 800,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar6ButtonClicked          
        } )

    calendar6Button.alpha = 0.5
    calendar6Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar7Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar7Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.78,
            y = 800,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar7ButtonClicked          
        } )

    calendar7Button.alpha = 0.5
    calendar7Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar8Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar8Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = 800,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar8ButtonClicked           
        } )

    calendar8Button.alpha = 0.5
    calendar8Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar9Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar9Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.559,
            y = 800,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar9ButtonClicked          
        } )

    calendar9Button.alpha = 0.5
    calendar9Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar10Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar10Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.28,
            y = 800,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar10ButtonClicked          
        } )

    calendar10Button.alpha = 0.5
    calendar10Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar11Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar11Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.08,
            y = 800,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar11ButtonClicked          
        } )

    calendar11Button.alpha = 0.5
    calendar11Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar12Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar12Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/11.3,
            y = 883,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar12ButtonClicked          
        } )

    calendar12Button.alpha = 0.5
    calendar12Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar13Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar13Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4.5,
            y = 883,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar13ButtonClicked          
        } )

    calendar13Button.alpha = 0.5
    calendar13Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar14Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar14Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.78,
            y = 883,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar14ButtonClicked          
        } )

    calendar14Button.alpha = 0.5
    calendar14Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar15Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar15Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = 883,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar15ButtonClicked          
        } )

    calendar15Button.alpha = 0.5
    calendar15Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar16Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar16Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.559,
            y = 883,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar16ButtonClicked          
        } )

    calendar16Button.alpha = 0.5
    calendar16Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar17Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar17Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.28,
            y = 883,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar17ButtonClicked          
        } )

    calendar17Button.alpha = 0.5
    calendar17Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar18Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar18Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.08,
            y = 883,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar18ButtonClicked          
        } )

    calendar18Button.alpha = 0.5
    calendar18Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar19Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar19Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/11.3,
            y = 962,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar19ButtonClicked          
        } )

    calendar19Button.alpha = 0.5
    calendar19Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar20Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar20Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4.5,
            y = 962,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar20ButtonClicked          
        } )

    calendar20Button.alpha = 0.5
    calendar20Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar21Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar21Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.78,
            y = 962,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar21ButtonClicked          
        } )

    calendar21Button.alpha = 0.5
    calendar21Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar22Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar22Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = 962,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar22ButtonClicked          
        } )

    calendar22Button.alpha = 0.5
    calendar22Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar23Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar23Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.559,
            y = 962,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar23ButtonClicked          
        } )

    calendar23Button.alpha = 0.5
    calendar23Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar24Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar24Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.28,
            y = 962,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar24ButtonClicked          
        } )

    calendar24Button.alpha = 0.5
    calendar24Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar25Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar25Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.08,
            y = 962,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar25ButtonClicked          
        } )

    calendar25Button.alpha = 0.5
    calendar25Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar26Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar26Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/11.3,
            y = 1038,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar26ButtonClicked          
        } )

    calendar26Button.alpha = 0.5
    calendar26Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar27Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar27Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4.5,
            y = 1038,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar27ButtonClicked          
        } )

    calendar27Button.alpha = 0.5
    calendar27Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar28Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar28Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.76,
            y = 1038,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar28ButtonClicked          
        } )

    calendar28Button.alpha = 0.5
    calendar28Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar29Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar29Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = 1038,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar29ButtonClicked          
        } )

    calendar29Button.alpha = 0.5
    calendar29Button.isVisible = false

    -----------------------------------------------------------------------------------------   

    calendar30Button = widget.newButton( 
        {   

            width = 100,
            height = 78,

            id = "calendar30Button",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.559,
            y = 1038,

            -- Insert the images here
            defaultFile = "Images/Popup/partial.png",
            overFile = "Images/Popup/blueBox.png",

            -- When the button is released, call the add screen transition function
            onRelease = calendar30ButtonClicked          
        } )

    calendar30Button.alpha = 0.5
    calendar30Button.isVisible = false

    -------------------------------------------------------------------------------

    backButton.alpha = 0

        -- Associating button widgets with this scene
        sceneGroup:insert( backButton )
        sceneGroup:insert( okayButton )
        sceneGroup:insert( cancelButton )
        sceneGroup:insert( typeMenuButton )
        sceneGroup:insert( typeMenuOption1Button )
        sceneGroup:insert( classMenuButton )
        sceneGroup:insert( classMenuOption1Button )
        sceneGroup:insert( dueDateDisplayText )
        sceneGroup:insert( calendarShowButton )
        sceneGroup:insert( calendarHideButton )

        typeOption1:toFront()
        typeOption1.alpha = 0

        classOption1Text:toFront()
        classOption1Text.alpha = 0

        calendar:toFront()
        x:toFront()
        calendarHideButton:toFront() 

        sceneGroup:insert( calendar2Button )
        sceneGroup:insert( calendar3Button )
        sceneGroup:insert( calendar4Button )
        sceneGroup:insert( calendar5Button )
        sceneGroup:insert( calendar6Button )
        sceneGroup:insert( calendar7Button )
        sceneGroup:insert( calendar8Button )
        sceneGroup:insert( calendar9Button )
        sceneGroup:insert( calendar10Button )
        sceneGroup:insert( calendar11Button )
        sceneGroup:insert( calendar12Button )
        sceneGroup:insert( calendar13Button )
        sceneGroup:insert( calendar14Button )
        sceneGroup:insert( calendar15Button )
        sceneGroup:insert( calendar16Button )
        sceneGroup:insert( calendar17Button )
        sceneGroup:insert( calendar18Button )
        sceneGroup:insert( calendar19Button )
        sceneGroup:insert( calendar20Button )
        sceneGroup:insert( calendar21Button )
        sceneGroup:insert( calendar22Button )
        sceneGroup:insert( calendar23Button )
        sceneGroup:insert( calendar24Button )
        sceneGroup:insert( calendar25Button )
        sceneGroup:insert( calendar26Button )
        sceneGroup:insert( calendar27Button )
        sceneGroup:insert( calendar28Button )
        sceneGroup:insert( calendar29Button )
        sceneGroup:insert( calendar30Button )

        sceneGroup:insert( typeOption1show )
        typeOption1show.isVisible = false

        sceneGroup:insert( classOption1Textshow )
        classOption1Textshow.isVisible = false
end


-----------------------------------------------------------------------------------------
-- Global scene function - show, hide, destroy
-----------------------------------------------------------------------------------------


-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    local function here ()

        print(dayNumber)
    end
    --Runtime:addEventListener( "enterFrame", here )

    --dueDateDisplay( )
    --daysBetweenDisplay( )

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
-----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then  

        print("*** SHOW!!!")

        --okayButtonText:addEventListener('tap', okayButtonClicked) 
        
        -- Create text field (horizontal, vertical, width, height)
        customNameTextField = native.newTextField( display.contentWidth/2, 403, 590, 70 )
        customNameTextField:setTextColor(60/255, 50/255, 100/255)
        customNameTextField:addEventListener("userInput", textListener) 

        if (customName ~= "") then
            
            customNameTextField.text = customName
        end

        --*************************************************************
        --*************************************************************
        -- So what if I declare the due date first?? 
        --*************************************************************
        --*************************************************************
        print("Days between =", daysBetweenTodayAndDue)
        print("Days between 2 =", daysBetweenTodayAndDue2) 

    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    if ( phase == "will" ) then

        print("*** HIDE!!!")

        customNameTextField:removeSelf()

-----------------------------------------------------------------------------------------

        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.

    elseif ( phase == "did" ) then

        --customNameTextField:removeEventListener("userInput", textListener)   

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