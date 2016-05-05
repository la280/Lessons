
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
transitionFunctions = require( "Main Menu.Transition functions" )
actionFunctions = require( "Main Menu.Action functions" )
dailyCalculations = require( "Main Menu.Daily calculations" )
taskCalculations = require( "Main Menu.Task Calculations" )

-- Name this scene
sceneName = "main_menu"

-- Create the scene object
local scene = composer.newScene( sceneName )

time = daysBetweenTodayAndDue


---------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------


local background
local checkButton
local addButton
local helpButton
local todayButton


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

    settingsText = display.newText ( "SETTINGS", display.contentWidth/2, 980, "Arial", 55)
    settingsText:setTextColor(60/255, 50/255, 100/255)

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
    sceneGroup:insert( settingsText )
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

     -- Creating a settings button
    settingsButton = widget.newButton( 
        {   

            width = 672,
            height = 173,

            id = "settingsButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight/1.043,

            -- Insert the images here
            defaultFile = "Images/pink.png",
            overFile = "Images/pinkPressed.png",

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
    sceneGroup:insert( settingsButton )
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
    todayTaskText.text = todayTask

    time = daysBetweenTodayAndDue
    print("***TIME =",time)

    -----------------------------------------------------------------------------------------   

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
        
        dailyWorkloadCalculation( ) 
        print("*** Time span =", timeSpan) 

    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then 

      -- If we are working with the book essay
      if ( bookEssayTaskNumber == "5" ) then
        --(typeOption == "Book Essay") then    

          _bookEssayWorkload( )
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