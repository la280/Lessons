
-- Version 2 : Smart Agenda
-- File : class_options.lua
-- Created by Laura Aubin
-- Created on January 29, 2016
-- Description: Here the user specifies what class their assignment is classified under.


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "class_options"

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------

local background
local backButton
local classOneButton

local classOneBorder
local customNameText
local classOneText

-----------------------------------------------------------------------------------------
-- Local Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    print("*** Class options: Back button clicked")
    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})
end  

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

 -- When the option 1 button is clicked, call this function
local function classOneClicked( )

    classOption = "English"

    print("*** Class 1 button clicked")
    print("*** classOption =", classOption)

    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})
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
display.setDefault("background", 250, 255, 255)

-- Create a border colour behind the option 1 button
classOneBorder = display.newRect(display.contentHeight/2.8, display.contentWidth/2.1, 500, 100) 
classOneBorder:setFillColor(40/255, 30/255, 20/255) 
classOneBorder:toBack()

---------------------------------------------------------------------------------------------------------

customNameText = display.newText ( "Select which class this is for:", display.contentWidth/2, 200, "Arial", 55)
customNameText:setTextColor(60/255, 50/255, 100/255)

classOneText = display.newText ( "--  English  --", display.contentWidth/2, display.contentHeight/2.95, "Arial", 60)
classOneText:setTextColor(60/255, 50/255, 100/255)

---------------------------------------------------------------------------------------------------------

sceneGroup:insert( classOneBorder )
sceneGroup:insert( customNameText )
sceneGroup:insert( classOneText )


-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


-- Creating back button
backButton = widget.newButton( 
    {   

        width = 350,
        height = 125,

        id = "backButton",
        --label = "Add",

        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/3.5,
        y = display.contentHeight/1000,

        -- Insert the images here
        defaultFile = "Images/Back.png",
        overFile = "Images/backClicked.png",

        -- When the button is released, call the add screen transition function
        onRelease = backButtonClicked          
    } )

    -- Associating button widgets with this scene
    sceneGroup:insert( backButton )

-----------------------------------------------------------------------------------------   

-- Creating option 1 button
classOneButton = widget.newButton( 
    {   

        width = 500,
        height = 100,

        id = "classOneButton",
        --label = "Add",

        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/2,
        y = display.contentHeight/3,

        --strokeColor = { default={ 0, 0, 0 }, over={ 0.4, 0.1, 0.2 } }

        -- Insert the images here
        defaultFile = "Images/blue.png",
        overFile = "Images/bluePressed.png",

        -- When the button is released, call the add screen transition function
        onRelease = classOneClicked          
    } )

    -- Associating button widgets with this scene
    sceneGroup:insert( classOneButton )

end 

-----------------------------------------------------------------------------------------
-- Global scene function - show, hide, destroy
-----------------------------------------------------------------------------------------


-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    -- Bring the button text to the front so that it is always visible
    classOneText:toFront()

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