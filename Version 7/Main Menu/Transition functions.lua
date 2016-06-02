

-- Version 4 : Smart Agenda
-- File : Transition functions.lua
-- Created by Laura Aubin
-- Created on April 19, 2016
-- Description: Main menu, transition functions for changing scenes

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "Transition functions"


-----------------------------------------------------------------------------------------
-- TRANSITION BUTTON FUNCTIONS
-----------------------------------------------------------------------------------------
--**********************************8
-- gLOBAL VS LOCAL REPEATS!!!!!!

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

-----------------------------------------------------------------------------------------

-- Create button on the today text that takes the user to the task_details screen
function moreButtonClicked( ) 

    composer.gotoScene( "task_details", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Create button on the today text that takes the user to the settings screen
function settingsButtonClicked( ) 

    composer.gotoScene( "Settings.settings_menu", {effect = "flipFadeOutIn", time = 500})
end 