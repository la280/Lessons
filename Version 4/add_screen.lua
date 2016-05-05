
-- Version 2 : Smart Agenda
-- File : add_screen.lua
-- Created by Laura Aubin
-- Created on January 09, 2016
-- Description: User input screen


---------------------------------------------------------------------------------------------------------
-- Initial settings
---------------------------------------------------------------------------------------------------------


-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Name this scene
sceneName = "add_screen"

-- Create the scene object
local scene = composer.newScene( sceneName )

print("*** Day =", DAY)

daysBetweenTodayAndDue = 0
monthName = ""
dayNumber = 0


---------------------------------------------------------------------------------------------------------
-- Local variables
---------------------------------------------------------------------------------------------------------

local background
local backButton
local typeButton
local classButton
local dueDateButton 

-- Just a time variable local to this scene, using global "time"
local timeCount


-----------------------------------------------------------------------------------------
-- Local Transition functions
-----------------------------------------------------------------------------------------


-- When the back button is clicked, call this function
local function backButtonClicked( )

    print("*** Back button clicked")
    print("*** Custom name textbox = ", customName)

        -- Create if else statement to make the show all tab button appear only when there is 
    -- a custom name input.
    if (customName == "") then

        --Nothing happens here
    else
        print("*** Tab is visible.")
        showTasksButton.isVisible = true
    end

    composer.gotoScene( "main_menu", {effect = "zoomInOutFade", time = 500})

end  

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- When the type button is clicked, call this function
local function typeButtonClicked( )

    print("*** Type button clicked")

    composer.gotoScene( "type_options", {effect = "zoomInOutFade", time = 500})
end

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- When the class button is clicked, call this function
local function classButtonClicked( )

    print("*** Class button clicked")

    composer.gotoScene( "class_options", {effect = "zoomInOutFade", time = 500})
end

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

-- When the due date button is clicked, call this function
local function dueDateButtonClicked( )

    print("*** Due date button clicked")

    composer.gotoScene( "Due Date.Due Date", {effect = "zoomInOutFade", time = 500})
end

-----------------------------------------------------------------------------------------

local function textListener(event)

    if (event.phase == "began") then

    elseif (event.phase == "ended" or event.phase == "submitted") then

    elseif (event.phase == "editing") then
        
        print(event.text)

        customName = (event.text)

    end
end

-----------------------------------------------------------------------------------------

local function dueDateDisplay( )

    -- If there is no date set yet, display nothing
    if (dayNumber == 0) then

        dueDateDisplayText.text = ""

    -- If the date is today, display nothing
    elseif (dayNumber == os.date("%d") and monthName == os.date("%B")) then

        dueDateDisplayText.text = ""

    -- If the date is in the future, display the due date
    elseif (dayNumber ~= 0) then

        dueDateDisplayText.text = monthName .. " " .. dayNumber .. ", 2016"
    end
end


-----------------------------------------------------------------------------------------

local function daysBetweenDisplay( )

    if (daysBetweenTodayAndDue == 0) then 

        daysBetweenDisplayText.text = ""

    elseif (daysBetweenTodayAndDue ~= 0) then

        if (daysBetweenTodayAndDue == 1) then

            daysBetweenDisplayText.text =  daysBetweenTodayAndDue .. " day from today" 

        elseif (daysBetweenTodayAndDue > 1) then

            daysBetweenDisplayText.text =  daysBetweenTodayAndDue .. " days from today"
        end
    end
end

Runtime:addEventListener( "enterFrame", daysBetweenDisplay )


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

    background = display.newImage("Images/Screens/Input.png")

    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background.width = display.contentWidth
    background.height = display.contentHeight*1.4

    -- Associate objects within this scene 
    sceneGroup:insert( background )

    -- Send the background image to the back layer so all other objects can be on top
    background:toBack()

    ---------------------------------------------------------------------------------------------------------

    customNameText = display.newText ( "Custom name:", 250, 160, "Arial", 60)
    customNameText:setTextColor(60/255, 50/255, 100/255)

    typeText = display.newText ( "Type:", 130, 376, "Arial", 60)
    typeText:setTextColor(60/255, 50/255, 100/255)

    classText = display.newText ( "Class:", 140, 600, "Arial", 60)
    classText:setTextColor(60/255, 50/255, 100/255)

    dueDateText = display.newText ( "Due date:", 195, 823, "Arial", 60)
    dueDateText:setTextColor(60/255, 50/255, 100/255)

    dueDateDisplayText = display.newText ( "", display.contentWidth/2, display.contentHeight/1.12, "Arial", 57)
    dueDateDisplayText:setTextColor(60/255, 50/255, 100/255)

    daysBetweenDisplayText = display.newText ("", display.contentWidth/2, display.contentHeight/1, "Arial", 60)
    daysBetweenDisplayText:setTextColor(60/255, 50/255, 100/255)

    sceneGroup:insert( customNameText )
    sceneGroup:insert( typeText )
    sceneGroup:insert( classText )
    sceneGroup:insert( dueDateText )
    sceneGroup:insert( daysBetweenDisplayText )

-----------------------------------------------------------------------------------------
-- Button widgets
-----------------------------------------------------------------------------------------   


    -- Creating a back button
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

    -----------------------------------------------------------------------------------------   

    -- Creating a type button
    typeButton = widget.newButton( 
        {   

            width = 638,
            height = 97,

            id = "typeButton",
            --label = "Add",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight/2.16,

            -- Insert the images here
            defaultFile = "Images/pink.png",
            overFile = "Images/pinkPressed.png",

            -- When the button is released, call the add screen transition function
            onRelease = typeButtonClicked          
        } )

    -----------------------------------------------------------------------------------------   

    -- Creating a class button
    classButton = widget.newButton( 
        {   

            width = 638,
            height = 97,

            id = "classButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight/1.479,

            -- Insert the images here
            defaultFile = "Images/green.png",
            overFile = "Images/greenPressed.png",

            -- When the button is released, call the add screen transition function
            onRelease = classButtonClicked          
        } )

        --classButton:toFront()

    -----------------------------------------------------------------------------------------   

    -- Creating a class button
    dueDateButton = widget.newButton( 
        {   

            width = 638,
            height = 97,

            id = "dueDateButton",

            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight/1.12,

            -- Insert the images here
            defaultFile = "Images/blue.png",
            overFile = "Images/bluePressed.png",

            -- When the button is released, call the add screen transition function
            onRelease = dueDateButtonClicked          
        } )

        -- Associating button widgets with this scene
        sceneGroup:insert( backButton )
        sceneGroup:insert( typeButton )
        sceneGroup:insert( classButton )
        sceneGroup:insert( dueDateButton )

        sceneGroup:insert( dueDateDisplayText )

end


-----------------------------------------------------------------------------------------
-- Global scene function - show, hide, destroy
-----------------------------------------------------------------------------------------



-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

-- The text over the type button that displays the selected type from the options screen
    typeOptionText = display.newText ( typeOption, display.contentWidth/2, display.contentHeight/2.18, "Georgia", 62)
    typeOptionText:setTextColor(60/255, 50/255, 100/255)
    sceneGroup:insert( typeOptionText )

    classOptionText = display.newText ( classOption, display.contentWidth/2, display.contentHeight/1.478, "Georgia", 62)
    classOptionText:setTextColor(60/255, 50/255, 100/255)
    sceneGroup:insert( classOptionText )

    dueDateDisplay( )
    --daysBetweenDisplay( )

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
-----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen 
    -- Insert code here for animations and effects

    elseif ( phase == "did" ) then  
        
        -- Create text field (horizontal, vertical, width, height)
        customNameTextField = native.newTextField( 380, 254, 635, 105 )
        customNameTextField:addEventListener("userInput", textListener)   

        if (customName ~= "") then
            customNameTextField.text = customName

        end

        print("Days between =", daysBetweenTodayAndDue)

    end
end 

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with this scene
    local sceneGroup = self.view

    local phase = event.phase

    if ( phase == "will" ) then
        customNameTextField:removeSelf()

-----------------------------------------------------------------------------------------

        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.

    elseif ( phase == "did" ) then

        
        --customNameTextField:removeEventListener("userInput", textListener)   

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