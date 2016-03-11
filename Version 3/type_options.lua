
-- Version 2 : Smart Agenda
-- File : type_options.lua
-- Created by Laura Aubin
-- Created on January 12, 2016
-- Description: Menu options for the type of assignment, under the add screen.


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "type_options"

-- Create the scene object
local scene = composer.newScene( sceneName )


---------------------------------------------------------------------------------------------------------
-- Local and global variables
---------------------------------------------------------------------------------------------------------

local background
local backButton
local optionOneButton

local optionOneBorder

local customNameText
local optionOneText

-- Which task the book essay is on, 0 = nothing
bookEssayTaskNumber = ""

-----------------------------------------------------------------------------------------
-- Local Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    print("*** Back button clicked")
    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})
end  
 
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

 -- When the option 1 button is clicked, call this function
function optionOneClicked( )

    typeOption = "Book Essay"

    print("*** Option 1, book essay clicked")
    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})

-----------------------------------------------------------------------------------------

-- Book essay tasks = (5): Research book
--                    (4): Review essay's
--                    (3): Rough draft
--                    (2): Edit draft
--                    (1): Final draft

-- State initial book essay characteristics
    bookEssayTaskNumber = "5"
    todayTask = "Research book" 

    print("*** Book essay task number =", bookEssayTaskNumber)

end  


-----------------------------------------------------------------------------------------
-- Create function that creates the book essay tasks
-----------------------------------------------------------------------------------------      
    

function bookEssaySelected( )  

    print("***Function is working")
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
optionOneBorder = display.newRect(display.contentHeight/2.8, display.contentWidth/2.1, 500, 100) 
optionOneBorder:setFillColor(40/255, 30/255, 20/255) 
optionOneBorder:toBack()

---------------------------------------------------------------------------------------------------------

customNameText = display.newText ( "Select the most likely topic:", display.contentWidth/2, 160, "Arial", 55)
customNameText:setTextColor(60/255, 50/255, 100/255)

optionOneText = display.newText ( "--  Book Essay  --", display.contentWidth/2, display.contentHeight/2.95, "Arial", 60)
optionOneText:setTextColor(60/255, 50/255, 100/255)

---------------------------------------------------------------------------------------------------------

sceneGroup:insert( optionOneBorder )
sceneGroup:insert( customNameText )
sceneGroup:insert( optionOneText )


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
optionOneButton = widget.newButton( 
    {   

        width = 500,
        height = 100,

        id = "optionOneButton",
        --label = "Add",

        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/2,
        y = display.contentHeight/3,

        --strokeColor = { default={ 0, 0, 0 }, over={ 0.4, 0.1, 0.2 } }

        -- Insert the images here
        defaultFile = "Images/blue.png",
        overFile = "Images/bluePressed.png",

        -- When the button is released, call the add screen transition function
        onRelease = optionOneClicked          
    } )

    -- Associating button widgets with this scene
    sceneGroup:insert( optionOneButton )

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
    optionOneText:toFront()

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