
-- Version 3 : Smart Agenda
-- File : _Background colours
-- Created by Laura Aubin
-- Created on April 13, 2016
-- Description: Background colour dots

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-- Use widget library
local widget = require( "widget" )

-- Create the scene object
local scene = composer.newScene( sceneName )

-- Name this scene
sceneName = "Background colours"


---------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------


local blackDotButton
local whiteDotButton
local blueDotButton
local greenDotButton
local purpleDotButton
local redDotButton


-----------------------------------------------------------------------------------------
-- TRANSITION BUTTON FUNCTIONS
-----------------------------------------------------------------------------------------


-- Create background colour change function - black
function blackButtonClicked( ) 

    display.setDefault("background", 30/255, 30/255, 30/255)
end 

-----------------------------------------------------------------------------------------

-- Create background colour change function - white
function whiteButtonClicked( ) 

    display.setDefault("background", 250/255, 250/255, 250/255)
end 

-----------------------------------------------------------------------------------------

-- Create background colour change function - blue
function blueButtonClicked( ) 

    display.setDefault("background", 35/255, 115/255, 230/255)
end 

-----------------------------------------------------------------------------------------

-- Create background colour change function - green
function greenButtonClicked( ) 

    display.setDefault("background", 35/255, 230/255, 90/255)
end 

-----------------------------------------------------------------------------------------

-- Create background colour change function - purple
function purpleButtonClicked( ) 

    display.setDefault("background", 150/255, 65/255, 230/255)
end 

-----------------------------------------------------------------------------------------

-- Create background colour change function - red
function redButtonClicked( ) 

    display.setDefault("background", 230/255, 30/255, 35/255)
end 