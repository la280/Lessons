
-- Version 2 : Smart Agenda
-- File : main.lua
-- Created by Laura Aubin
-- Created on January 08, 2016
-- Description: Program start automatically calls the splash screen.


-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

print("*** Program started")

-- This is the current time as taken from this device
print( "*** OS time =", os.time() ) 

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "main_menu", {effect = "flipFadeOutIn", time = 1500})