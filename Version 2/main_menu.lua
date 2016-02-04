
-- Version 2 : Smart Agenda
-- File : main_menu.lua
-- Created by Laura Aubin
-- Created on January 08, 2016
-- Description: Main menu for app


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "main_menu"

-- Create the scene object
local scene = composer.newScene( sceneName )

-- *** Nil value error, temporary solution
customName = "."


-----------------------------------------------------------------------------------------
-- Create current date and time
-----------------------------------------------------------------------------------------


now = os.time()

-- Constant time values (in seconds)
-- 60s * 60h * 24h * 7d
MINUTE = 60
HOUR = 3600 
DAY = 86400
WEEK = 604800
YEAR = 3153602.92

-- The weekday
--print("*** Today =", os.date("%A") ) 

--print("*** !!! ", WEEK*5 / DAY)

-- Formatted for the year - month - day, hour : minute : seconds
--print( os.date("*** Timestamp = %Y-%m-%dT%X%z") )

print( os.date("*** Timestamp = %A, %m %d, %Y") )


---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------


local background

local addButton

local creditsButton


-----------------------------------------------------------------------------------------
-- Transition functions
-----------------------------------------------------------------------------------------


-- When the add button is clicked, call this function
local function addButtonClicked( )

    print("*** Add button clicked")

    --customNameTextField:insert()

    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})
end  


-- Create transition function to help page
local function helpButtonClicked( )       
    composer.gotoScene( "help_screen", {effect = "flipFadeOutIn", time = 500})
end 
 

-----------------------------------------------------------------------------------------
-- Global scene function - create
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    print("*** Custom name =", customName)


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

-- Overlay text
addText = display.newText ( "ADD", display.contentWidth/2, 420, "Arial", 60)
addText:setTextColor(60/255, 50/255, 100/255)

helpText = display.newText ( "HELP", display.contentWidth/2, 700, "Arial", 60)
helpText:setTextColor(60/255, 50/255, 100/255)

sceneGroup:insert( addText )
sceneGroup:insert( helpText )
    

-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


-- Creating add button
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

-- Creating help button
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

    -- Associating button widgets with this scene
    sceneGroup:insert( addButton )
    sceneGroup:insert( helpButton )

    -- Bring the button text above everything else
    addText:toFront()
    helpText:toFront()
end 


-----------------------------------------------------------------------------------------
-- Global scene function - show, hide, destroy
-----------------------------------------------------------------------------------------


-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    print("*** Custom name variable =", customName)

    -- Input items from the add screen
    customNameTextDisplay = display.newText (customName, display.contentWidth/5, 180, "Arial", 60)
    customNameTextDisplay:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( customNameTextDisplay )

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