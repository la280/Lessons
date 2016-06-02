
-- Version 2 : Smart Agenda
-- File : help_screen.lua
-- Created by Laura Aubin
-- Created on January 09, 2016
-- Description: User help screen with instructions and tutorials


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "help_screen"

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------

local background
local backButton
local checkButton
local editButton
local showTasksButton

local instructionsText
local backText

local instructions
local task
local taskType
local arrowOnEdit
local arrowOnTab
local arrowOnCheck
local customName


-----------------------------------------------------------------------------------------
-- Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    print("*** Back button clicked")

    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})
end  

-----------------------------------------------------------------------------------------

local function checkButtonClicked( )

    instructionsText = ( " Check off tasks that\n you have completed.")
    instructions.text = instructionsText

end 

-----------------------------------------------------------------------------------------

local function editButtonClicked( )

    instructionsText = ( "  Edit the characteristics\n    of your created task\n such as the name, type, \n            and class.")
    instructions.text = instructionsText

end 

-----------------------------------------------------------------------------------------

local function TabButtonClicked( )

    instructionsText = ( " View all the steps to\n  complete your task.")
    instructions.text = instructionsText

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

background = display.newImage("Images/Screens/instructions.png")

background.x = display.contentCenterX
background.y = display.contentCenterY
background.width = display.contentWidth
background.height = display.contentHeight*1.4

-- Send the background image to the back layer so all other objects can be on top
background:toBack()

-- Associate objects within this scene 
sceneGroup:insert( background )

-----------------------------------------------------------------------------------------

backText = display.newText ( "Back", display.contentWidth/7, -110, "Arial", 50)
backText:setTextColor(60/255, 50/255, 100/255)

instructions = display.newText ( "Click on each button to\n    know it's purpose.", display.contentWidth/1.9, 710, "Arial", 60)
instructions:setTextColor(60/255, 50/255, 100/255)

task = display.newText ( "Today's task.", display.contentWidth/1.52, 50, "Arial", 55)
task:setTextColor(60/255, 50/255, 100/255)

customName = display.newText ( "Create a custom name.", display.contentWidth/2.35, 150, "Arial", 50)
customName:setTextColor(60/255, 50/255, 100/255)

taskType = display.newText ( "Specific task type.", display.contentWidth/2.35, 226, "Arial", 55)
taskType:setTextColor(60/255, 50/255, 100/255)

class = display.newText ( "Specific class subject.", display.contentWidth/2.36, 300, "Arial", 51)
class:setTextColor(60/255, 50/255, 100/255)

-- Make arrows that point to buttons on the help screen
arrowOnEdit = display.newImageRect("Images/Arrow-up.png", 90, 100)
arrowOnEdit.x = display.contentWidth/1.18
arrowOnEdit.y = display.contentHeight/3.9

arrowOnCheck = display.newImageRect("Images/Arrow-down.png", 100 , 100)
arrowOnCheck.x = display.contentWidth/9.4
arrowOnCheck.y = -35

arrowOnTab = display.newImageRect("Images/Arrow-right.png", 100 , 100)
arrowOnTab.x = display.contentWidth/1.27
arrowOnTab.y = -17

-- Associate objects within this scene 
sceneGroup:insert( backText )
sceneGroup:insert( instructions )
sceneGroup:insert( task )
sceneGroup:insert( customName )
sceneGroup:insert( taskType )
sceneGroup:insert( class )
sceneGroup:insert( arrowOnEdit )
sceneGroup:insert( arrowOnTab )


-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


-- Creating back button
backButton = widget.newButton( 
    {   

        width = 175,
        height = 90,

        id = "backButton",
        --label = "Add",

        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/7,
        y = -110,

        -- Insert the images here
        defaultFile = "Images/Back2.png",
        overFile = "Images/backClicked2.png",

        -- When the button is released, call the add screen transition function
        onRelease = backButtonClicked          
    } )

-----------------------------------------------------------------------------------------

-- Creating a checkbox button
checkButton = widget.newButton( 
    {   

        width = 50,
        height = 50,

        id = "checkButton",

        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/9.6,
        y = 40,

        -- Insert the images here
        defaultFile = "Images/Check.png",
        overFile = "Images/CheckPressed.png",

        -- When the button is released, call this function
        onRelease = checkButtonClicked          
    } )

-----------------------------------------------------------------------------------------

-- Creating an edit button
editButton = widget.newButton( 
    {   

        width = 100,
        height = 100,

        id = "editButton",

        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/1.17,
        y = 160,

        -- Insert the images here
        defaultFile = "Images/Edit.png",
        overFile = "Images/EditPressed.png",

        -- When the button is released, call the edit screen transition function
        onRelease = editButtonClicked          
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
        y = 14,

        -- Insert the images here
        defaultFile = "Images/Tab.png",
        overFile = "Images/TabPressed.png",

        -- When the button is released, call this function
        onRelease = TabButtonClicked          
    } )

showTasksButton.alpha = 0.8

-----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( backButton )
    sceneGroup:insert( checkButton )
    sceneGroup:insert( editButton )
    sceneGroup:insert( showTasksButton )
    sceneGroup:insert( arrowOnCheck )

    backText:toFront()

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