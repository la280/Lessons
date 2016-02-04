-- 1- Hello World

-- Created by Laura Aubin
-- Created on November 4, 2015
-- This program displays Hello, World!

-- Your code here

-- Debugging purposes only
print ("Hello, World!")

-- Create local variable
local textObject
local myFirst
local program
local madeIn
local name

-- Display text on screen: "String" : place : font : size
textObject = display.newText ( "Hello, World!", 360, 360, "AvantGarde Md BT", 90)
myFirst = display.newText ( "My first", 215, 265, nill, 65)
program = display.newText ( "program", 500, 445, nill, 65)
madeIn = display.newText ( "Made in Lua using Corona and Sublime", 375, 1100, nill, 40)
name = display.newText ( "By Laura Aubin", 165, 1040, nill, 40)

-- Change text color in RGB colors (Red, Green, Blue)
textObject:setTextColor(30/255, 30/255, 90/255)
program:setTextColor(255/255, 200/255, 90/255)
name:setTextColor(30/255, 30/255, 90/255)

-- Change the background colour
display.setDefault("background", 150/255, 150/255, 200/255)