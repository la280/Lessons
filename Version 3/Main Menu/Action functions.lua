
-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "Action functions"


-----------------------------------------------------------------------------------------
-- ACTION FUNCTIONS
-----------------------------------------------------------------------------------------


-- Create transition function to close the popup menu
function okayButtonClicked( ) 

    baseBackground.isVisible = false
    popupBackground.isVisible = false
    popupText.isVisible = false
    okayButton.isVisible = false

    showTasksButton.isVisible = true
end 

-----------------------------------------------------------------------------------------
 
-- Create function that displays all the current task items
function tabButtonClicked( ) 

    -- Popup background that covers everything else in the scene
    baseBackground = display.newImageRect("Images/Popup/blackBase.png", display.contentWidth, display.contentHeight * 2)
    baseBackground.x = display.contentWidth/2
    baseBackground.y = display.contentHeight/2

    -- Set transparency of the background
    baseBackground.alpha = 0.4

    -- Popup box image
    popupBackground = display.newImageRect("Images/Popup/PopupBackground.png", 600, 670)
    popupBackground.x = display.contentWidth/2
    popupBackground.y = display.contentHeight/2.9

    -- Set transparency of the popup background
    popupBackground.alpha = 0.8

        if (typeOption == "Book Essay") then

            -- Overlay text
            popupText = display.newText ( "              All Tasks: \n\n 1:  Read and research \n            your book \n 2:   Review your essay \n 3:   Write a rough draft \n 4:      Edit your draft \n 5:  Write your final draft", display.contentWidth/2, display.contentHeight/3.6, "Arial", 53)
            popupText:setTextColor(10/255, 20/255, 10/255)

            showTasksButton.isVisible = false

        end

        okayButton.isVisible = true
        okayButton:toFront()
end 