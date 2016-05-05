
-- Version 4 : Smart Agenda
-- File : settings.lua
-- Created by Laura Aubin
-- Created on April 26, 2016
-- Description: Settings


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "settings" 

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------

function taskDisplayText( ) 

    --table.remove(t, 1)
    --taskDisplayText( ) 
    --bookEssayTaskNumber = table.maxn(t)

    if ( t[1] == nil ) then
        print("*** NIL T1")
        task1.text = ""
    else
        task1.text = t[1] 
    end
-------------------------------
    if ( t[2] == nil ) then
        print("*** NIL T2")
        task2.text = ""
    else
        task2.text = t[2]
    end
-------------------------------
    if ( t[3] == nil ) then
        print("*** NIL T3")
        task3.text = ""
    else
        task3.text = t[3]
    end
-------------------------------
    if ( t[4] == nil ) then
        print("*** NIL T4")
        task4.text = ""
    else
        task4.text = t[4]
    end
-------------------------------
    if ( t[5] == nil ) then
        print("*** NIL T5")
        task5.text = ""
    else
        task5.text = t[5]
    end
    -------------------------------
    if ( t[6] == nil ) then 
        print("*** NIL T6") 
        task6.text = "" 
    elseif ( t[6] ~= nil ) then 

        task6.text = t[6] 
    end
    -------------------------------
    if ( t[7] == nil ) then 
        print("*** NIL T7") 
        task7.text = "" 
    elseif ( t[7] ~= nil ) then 

        task7.text = t[7] 
    end
    -------------------------------
    if ( t[8] == nil ) then 
        print("*** NIL T8") 
        task8.text = "" 
    elseif ( t[8] ~= nil ) then 

        task8.text = t[8] 
    end
    -------------------------------
    if ( t[9] == nil ) then 
        print("*** NIL T9") 
        task9.text = "" 
    elseif ( t[9] ~= nil ) then 

        task9.text = t[9] 
    end
    -------------------------------
    if ( t[10] == nil ) then 
        print("*** NIL T10") 
        task10.text = "" 
    elseif ( t[10] ~= nil ) then 

        task10.text = t[10] 
    end
end

---------------------------------------------------------------------------------------------

function clickedTask1(event)

    if ( task1Color == "true" ) then

        print("****CLICKED")

        --task1:setTextColor(190/255, 180/255, 180/255)
        task1Color = "false"

        table.remove(t, 1)
        taskDisplayText( ) 

        bookEssayTaskNumber = table.maxn(t)

    elseif ( task1Color == "false" ) then

        --task1:setTextColor(60/255, 50/255, 100/255)
        task1Color = "true"
    end
end

-----------------------------------------------------------------------------------------

local function textListener(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        addNewTask = (event.text)

    end
end

-----------------------------------------------------------------------------------------

local function textListenerPosition(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        newTaskPosition = (event.text)

    end
end

-----------------------------------------------------------------------------------------

local function addNewTaskButtonClicked(event)

    if ( addNewTask ~= "") and (newTaskPosition ~= "") then

        table.insert(t, newTaskPosition, addNewTask)
        taskDisplayText( ) 
    end 
end

-----------------------------------------------------------------------------------------

local function backFromSettingsButtonClicked(event)

    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
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

    task1 = display.newText ( t[1], display.contentWidth/3, 100, "Arial", 50)
    task1:setTextColor(60/255, 50/255, 100/255)
    task1Color = "true"

    task2 = display.newText ( t[2], display.contentWidth/3, 160, "Arial", 50)
    task2:setTextColor(60/255, 50/255, 100/255)

    task3 = display.newText ( t[3], display.contentWidth/3, 220, "Arial", 50)
    task3:setTextColor(60/255, 50/255, 100/255)

    task4 = display.newText ( t[4], display.contentWidth/3, 280, "Arial", 50)
    task4:setTextColor(60/255, 50/255, 100/255)

    task5 = display.newText ( t[5], display.contentWidth/3, 340, "Arial", 50)
    task5:setTextColor(60/255, 50/255, 100/255)

    if ( t[6] == nil ) then

        task6 = display.newText ( "", display.contentWidth/3, 400, "Arial", 50)
        task6:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task6 )

    elseif ( t[6] ~= nil ) then

        task6 = display.newText ( t[6], display.contentWidth/3, 400, "Arial", 50)
        task6:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task6 )
    end
    -------------------------------

    if ( t[7] == nil ) then

        task7 = display.newText ( "", display.contentWidth/3, 460, "Arial", 50)
        task7:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task7 )

    elseif ( t[7] ~= nil ) then

        task7 = display.newText ( t[7], display.contentWidth/3, 460, "Arial", 50)
        task7:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task7 )
    end
    -------------------------------

    if ( t[8] == nil ) then

        task8 = display.newText ( "", display.contentWidth/3, 520, "Arial", 50)
        task8:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task8 )

    elseif ( t[8] ~= nil ) then

        task8 = display.newText ( t[8], display.contentWidth/3, 520, "Arial", 50)
        task8:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task8 )
    end
    -------------------------------

    if ( t[9] == nil ) then

        task9 = display.newText ( "", display.contentWidth/3, 580, "Arial", 50)
        task9:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task9 )

    elseif ( t[9] ~= nil ) then

        task9 = display.newText ( t[9], display.contentWidth/3, 580, "Arial", 50)
        task9:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task9 )
    end
    -------------------------------

    if ( t[10] == nil ) then

        task10 = display.newText ( "", display.contentWidth/3, 640, "Arial", 50)
        task10:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task10 )

    elseif ( t[7] ~= nil ) then

        task10 = display.newText ( t[10], display.contentWidth/3, 640, "Arial", 50)
        task10:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task10 )
    end

    sceneGroup:insert( task1 )
    sceneGroup:insert( task2 )
    sceneGroup:insert( task3 )
    sceneGroup:insert( task4 )
    sceneGroup:insert( task5 )
   
    taskDisplayText( ) 


    -----------------------------------------------------------------------------------------
    -- Button widgets
    -----------------------------------------------------------------------------------------   

    addNewTaskButton = widget.newButton( 
        {   

            width = 130,
            height = 100,

            id = "addNewTaskButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2.1,
            y = 1120,

            -- Insert the images here
            defaultFile = "Images/Add.png",
            overFile = "Images/AddClicked.png",

            -- When the button is released, call the add screen transition function
            onRelease = addNewTaskButtonClicked          
        } )

    sceneGroup:insert( addNewTaskButton )

    -----------------------------------------------------------------------------------------   

    backFromSettingsButton = widget.newButton( 
        {   

            width = 270,
            height = 110,

            id = "backFromSettingsButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4,
            y = 0,

            -- Insert the images here
            defaultFile = "Images/Back.png",
            overFile = "Images/Back2.png",

            -- When the button is released, call the add screen transition function
            onRelease = backFromSettingsButtonClicked          
        } )

    sceneGroup:insert( backFromSettingsButton )

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

        -- 'touch' is called too many times
        task1:addEventListener('tap', clickedTask1)
        task2:addEventListener('tap', clickedTask1)
        task3:addEventListener('tap', clickedTask1)
        task4:addEventListener('tap', clickedTask1)
        task5:addEventListener('tap', clickedTask1)

        -- Create text field (horizontal, vertical, width, height)
        newTaskTextField = native.newTextField( 380, 1000, 635, 105 )
        newTaskTextField:addEventListener("userInput", textListener) 

        -- Create text field (horizontal, vertical, width, height)
        newTaskPositionTextField = native.newTextField( 160, 1120, 200, 105 )
        newTaskPositionTextField:addEventListener("userInput", textListenerPosition)    

        if (addNewTask ~= "") then
            
            newTaskTextField.text = addNewTask
        end
        
        if (newTaskPosition ~= "") then
            
            newTaskTextField.text = newTaskPosition
        end
    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view
    local phase = event.phase

    newTaskTextField:removeSelf()


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