
-- Version 6 : Smart Agenda
-- File : addMoreTasks.lua
-- Created by Laura Aubin
-- Created on May 12, 2016
-- Description: Add additional and new tasks


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "addMoreTasks" 

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------


local function backFromAddMoreClicked(event)

    composer.gotoScene( "Settings.settings_menu", {effect = "zoomInOutFade", time = 500})
end

-----------------------------------------------------------------------------------------

local function textListener(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        NewTaskName = (event.text)
    end
end

-----------------------------------------------------------------------------------------

local function textListenerTask(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        individualTaskName = (event.text)
    end
end

-----------------------------------------------------------------------------------------

local function textListenerPosition(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        taskPosition = (event.text)
    end
end

-----------------------------------------------------------------------------------------

local function addTaskEvent(event)

    if ( individualTaskName ~= "") and (taskPosition ~= "") then

        table.insert(t2, taskPosition, individualTaskName)
    end 

    displayNewTask1.text = t2[1]
    displayNewTask2.text = t2[2]
    displayNewTask3.text = t2[3]
    displayNewTask4.text = t2[4]
    displayNewTask5.text = t2[5]
end

-----------------------------------------------------------------------------------------

local function update(event)

    option2TableAmount = table.maxn( t2 )
end

Runtime:addEventListener( "enterFrame", update ) 

-----------------------------------------------------------------------------------------

function createNewTask(event)

    nameText.text = "Name: " .. NewTaskName
    addNewTaskNameTextField.text = ""

    newTaskText.text = "Tasks: " .. option2TableAmount
    newTaskTextField.text = ""
    newTaskPosition.text = ""

    -- If this table is not in use
    if ( table2Name == "") then

        table2Name = NewTaskName
        print("*** Table 2 name =", table2Name)
    end
end


-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ----------------------------------------------------------------------------------------

    nameText = display.newText ( "Name:", display.contentWidth/2, 200, "Arial", 60)
    nameText:setTextColor(60/255, 50/255, 100/255)

    newTaskText = display.newText ( "Tasks:", display.contentWidth/2, 400, "Arial", 60)
    newTaskText:setTextColor(60/255, 50/255, 100/255)

    taskPositionText = display.newText ( "Position:", display.contentWidth/4, 600, "Arial", 55)
    taskPositionText:setTextColor(60/255, 50/255, 100/255)

    addTask = display.newText ( "ADD", display.contentWidth/1.25, 600, "Arial", 70)
    addTask:setTextColor(60/255, 50/255, 100/255)

    displayNewTask1 = display.newText ( "", display.contentWidth/2, 700, "Arial", 55)
    displayNewTask1:setTextColor(60/255, 50/255, 100/255)

    displayNewTask2 = display.newText ( "", display.contentWidth/2, 750, "Arial", 55)
    displayNewTask2:setTextColor(60/255, 50/255, 100/255)

    displayNewTask3 = display.newText ( "", display.contentWidth/2, 800, "Arial", 55)
    displayNewTask3:setTextColor(60/255, 50/255, 100/255)

    displayNewTask4 = display.newText ( "", display.contentWidth/2, 850, "Arial", 55)
    displayNewTask4:setTextColor(60/255, 50/255, 100/255)

    displayNewTask5 = display.newText ( "", display.contentWidth/2, 900, "Arial", 55)
    displayNewTask5:setTextColor(60/255, 50/255, 100/255)

    create = display.newText ( "CREATE", display.contentWidth/2, 1100, "Arial", 75)
    create:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( nameText )
    sceneGroup:insert( newTaskText )
    sceneGroup:insert( taskPositionText )
    sceneGroup:insert( addTask )
    sceneGroup:insert( displayNewTask1 )
    sceneGroup:insert( displayNewTask2 )
    sceneGroup:insert( displayNewTask3 )
    sceneGroup:insert( displayNewTask4 )
    sceneGroup:insert( displayNewTask5 )
    sceneGroup:insert( create )

    -----------------------------------------------------------------------------------------
    -- Button widgets
    -----------------------------------------------------------------------------------------   

        backFromAddMoreTasks = widget.newButton( 
            {   

                width = 290,
                height = 120,

                id = "backFromAddMoreTasks",

                -- Set its position on the screen relative to the screen size
                x = display.contentWidth/4,
                y = -50,

                -- Insert the images here
                defaultFile = "Images/Back.png",
                overFile = "Images/Back2.png",

                -- When the button is released, call the add screen transition function
                onRelease = backFromAddMoreClicked          
            } )

        sceneGroup:insert( backFromAddMoreTasks )
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

        nameText.text = "Name: " .. NewTaskName

-----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Create text field (horizontal, vertical, width, height)
        addNewTaskNameTextField = native.newTextField( 380, 300, 635, 105 )
        addNewTaskNameTextField:addEventListener("userInput", textListener) 

        newTaskTextField = native.newTextField( 380, 500, 635, 105 )
        newTaskTextField:addEventListener("userInput", textListenerTask) 

        newTaskPosition = native.newTextField( 400, 600, 200, 90 )
        newTaskPosition:addEventListener("userInput", textListenerPosition) 

        create:addEventListener('tap', createNewTask)
        addTask:addEventListener('tap', addTaskEvent)

    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then 

        addNewTaskNameTextField:removeSelf()
        newTaskTextField:removeSelf()
        newTaskPosition:removeSelf()

-----------------------------------------------------------------------------------------

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