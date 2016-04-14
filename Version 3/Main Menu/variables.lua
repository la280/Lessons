
-- Use composer library
local composer = require( "composer" )

-- Name this scene
sceneName = "variables"


---------------------------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
---------------------------------------------------------------------------------------------------------


customName = "1"
typeOption = ""
classOption = ""
todayTask = ""
additionalTasks = ""
okayButton = ""

customNameTextField = ""

dailyEndTime = ""
now = os.time()

-- The number of days from today until the due date
timeSpan = 1

-- Create a variable that prevents the daily workload from repeating
callCheck = ""
currentStep = "0"



