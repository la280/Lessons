-- 2- Area

-- Created by Laura Aubin 

-- Created on November 10, 2015

-- This program calculates the area of a rectangle and a circle.

-- Local variables for the rectangle
local areaText
local myRectangle
local widthOfRectangle = 230
local heightOfRectangle = 100
local areaOfRectangle 

-- Local variables for the circle
local backgroundRect
local PI = 3.14
local myCircle
local radiusOfCircle = 4

-- Set the background colour
display.setDefault("background", 160/255, 180/255, 250/255)

-- Draw the rectangle - Location (x, y, width, height)
myRectangle = display.newRect(159, 80, widthOfRectangle, heightOfRectangle)

-- Stroke size
myRectangle.strokeWidth = 10

-- Fill colour for rectangle
myRectangle:setFillColor(240/255, 190/255, 60/255)

-- Stroke colour
myRectangle:setStrokeColor(230/255, 240/255, 60/255)

-- Calculate area of a rectangle
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- Display text on the screen for area of a rectangle (string..item, location (x,y), font, size)
areaText = display.newText("The area is "..areaOfRectangle.. " \npixels2.", 160, 190, nil, 28)
widthOfRectangle = display.newText("width = "..widthOfRectangle, 160, 8, nil, 24)
heightOfRectangle = display.newText("height = "..heightOfRectangle, 80, 80, nil, 24)

-- Text colour
areaText:setTextColor(50/255, 100/255, 190/255)
widthOfRectangle:setTextColor(50/255, 100/255, 190/255)
heightOfRectangle:setTextColor(50/255, 100/255, 190/255)

-- Area of a circle 
backgroundRect = display.newRect(159, 400, 400, 280)
backgroundRect:setFillColor(180/255, 160/255, 220/255)

-- Draw the circle
myCircle = display.newCircle(160, 200)