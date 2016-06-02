
-- Version 1 : Smart Agenda
-- File : main.lua
-- Created by Laura Aubin
-- Created on January 08, 2016
-- Description: Program start automatically calls the splash screen.


-- Delete entire tasks
-- Add new tasks! 
-- Text field errors

-- FONT:
-- Arial
-- Times New Roman
-- Verdana
-- Georgia
-- Helvetica
-- Impact 
-- Droid Sans

-- add to scene
-- hide and show ish.. 0.01 at calendar hide/show

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
composer.gotoScene( "Main Menu.main_menu", {effect = "flipFadeOutIn", time = 1500})