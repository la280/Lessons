
-- Version 6 : Smart Agenda
-- File : EditOption1.lua
-- Created by Laura Aubin
-- Created on May 10, 2016
-- Description: Option1 task, or table 1 details


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "EditOption1" 

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------


function backFromEditOption1Clicked()

    composer.gotoScene( "Settings.editExistingSelections", {effect = "zoomInOutFade", time = 400})
end

-----------------------------------------------------------------------------------------

-- Displaying the tasks
function taskDisplayText( ) 

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

    -- Remove this item from table t
    --table.remove(t, 1)
    --table.remove(event.target);event.target = nil

    table.remove(t, 1)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask2(event)

    table.remove(t, 2)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask3(event)

    table.remove(t, 3)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask4(event)

    table.remove(t, 4)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask5(event)

    table.remove(t, 5)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask6(event)

    table.remove(t, 6)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask7(event)

    table.remove(t, 7)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask8(event)

    table.remove(t, 8)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask9(event)

    table.remove(t, 9)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

---------------------------------------------------------------------------------------------

function clickedTask10(event)

    table.remove(t, 10)
    taskDisplayText( ) 
    bookEssayTaskNumber = table.maxn(t)
end

-----------------------------------------------------------------------------------------

local function textListenerName(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        addNewTask = (event.text)

    end
end

-----------------------------------------------------------------------------------------

local function changeTitleName(event)

    table1Name = addNewTask

    print("*** Title name =",table1Name)
end

-----------------------------------------------------------------------------------------

local function textListenerPosition()

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text) 

        newTaskPosition = (event.text)

        if ( newTaskPosition == "title" ) then

            changeTitleName( )
        end
    end
end

-----------------------------------------------------------------------------------------

local function addNewTaskButtonClicked()

    if ( newTaskPosition == "title" ) then

        table1NameText.text = table1Name

    elseif ( addNewTask ~= "") and (newTaskPosition ~= "") then

        table.insert(t, newTaskPosition, addNewTask)
        taskDisplayText( ) 
    end 
end

-----------------------------------------------------------------------------------------

local function update(event)

    bookEssayTaskNumber = table.maxn( t )
end

Runtime:addEventListener( "enterFrame", update ) 


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

    table1NameText = display.newText ( table1Name, display.contentWidth/2, 125, "Arial", 80)
    table1NameText:setTextColor(80/255, 50/255, 120/255)

    memo = display.newText ( "Write title", display.contentWidth/1.3, 1110, "Arial", 50)
    memo:setTextColor(80/255, 50/255, 120/255)

    task1 = display.newText ( t[1], display.contentWidth/2, 200, "Arial", 50)
    task1:setTextColor(60/255, 50/255, 100/255)

    task2 = display.newText ( t[2], display.contentWidth/2, 260, "Arial", 50)
    task2:setTextColor(60/255, 50/255, 100/255)

    task3 = display.newText ( t[3], display.contentWidth/2, 320, "Arial", 50)
    task3:setTextColor(60/255, 50/255, 100/255)

    task4 = display.newText ( t[4], display.contentWidth/2, 380, "Arial", 50)
    task4:setTextColor(60/255, 50/255, 100/255)

    task5 = display.newText ( t[5], display.contentWidth/2, 440, "Arial", 50)
    task5:setTextColor(60/255, 50/255, 100/255)

    if ( t[6] == nil ) then

        task6 = display.newText ( "", display.contentWidth/2, 500, "Arial", 50)
        task6:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task6 )

    elseif ( t[6] ~= nil ) then

        task6 = display.newText ( t[6], display.contentWidth/2, 500, "Arial", 50)
        task6:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task6 )
    end
    -------------------------------

    if ( t[7] == nil ) then

        task7 = display.newText ( "", display.contentWidth/2, 560, "Arial", 50)
        task7:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task7 )

    elseif ( t[7] ~= nil ) then

        task7 = display.newText ( t[7], display.contentWidth/2, 560, "Arial", 50)
        task7:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task7 )
    end
    -------------------------------

    if ( t[8] == nil ) then

        task8 = display.newText ( "", display.contentWidth/2, 620, "Arial", 50)
        task8:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task8 )

    elseif ( t[8] ~= nil ) then

        task8 = display.newText ( t[8], display.contentWidth/2, 620, "Arial", 50)
        task8:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task8 )
    end
    -------------------------------

    if ( t[9] == nil ) then

        task9 = display.newText ( "", display.contentWidth/2, 680, "Arial", 50)
        task9:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task9 )

    elseif ( t[9] ~= nil ) then

        task9 = display.newText ( t[9], display.contentWidth/2, 680, "Arial", 50)
        task9:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task9 )
    end
    -------------------------------

    if ( t[10] == nil ) then

        task10 = display.newText ( "", display.contentWidth/2, 740, "Arial", 50)
        task10:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task10 )

    elseif ( t[10] ~= nil ) then

        task10 = display.newText ( t[10], display.contentWidth/2, 740, "Arial", 50)
        task10:setTextColor(60/255, 50/255, 100/255)
        sceneGroup:insert( task10 )
    end

    sceneGroup:insert( table1NameText )
    sceneGroup:insert( memo )
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

    backFromEditOption1ClickedButton = widget.newButton( 
        {   

            width = 270,
            height = 110,

            id = "backFromEditOption1ClickedButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4,
            y = 0,

            -- Insert the images here
            defaultFile = "Images/Back.png",
            overFile = "Images/Back2.png",

            -- When the button is released, call the add screen transition function
            onRelease = backFromEditOption1Clicked          
        } )

    sceneGroup:insert( backFromEditOption1ClickedButton )

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

        --EditOption1_Scene = "show"
        --print(EditOption1_Scene)
       
-----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then  

        -- 'touch' calls too many times
        task1:addEventListener('tap', clickedTask1)
        task2:addEventListener('tap', clickedTask2)
        task3:addEventListener('tap', clickedTask3)
        task4:addEventListener('tap', clickedTask4)
        task5:addEventListener('tap', clickedTask5)
        task6:addEventListener('tap', clickedTask6)
        task7:addEventListener('tap', clickedTask7)
        task8:addEventListener('tap', clickedTask8)
        task9:addEventListener('tap', clickedTask9)
        task10:addEventListener('tap', clickedTask10)

        -- Create text field (horizontal, vertical, width, height)
        newTaskTextField = native.newTextField( 380, 1000, 635, 105 ) 
        newTaskTextField:addEventListener("userInput", textListenerName) 

        -- Create text field (hroizontal, vertical, width, height)
        newTaskPositionTextField = native.newTextField( 160, 1120, 200, 105 )
        newTaskPositionTextField.text = ":"
        newTaskPositionTextField:addEventListener("userInput", textListenerPosition) 
    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    --if ( EditOption1_Scene == "show" ) then

        --EditOption1_Scene = "hide"
        --print(EditOption1_Scene)

        if ( phase == "will" ) then

            print("-- HIDE =--")

            newTaskTextField:removeSelf()
            newTaskPositionTextField:removeSelf()

    -----------------------------------------------------------------------------------------

        elseif ( phase == "did" ) then

        end
    --end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view
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