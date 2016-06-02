
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

-- Load background colours code, local to this scene
local backgroundColours = require( "Background.Background colours" )
 

mainMenuVariables = require( "Main Menu.variables" )
JSONfile = require( "JSON.Book Essay" )
Option2 = require( "JSON.Option2" )
typeOptions = require( "type_options" )
classOptions = require( "class_options" )
classOptions = require( "Due Date.Due Date" )
transitionFunctions = require( "Main Menu.Transition functions" )
actionFunctions = require( "Main Menu.Action functions" )
dailyCalculations = require( "Main Menu.Daily calculations" )
taskCalculations = require( "Main Menu.Task Calculations" )
taskCalculations = require( "Main Menu.Task Calculations2" )

-- Name this scene
sceneName = "main_menu"

-- Create the scene object
local scene = composer.newScene( sceneName )

time = daysBetweenTodayAndDue
time2 = daysBetweenTodayAndDue2


---------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------

local background
local checkButton
local addButton
local helpButton
local todayButton

---------------------------------------------------------------------------------------------------------
-- FUNCTION
---------------------------------------------------------------------------------------------------------


function bookEssayInitiation( ) 

    -- If we are working with the book essay
    if (specifiedTask == "Book Essay") and (daysBetweenTodayAndDue ~= 0) then  

        Runtime:removeEventListener( "enterFrame", bookEssayInitiation )

        _bookEssayWorkload( )
    end 
end

---------------------------------------------------------------------------------------------------------

function option2Initiation( )  

    -- If we are working with option 2
    if (specifiedTask2 == "Option2") and (daysBetweenTodayAndDue2 ~= 0) then  

        Runtime:removeEventListener( "enterFrame", option2Initiation )

        print("*** Option2 Initialized")

        option2Workload( )
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

    ------------------------------------------------------------------------------------------

    -- Buttton overlay text
    addText = display.newText ( "New", display.contentWidth/1.975, 1150, "Arial", 35)
    addText:setTextColor(255/255, 255/255, 255/255)

    helpText = display.newText ( "Help", display.contentWidth/1.09, 1150, "Arial", 35)
    helpText:setTextColor(255/255, 255/255, 255/255)

    settingsText = display.newText ( "Settings", display.contentWidth/9, 1150, "Arial", 35)
    settingsText:setTextColor(255/255, 255/255, 255/255)

    countTextName = display.newText( "Tasks", display.contentWidth/1.4, 1150, "Arial", 35)
    countTextName:setTextColor(255/255, 255/255, 255/255)

    calendarTextName = display.newText( "View", display.contentWidth/3.26, 1150, "Arial", 35)
    calendarTextName:setTextColor(255/255, 255/255, 255/255)

    ----------------------------------------------------------------------------------

    blackBottom = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight/5)
    blackBottom.x = display.contentWidth/2
    blackBottom.y = 1120
    blackBottom.alpha = 0.5

    blackBottom2 = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight/75)
    blackBottom2.x = display.contentWidth/2
    blackBottom2.y = 1080
    blackBottom2.alpha = 0

    blackTop = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight/9)
    blackTop.x = display.contentWidth/2
    blackTop.y = -117
    blackTop.alpha = 0.65

    blackTop2 = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight/80)
    blackTop2.x = display.contentWidth/2
    blackTop2.y = -60
    blackTop2.alpha = 0

    blackTopLine = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth/1.2, 5)
    blackTopLine.x = display.contentWidth/2
    blackTopLine.y = 335
    blackTopLine.alpha = 0.15

    blackBottomLine = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth/1.2, 5)
    blackBottomLine.x = display.contentWidth/2
    blackBottomLine.y = 930
    blackBottomLine.alpha = 0.13

    blackBox = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth/1.2, display.contentHeight/2.7)
    blackBox.x = display.contentWidth/2
    blackBox.y = 549
    blackBox.alpha = 0.2

    blueBox = display.newImageRect("Images/Popup/blueBox.png", display.contentWidth/1.2, display.contentHeight/6)
    blueBox.x = display.contentWidth/2
    blueBox.y = 824
    blueBox.alpha = 0.13

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

    dateMainDate = display.newText ( os.date("%d"), display.contentWidth/2, 80, "Times New Roman", 117)
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

    ----------------------------------------------------------------------------------

    customNameBlock = display.newImageRect("Images/Menu Blocks/basic.png", display.contentWidth/1.3, display.contentHeight/10)
    customNameBlock.x = display.contentWidth/2
    customNameBlock.y = 430
    customNameBlock.alpha = 0.3

    customNameBlockIcon = display.newImageRect("Images/Type/NameW.png", display.contentWidth/12, display.contentHeight/14)
    customNameBlockIcon.x = display.contentWidth/5
    customNameBlockIcon.y = 425.5
    customNameBlockIcon.alpha = 1

    customNameBlockIconDash = display.newText ("|", display.contentWidth/3.8, 422, "Arial", 70)
    customNameBlockIconDash:setTextColor(250/255, 250/255, 255/255)
    customNameBlockIconDash.alpha = 0.3

    ----------------------------------------------------------------------------------

    typeBlock = display.newImageRect("Images/Menu Blocks/basic.png", display.contentWidth/1.3, display.contentHeight/10)
    typeBlock.x = display.contentWidth/2
    typeBlock.y = 550
    typeBlock.alpha = 0.3

    typeBlockIcon = display.newImageRect("Images/Type/typeW.png", display.contentWidth/11, display.contentHeight/14)
    typeBlockIcon.x = display.contentWidth/5
    typeBlockIcon.y = 554.5
    typeBlockIcon.alpha = 1

    typeBlockIconDash = display.newText ("|", display.contentWidth/3.8, 550, "Arial", 70)
    typeBlockIconDash:setTextColor(250/255, 250/255, 255/255)
    typeBlockIconDash.alpha = 0.3

    ----------------------------------------------------------------------------------

    classBlock = display.newImageRect("Images/Menu Blocks/basic.png", display.contentWidth/1.3, display.contentHeight/10)
    classBlock.x = display.contentWidth/2
    classBlock.y = 667
    classBlock.alpha = 0.3

    classBlockIcon = display.newImageRect("Images/Type/class2W.png", display.contentWidth/12, display.contentHeight/14)
    classBlockIcon.x = display.contentWidth/5
    classBlockIcon.y = 668
    classBlockIcon.alpha = 1

    classBlockIconDash = display.newText ("|", display.contentWidth/3.8, 666, "Arial", 70)
    classBlockIconDash:setTextColor(250/255, 250/255, 255/255)
    classBlockIconDash.alpha = 0.3

    ----------------------------------------------------------------------------------

    todayTaskBlock = display.newImageRect("Images/Menu Blocks/blueBar2.png", display.contentWidth/1.3, display.contentHeight/10)
    todayTaskBlock.x = display.contentWidth/2
    todayTaskBlock.y = 826
    todayTaskBlock.alpha = 0.4

    ----------------------------------------------------------------------------------

    -- Input items from the add screen, displayed on the main screen
    customNameTextDisplay = display.newText (customName, display.contentWidth/2, 427, "Verdana", 45)
    customNameTextDisplay:setTextColor(250/255, 250/255, 255/255)

    typeOptionTextDisplay = display.newText (typeOption, display.contentWidth/2, 544, "Verdana", 45)
    typeOptionTextDisplay:setTextColor(250/255, 250/255, 255/255) 

    classOptionTextDisplay = display.newText (classOption, display.contentWidth/2, 660, "Verdana", 45)
    classOptionTextDisplay:setTextColor(255/255, 250/255, 255/255)

    -- Today's task 
    todayTaskText = display.newText ("Today: " .. todayTask, display.contentWidth/2, 823, "Verdana", 36)
    --todayTaskText:setTextColor(80/255, 85/255, 115/255)
    todayTaskText:setTextColor(250/255, 250/255, 255/255)

    -- The countdown text that represents one day in seconds
    displayDailyTime = display.newText( dailyEndTime, display.contentWidth/1.10, 1140, "Helvetica", 60 )
    displayDailyTime:setTextColor(60/255, 50/255, 100/255)

    -- Additional tasks in one day
    additionalTasksText = display.newText( additionalTasks, display.contentWidth/1.6, -25, "Arial", 53 )
    additionalTasksText:setTextColor(60/255, 50/255, 100/255)

    countText = display.newText( countNumber, display.contentWidth/1.4, 1080, "Arial", 50 )
    countText:setTextColor(130/255, 255/255, 255/255)
    
    sceneGroup:insert( blackBottom )
    sceneGroup:insert( blackBottom2 )
    sceneGroup:insert( blackTop )
    sceneGroup:insert( blackTop2 )
    sceneGroup:insert( blackTopLine )
    sceneGroup:insert( blackBottomLine )
    sceneGroup:insert( blackBox )
    sceneGroup:insert( blueBox )
    -------------------
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
    -------------------
    sceneGroup:insert( customNameBlock )
    sceneGroup:insert( customNameBlockIcon )
    sceneGroup:insert( customNameBlockIconDash )
    sceneGroup:insert( typeBlock )
    sceneGroup:insert( typeBlockIcon )
    sceneGroup:insert( typeBlockIconDash )
    sceneGroup:insert( classBlock )
    sceneGroup:insert( classBlockIcon )
    sceneGroup:insert( classBlockIconDash )
    sceneGroup:insert( todayTaskBlock )
    -------------------
    sceneGroup:insert( customNameTextDisplay )
    sceneGroup:insert( typeOptionTextDisplay )
    sceneGroup:insert( classOptionTextDisplay )
    sceneGroup:insert( todayTaskText )
    sceneGroup:insert( displayDailyTime )
    sceneGroup:insert( additionalTasksText )
    -------------------
    sceneGroup:insert( countText )
    sceneGroup:insert( addText )
    sceneGroup:insert( helpText )
    sceneGroup:insert( settingsText )
    sceneGroup:insert( countTextName )
    sceneGroup:insert( calendarTextName )

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

            width = 74,
            height = 74,

            id = "addButton",

            -- Set its position on the screen relative to the screen size
            --x = display.contentCenterX,
            x = display.contentWidth/1.94,
            y = 1082,

            -- Insert the images here
            defaultFile = "Images/Tools/addIcon.png",
            overFile = "Images/Tools/addColour.png",

            -- When the button is released, call the add screen transition function
            onRelease = addButtonClicked          
        } )

    addButton.alpha = 0.8

    -----------------------------------------------------------------------------------------

    -- Creating a help button
    helpButton = widget.newButton( 
        {   

            width = 85,
            height = 80,

            id = "helpButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.09,
            y = 1080,

            -- Insert the images here
            defaultFile = "Images/Tools/Help.png",
            overFile = "Images/Tools/HelpGreen.png",

            -- When the button is released, call the help screen transition function
            onRelease = helpButtonClicked          
        } )

    helpButton.alpha = 0.85

     -----------------------------------------------------------------------------------------

     -- Creating a settings button
    settingsButton = widget.newButton( 
        {   

            width = 65,
            height = 65,

            id = "settingsButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/9.2,
            y = 1080,

            -- Insert the images here
            defaultFile = "Images/Tools/Settings.png",
            overFile = "Images/Tools/SettingsGreen.png",

            -- When the button is released, call the settings screen transition function
            onRelease = settingsButtonClicked          
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

    editButton.alpha = 0

    -----------------------------------------------------------------------------------------

    -- Creating a checkbox button
    checkButton = widget.newButton( 
        {   

            width = 50,
            height = 50,

            id = "checkButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/10.5,
            y = 100,

            -- Insert the images here
            defaultFile = "Images/Check.png",
            overFile = "Images/CheckPressed.png",

            -- When the button is released, call this function
            onRelease = checkButtonClicked          
        } )

    checkButton.alpha = 0

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

    moreButton.alpha = 0

    --------------------------------------------------------------------------------

    -- Creating a count button
    countButton = widget.newButton( 
        {   

            width = 72,
            height = 72,

            id = "countButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.4,
            y = 1080,

            -- Insert the images here
            defaultFile = "Images/Tools/Count.png",
            overFile = "Images/Tools/CountGreen.png",

            -- When the button is released, call the more button function
            onRelease = countButtonClicked       
        } )

    countButton.alpha = 0.8

    --------------------------------------------------------------------------------

    -- Creating a calendar button
    calendarButton = widget.newButton( 
        {   

            width = 65,
            height = 70,

            id = "calendarButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/3.26,
            y = 1081,

            -- Insert the images here
            defaultFile = "Images/Tools/Calendar.png",
            overFile = "Images/Tools/CalendarGreen.png",

            -- When the button is released, call the more button function
            onRelease = calendarButtonClicked       
        } )

    calendarButton.alpha = 0.8

    --------------------------------------------------------------------------------

    -- Creating a menu button
    menuButton = widget.newButton( 
        {   

            width = 80,
            height = 60,

            id = "menuButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/11,
            y = -115,

            -- Insert the images here
            defaultFile = "Images/Tools/MenuBlack.png",
            overFile = "Images/Tools/MenuGreen.png",

            -- When the button is released, call the more button function
            onRelease = menuButtonClicked       
        } )

    menuButton.alpha = 0.8


    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( addButton )
    sceneGroup:insert( helpButton )
    sceneGroup:insert( settingsButton )
    sceneGroup:insert( countButton )
    sceneGroup:insert( calendarButton )
    sceneGroup:insert( menuButton )
    sceneGroup:insert( editButton )
    sceneGroup:insert( checkButton )
    sceneGroup:insert( showTasksButton )
    sceneGroup:insert( okayButton )
    sceneGroup:insert( moreButton )

    -- Bring the button text above everything else
    addText:toFront()
    helpText:toFront()
    okayButton:toFront()
    settingsText:toFront()
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

    if ( todayTask == "") then

        todayTaskText.text = todayTask

    elseif ( todayTask ~= "") then

        todayTaskText.text = "Today: " .. todayTask
    end

    timeSpan = daysBetweenTodayAndDue

    -----------------------------------------------------------------------------------------   

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then

    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then 

        print("*** Time span =", time) 
        print("*** Time span 2 =", time2) 
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