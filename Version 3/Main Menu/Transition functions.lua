
-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "Transition functions"


-----------------------------------------------------------------------------------------
-- TRANSITION BUTTON FUNCTIONS
-----------------------------------------------------------------------------------------


-- When the add button is clicked, call this function
function addButtonClicked( )

    composer.gotoScene( "add_screen", {effect = "zoomInOutFade", time = 500})
end

-----------------------------------------------------------------------------------------

-- Create transition function to help screen
function helpButtonClicked( )

    composer.gotoScene( "help_screen", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Create transition function to add screen by the edit button
function editButtonClicked( )

    if (customName == "") then

        popupText.isVisible = true
        popupBackground.isVisible = true
        baseBackground.isVisible = true

        okayButton.isVisible = true
        okayButton:toFront()

    else 

        composer.gotoScene( "add_screen", {effect = "flipFadeOutIn", time = 500})
    end
end
