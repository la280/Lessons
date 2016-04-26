
-- Version 3 : Smart Agenda
-- File : task_details.lua
-- Created by Laura Aubin
-- Created on March 10, 2016
-- Description: Here the user can view a more detailed display of their daily task.


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "task_details"

-- Create the scene object
local scene = composer.newScene( sceneName )

print("*** customName =", customName)

---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------

local background
local backButton
local customNameText
local todayTaskTextTitle
local todayTaskText
local tomorrowTaskTextTitle
local tomorrowTaskText
local noText
local allTasksTitle
local allTasks

-----------------------------------------------------------------------------------------
-- Local Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
end  

-----------------------------------------------------------------------------------------

-- When the back button is clicked, call this function
local function tomorrowTaskFunction( )

    if ( timeSpan == 1 ) then

    todayTaskText.text = "Finish all"
    tomorrowTaskText.text = "Finish all"
    
    else

        if (todayTask == "Research book") then

            tomorrowTask = "Review essay's"

        elseif (todayTask == "Review essay's") then
            
            tomorrowTask = "Rough draft"

        elseif (todayTask == "Rough draft") then
            
            tomorrowTask = "Edit draft"

        elseif (todayTask == "Edit draft") then
            
            tomorrowTask = "Final draft"

        elseif (todayTask == "Final draft") then
        
            tomorrowTask = "Completed!"

        elseif (todayTask == "Completed!") then
        
            tomorrowTask = "Nothing planned"
        end
    end
end  

-----------------------------------------------------------------------------------------

-- Call this function to physically show when a task is completed
local function completedTasksFunction( )

    if (todayTask == "Research book") then

    elseif (todayTask == "Review essay's") then

        checkBoxEmpty1.isVisible = false
        checkBoxMarked1.isVisible = true

    elseif (todayTask == "Rough draft") then
        
        checkBoxEmpty1.isVisible = false
        checkBoxMarked1.isVisible = true

        checkBoxEmpty2.isVisible = false
        checkBoxMarked2.isVisible = true

    elseif (todayTask == "Edit draft") then
        
        checkBoxEmpty1.isVisible = false
        checkBoxMarked1.isVisible = true

        checkBoxEmpty2.isVisible = false
        checkBoxMarked2.isVisible = true

        checkBoxEmpty3.isVisible = false
        checkBoxMarked3.isVisible = true

    elseif (todayTask == "Final draft") then
    
        checkBoxEmpty1.isVisible = false
        checkBoxMarked1.isVisible = true

        checkBoxEmpty2.isVisible = false
        checkBoxMarked2.isVisible = true

        checkBoxEmpty3.isVisible = false
        checkBoxMarked3.isVisible = true

        checkBoxEmpty4.isVisible = false
        checkBoxMarked4.isVisible = true

    elseif (todayTask == "Completed!") then
    
        checkBoxEmpty1.isVisible = false
        checkBoxMarked1.isVisible = true

        checkBoxEmpty2.isVisible = false
        checkBoxMarked2.isVisible = true

        checkBoxEmpty3.isVisible = false
        checkBoxMarked3.isVisible = true
        
        checkBoxEmpty4.isVisible = false
        checkBoxMarked4.isVisible = true

        checkBoxEmpty5.isVisible = false
        checkBoxMarked5.isVisible = true
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
display.setDefault("background", 250/255, 250/255, 250/255)

---------------------------------------------------------------------------------------------------------

noText = display.newText ( "Task not named", display.contentWidth/2,  300, "Arial", 80)
noText:setTextColor(60/255, 50/255, 100/255)
noText.isVisible = false

todayTaskTextTitle = display.newText ( "To finish today:", 260, 220, "Arial", 60)
todayTaskTextTitle:setTextColor(60/255, 50/255, 100/255)
todayTaskTextTitle.isVisible = false

local todayTask = ""
todayTaskText = display.newText (todayTask, 255, 300, "Calibri", 60)
todayTaskText:setTextColor(40/255, 120/255, 230/255)
-- Align text where x = 0.5 is centered, x = 1 is aligned left, and x = 0 is right
todayTaskText.anchorX = 0.5
todayTaskText.isVisible = false

tomorrowTaskTextTitle = display.newText ( "Tomorrow:", 210, 426, "Arial", 60)
tomorrowTaskTextTitle:setTextColor(60/255, 50/255, 100/255)
tomorrowTaskTextTitle.isVisible = false

local tomorrowTask = ""
tomorrowTaskText = display.newText ( tomorrowTask, 255, 504, "Calibri", 60)
tomorrowTaskText:setTextColor(40/255, 120/255, 230/255)
tomorrowTaskText.anchorX = 0.5
tomorrowTaskText.isVisible = false

local customName = ""
customNameText = display.newText ( "Task 1: " .. customName, display.contentWidth/2, 90, "Calibri", 65)
customNameText:setTextColor(50/255, 80/255, 150/255)
customNameText.isVisible = false

allTasksTitle = display.newText ("All steps:", 200, 640, "Arial", 65)
allTasksTitle:setTextColor(60/255, 50/255, 100/255)
allTasksTitle.isVisible = false

allTasks = display.newText ("     Research book \n     Review essay's \n     Rough draft  \n     Edit draft \n     Final draft", 281, 865, "Calibri", 58)
allTasks:setTextColor(40/255, 120/255, 230/255)
allTasks.isVisible = false

orangeBackground = display.newImageRect("Images/Popup/PopupBackground.png", display.contentWidth/1.1, display.contentHeight/8)
orangeBackground.x = display.contentWidth/2
orangeBackground.y = display.contentHeight/12
orangeBackground.alpha = 0.25
orangeBackground.isVisible = false

blueBackground = display.newImageRect("Images/Popup/Popup-Background.png", display.contentWidth/1.7, display.contentHeight/5)
blueBackground.x = display.contentWidth/3
blueBackground.y = display.contentHeight/4
blueBackground.alpha = 0.25
blueBackground.isVisible = false

blueBackground2 = display.newImageRect("Images/Popup/Popup-Background.png", display.contentWidth/1.7, display.contentHeight/5)
blueBackground2.x = display.contentWidth/3
blueBackground2.y = display.contentHeight/2.2
blueBackground2.alpha = 0.25
blueBackground2.isVisible = false

blueBackground3 = display.newImageRect("Images/Popup/PopupBackground.png", display.contentWidth/1.71, display.contentHeight/2.1)
blueBackground3.x = display.contentWidth/3
blueBackground3.y = display.contentHeight/1.25
blueBackground3.alpha = 0.25
blueBackground3.isVisible = false

checkBoxEmpty1 = display.newImageRect("Images/checkEmpty.png", 50, 50)
checkBoxEmpty1.x = display.contentWidth/10
checkBoxEmpty1.y = display.contentHeight/1.42
checkBoxEmpty1.alpha = 0.6
checkBoxEmpty1.isVisible = false

checkBoxMarked1 = display.newImageRect("Images/checkMarked.png", 50, 50)
checkBoxMarked1.x = display.contentWidth/10
checkBoxMarked1.y = display.contentHeight/1.42
checkBoxMarked1.alpha = 0.6
checkBoxMarked1.isVisible = false

checkBoxEmpty2 = display.newImageRect("Images/checkEmpty.png", 50, 50)
checkBoxEmpty2.x = display.contentWidth/10
checkBoxEmpty2.y = display.contentHeight/1.29
checkBoxEmpty2.alpha = 0.6
checkBoxEmpty2.isVisible = false

checkBoxMarked2 = display.newImageRect("Images/checkMarked.png", 50, 50)
checkBoxMarked2.x = display.contentWidth/10
checkBoxMarked2.y = display.contentHeight/1.29
checkBoxMarked2.alpha = 0.6
checkBoxMarked2.isVisible = false

checkBoxEmpty3 = display.newImageRect("Images/checkEmpty.png", 50, 50)
checkBoxEmpty3.x = display.contentWidth/10
checkBoxEmpty3.y = display.contentHeight/1.19
checkBoxEmpty3.alpha = 0.6
checkBoxEmpty3.isVisible = false

checkBoxMarked3 = display.newImageRect("Images/checkMarked.png", 50, 50)
checkBoxMarked3.x = display.contentWidth/10
checkBoxMarked3.y = display.contentHeight/1.19
checkBoxMarked3.alpha = 0.6
checkBoxMarked3.isVisible = false

checkBoxEmpty4 = display.newImageRect("Images/checkEmpty.png", 50, 50)
checkBoxEmpty4.x = display.contentWidth/10
checkBoxEmpty4.y = display.contentHeight/1.095
checkBoxEmpty4.alpha = 0.6
checkBoxEmpty4.isVisible = false

checkBoxMarked4 = display.newImageRect("Images/checkMarked.png", 50, 50)
checkBoxMarked4.x = display.contentWidth/10
checkBoxMarked4.y = display.contentHeight/1.095
checkBoxMarked4.alpha = 0.6
checkBoxMarked4.isVisible = false

checkBoxEmpty5 = display.newImageRect("Images/checkEmpty.png", 50, 50)
checkBoxEmpty5.x = display.contentWidth/10
checkBoxEmpty5.y = display.contentHeight/1.015
checkBoxEmpty5.alpha = 0.6
checkBoxEmpty5.isVisible = false

checkBoxMarked5 = display.newImageRect("Images/checkMarked.png", 50, 50)
checkBoxMarked5.x = display.contentWidth/10
checkBoxMarked5.y = display.contentHeight/1.015
checkBoxMarked5.alpha = 0.6
checkBoxMarked5.isVisible = false

sceneGroup:insert( noText )
sceneGroup:insert( orangeBackground )
sceneGroup:insert( blueBackground )
sceneGroup:insert( blueBackground2 )
sceneGroup:insert( blueBackground3 )
sceneGroup:insert( checkBoxEmpty1 )
sceneGroup:insert( checkBoxMarked1 )
sceneGroup:insert( checkBoxEmpty2 )
sceneGroup:insert( checkBoxMarked2 )
sceneGroup:insert( checkBoxEmpty3 )
sceneGroup:insert( checkBoxMarked3 )
sceneGroup:insert( checkBoxEmpty4 )
sceneGroup:insert( checkBoxMarked4 )
sceneGroup:insert( checkBoxEmpty5 )
sceneGroup:insert( checkBoxMarked5 )
sceneGroup:insert( todayTaskTextTitle )
sceneGroup:insert( todayTaskText )
sceneGroup:insert( tomorrowTaskTextTitle  )
sceneGroup:insert( tomorrowTaskText  )
sceneGroup:insert( customNameText )
sceneGroup:insert( allTasksTitle )
sceneGroup:insert( allTasks )

-----------------------------------------------------------------------------------------

if (customName == "") then

    noText.isVisible = true

else

    -- Custom name
    customNameText.isVisible = true

    -- To finish today
    todayTaskTextTitle.isVisible = true
    todayTaskText.isVisible = true

    -- Tomorrow
    tomorrowTaskTextTitle.isVisible = true
    -- Call this function that will determine tomorrow's task
    tomorrowTaskFunction( )
    tomorrowTaskText.isVisible = true

    -- All steps
    allTasksTitle.isVisible = true
    allTasks.isVisible = true

    -- Backgrounds
    orangeBackground.isVisible = true
    blueBackground.isVisible = true
    blueBackground2.isVisible = true
    blueBackground3.isVisible = true

    -- Checkboxes
    checkBoxEmpty1.isVisible = true
    checkBoxEmpty2.isVisible = true
    checkBoxEmpty3.isVisible = true
    checkBoxEmpty4.isVisible = true
    checkBoxEmpty5.isVisible = true
end

-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


    -- Creating back button
    backButton = widget.newButton( 
        {   

            width = 340,
            height = 125,

            id = "backButton",
            --label = "Add",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/3.7,
            y = -70,

            -- Insert the images here
            defaultFile = "Images/Back.png",
            overFile = "Images/backClicked.png",

            -- When the button is released, call the add screen transition function
            onRelease = backButtonClicked          
        } )

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

    -- Update customName
    customName = customName
    print("*** customName =", customName)

    todayTask = todayTask
    print("*** Todaytask =", Todaytask)

    -- Update text
    customNameText.text = ( "Task 1: " .. customName )
    todayTaskText.text = todayTask
    tomorrowTaskText.text = tomorrowTask

    local function updateCurrentTask ( event )

        -- If customname does not equal nil, create task details page
        if (customName ~= "") then

            -- Update text
            customNameText.text = ( "Task 1: " .. customName )
            todayTaskText.text = todayTask
            tomorrowTaskText.text = tomorrowTask

            noText.isVisible = false

            -- Custom name
            customNameText.isVisible = true

            -- To finish today
            todayTaskTextTitle.isVisible = true
            todayTaskText.isVisible = true

            -- Tomorrow
            tomorrowTaskTextTitle.isVisible = true
            -- Call this function that will determine tomorrow's task
            tomorrowTaskFunction( )
            tomorrowTaskText.isVisible = true

            -- All steps
            allTasksTitle.isVisible = true
            allTasks.isVisible = true

            -- Backgrounds
            orangeBackground.isVisible = true
            blueBackground.isVisible = true
            blueBackground2.isVisible = true
            blueBackground3.isVisible = true

            -- Checkboxes
            checkBoxEmpty1.isVisible = true
            checkBoxEmpty2.isVisible = true
            checkBoxEmpty3.isVisible = true
            checkBoxEmpty4.isVisible = true
            checkBoxEmpty5.isVisible = true

            -- Call this function that will determine which tasks are completed or not
            completedTasksFunction( )

        elseif (customName == "") then

            noText.isVisible = true

            -- Custom name
            customNameText.isVisible = false

            -- To finish today
            todayTaskTextTitle.isVisible = false
            todayTaskText.isVisible = false

            -- Tomorrow
            tomorrowTaskTextTitle.isVisible = false
            -- Call this function that will determine tomorrow's task
            tomorrowTaskFunction( )
            tomorrowTaskText.isVisible = false

            -- All steps
            allTasksTitle.isVisible = false
            allTasks.isVisible = false

            -- Backgrounds
            orangeBackground.isVisible = false
            blueBackground.isVisible = false
            blueBackground2.isVisible = false
            blueBackground3.isVisible = false

            -- Checkboxes
            checkBoxEmpty1.isVisible = false
            checkBoxEmpty2.isVisible = false
            checkBoxEmpty3.isVisible = false
            checkBoxEmpty4.isVisible = false
            checkBoxEmpty5.isVisible = false
            checkBoxMarked1.isVisible = false
            checkBoxMarked2.isVisible = false
            checkBoxMarked3.isVisible = false
            checkBoxMarked4.isVisible = false
            checkBoxMarked5.isVisible = false
        end
    end

    Runtime:addEventListener( "enterFrame", updateCurrentTask )

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
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