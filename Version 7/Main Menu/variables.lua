

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
-- GLOBAL VARIABLES
---------------------------------------------------------------------------------------------------------

EditOption1_Scene = "hide"

---------------------------------------------------------------------------------------------------------
-- Main Menu text
---------------------------------------------------------------------------------------------------------

customName = ""
typeOption = ""
classOption = ""
classOption1 = "English"
classOption2 = "Math"
classOption3 = "Chemistry"
classOption4 = "Biology"
classOption5 = "Physics"
classOption6 = "Art"
classOption7 = "Business"
classOption8 = "Tech"
classOption9 = "Other"
todayTask = ""
additionalTasks = ""
okayButton = ""
countNumber = 0

customNameTextField = ""

---------------------------------------------------------------------------------------------------------
-- Tasks
---------------------------------------------------------------------------------------------------------

bookEssayTaskNumber = ""
option2TaskNumber = ""
-- Manipulated tasks number in the settings
bookEssayTasksNumber = ""

-- Which task the book essay is on, 0 = nothing
specifiedTask = ""
specifiedTask2 = ""

---------------------------
-- Edit existing tasks
---------------------------
-- New individual task
addNewTask = ""
newTaskTextField = ""
-- It's new position
newTaskPosition = ""
newTaskPositionTextField = ""
---------------------------

---------------------------
-- Create new task
---------------------------
-- When creating a new and unique test from scratch
NewTaskName = ""
individualTaskName = ""
taskPostition = ""

---------------------------------------------------------------------------------------------------------
-- Tables
---------------------------------------------------------------------------------------------------------

table1Name = ""
table2Name = ""

option2TableAmount = ""

---------------------------------------------------------------------------------------------------------
-- Time
---------------------------------------------------------------------------------------------------------

dailyEndTime = ""
now = os.time()

-- The number of days from today until the due date
timeSpan = 1
time = 1
time2 = 1
timeCapsolated = 0

one = 1

A = 0
B = 0

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

daysFromOurMonth = daysFromMay

---------------------------------------------------------------------------------------------------------
-- Date
---------------------------------------------------------------------------------------------------------

--dayNumber = ""
dayNumber = 0
monthNumber = 4
daysBetweenTodayAndDue = 0
daysBetweenTodayAndDue2 = 0

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
daysFromOctober = 304
daysFromNovember = 334
daysFromDecember = 365

daysFromOurMonth = daysFromMay 

weekDayName = ""
weekDayName1 = ""
weekDayName2 = ""
weekDayName3 = ""
weekDayName4 = ""
weekDayNameNumber = ""

---------------------------------------

if ( os.date("%A") == "Monday") then

	weekDayNameNumber = 1

elseif ( os.date("%A") == "Tuesday") then

	weekDayNameNumber = 2

elseif ( os.date("%A") == "Wednesday") then

	weekDayNameNumber = 3

elseif ( os.date("%A") == "Thursday") then

	weekDayNameNumber = 4

elseif ( os.date("%A") == "Friday") then

	weekDayNameNumber = 5

elseif ( os.date("%A") == "Saturday") then

	weekDayNameNumber = 6

elseif ( os.date("%A") == "Sunday") then

	weekDayNameNumber = 7
end

-----------------------------------------------

function weekDayNameFunction ()

	if ( weekDayNameNumber == 1 ) then

		weekDayName = "MON"
		weekDayName1 = "SAT"
		weekDayName2 = "SUN"
		weekDayName3 = "TUES"
		weekDayName4 = "WED"

	elseif ( weekDayNameNumber == 2 ) then
		
		weekDayName = "TUES"
		weekDayName1 = "SUN"
		weekDayName2 = "MON"
		weekDayName3 = "WED"
		weekDayName4 = "THU"

	elseif ( weekDayNameNumber == 3 ) then
		
		weekDayName = "WED"
		weekDayName1 = "MON"
		weekDayName2 = "TUES"
		weekDayName3 = "THU"
		weekDayName4 = "FRI"

	elseif ( weekDayNameNumber == 4 ) then
		
		weekDayName = "THU"
		weekDayName1 = "TUES"
		weekDayName2 = "WED"
		weekDayName3 = "FRI"
		weekDayName4 = "SAT"

	elseif ( weekDayNameNumber == 5 ) then
		
		weekDayName = "FRI"
		weekDayName1 = "WED"
		weekDayName2 = "THU"
		weekDayName3 = "SAT"
		weekDayName4 = "SUN"

	elseif ( weekDayNameNumber == 6 ) then
		
		weekDayName = "SAT"
		weekDayName1 = "THU"
		weekDayName2 = "FRI"
		weekDayName3 = "SUN"
		weekDayName4 = "MON"

	elseif ( weekDayNameNumber == 7 ) then
		
		weekDayName = "SUN"
		weekDayName1 = "FRI"
		weekDayName2 = "SAT"
		weekDayName3 = "MON"
		weekDayName4 = "TUES"
	end
end

weekDayNameFunction ()

---------------------------------------------------------------------------------------------------------
-- Intial settings
---------------------------------------------------------------------------------------------------------

-- Create a variable that prevents the daily workload from repeating
callCheck = ""
currentStep = "0" 

dailyWorkLoad = 0
dailyWorkLoad2 = 0
dailyWorkLoadValue = 0 
dailyWorkLoadValue2 = 0