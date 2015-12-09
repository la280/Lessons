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
local radiusOfCircle = 80
local areaOfCircle

-- Set the background colour
display.setDefault("background", 160/255, 180/255, 250/255)

-- Draw the rectangle - Location (x, y, width, height)
myRectangle = display.newRect(159, 80, widthOfRectangle, heightOfRectangle)
-- Fill colour for rectangle
myRectangle:setFillColor(240/255, 170/255, 60/255)
-- Stroke size
myRectangle.strokeWidth = 10
-- Stroke colour
myRectangle:setStrokeColor(230/255, 240/255, 60/255)

-- Calculate area of a rectangle
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- Display text on the screen for area of a rectangle (string..item, location (x,y), font, size)
areaText = display.newText("The area is "..areaOfRectangle.. " \n   pixels squared.", 168, 185, nil, 27)
widthOfRectangle = display.newText("width = "..widthOfRectangle, 160, 8, nil, 24)
heightOfRectangle = display.newText("height = "..heightOfRectangle, 80, 80, nil, 24)

-- Text colour
areaText:setTextColor(50/255, 100/255, 190/255)
widthOfRectangle:setTextColor(50/255, 100/255, 190/255)
heightOfRectangle:setTextColor(50/255, 100/255, 190/255)



-- Area of a circle 
backgroundRect = display.newRect(157, 400, 400, 280)
backgroundRect:setFillColor(180/255, 140/255, 230/255)

-- Draw the circle
myCircle = display.newCircle( 155, 375, radiusOfCircle )
-- Fill colour for circle
myCircle:setFillColor(240/255, 170/255, 60/255)
-- Stroke size
myCircle.strokeWidth = 10
-- Stroke colour
myCircle:setStrokeColor(230/255, 240/255, 60/255)

-- Calculate area of a circle
areaOfCircle = PI * (radiusOfCircle ^ 2)

-- Display text on the screen for area of a circle (string..item, location (x,y), font, size)
areaText = display.newText("The area is "..areaOfCircle.. " \n   pixels squared.", 168, 489, nil, 27)
radiusOfCircle = display.newText("radius = "..radiusOfCircle, 100, 370, nil, 24)
PI = display.newText("PI = "..PI, 65, 280, nil, 24)

-- Text colour
areaText:setTextColor(60/255, 110/255, 130/255)
radiusOfCircle:setTextColor(60/255, 110/255, 130/255)
PI:setTextColor(60/255, 110/255, 130/255)