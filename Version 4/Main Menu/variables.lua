

-- Version 4 : Smart Agenda
-- File : variables.lua
-- Created by Laura Aubin
-- Created on April 20, 2016
-- Description: Main menu global variables 

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "variables"

---------------------------------------------------------------------------------------------------------
-- GLOBAL VARIABLES...
---------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------
-- Main Menu text
---------------------------------------------------------------------------------------------------------

customName = ""
typeOption = ""
classOption = ""
todayTask = ""
additionalTasks = ""
okayButton = ""

customNameTextField = ""

---------------------------------------------------------------------------------------------------------
-- Time
---------------------------------------------------------------------------------------------------------

dailyEndTime = ""
now = os.time()

-- The number of days from today until the due date
timeSpan = 1
time = 0
timeCapsolated = 0

one = 1

---------------------------------------------------------------------------------------------------------
-- Date
---------------------------------------------------------------------------------------------------------

--dayNumber = ""
dayNumber = 0
monthNumber = 4
daysBetweenTodayAndDue = 0

monthName = os.date("%B")
dayNumber = os.date("%d")

-- Number of days in each month
daysInThisMonth = 30
daysInJanuary = 31
daysInFebruary = 28
daysInMarch = 31
daysInApril = 30
daysInMay = 31
daysInJune = 30
daysInJuly = 31
daysInAugust = 31
daysInSeptember = 30
daysInOctober = 31
daysInNovember = 30
daysInDecember = 31

-- Number of days in each month since the beginning of the year
daysFromThisMonth = 0

daysFromJanuary = 31
daysFromFebruary = 59
daysFromMarch = 90
daysFromApril = 120
daysFromMay = 151
daysFromJune = 181
daysFromJuly = 212
daysFromAugust = 243
daysFromSeptember = 273
daysFromOctober = 404
daysFromNovember = 434
daysFromDecember = 465

daysFromOurMonth = daysFromApril

---------------------------------------------------------------------------------------------------------
-- Intial settings
---------------------------------------------------------------------------------------------------------

-- Create a variable that prevents the daily workload from repeating
callCheck = ""
currentStep = "0" 

dailyWorkLoad = 0
dailyWorkLoadValue = 0 