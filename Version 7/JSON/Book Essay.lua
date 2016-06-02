
-- Version 4 : Smart Agenda
-- File : Book Essay.lua
-- Created by Laura Aubin
-- Created on April 28, 2016
-- Description: JSON for tasks


-----------------------------------------------------------------------------------------
-- INITIALIZE TABLE
-----------------------------------------------------------------------------------------

-- Create empty table
t = {}

-- Assign numerical values into table
t[1] = "Research book"
t[2] = "Review essay's"
t[3] = "Rough draft" 
t[4] = "Edit draft"
t[5] = "Final draft"
t[6] = nil

table1Name = "Book Essay"

bookEssayTasksNumber = table.maxn(t)


-----------------------------------------------------------------------------------------
-- WRITE TO NEW FILE
-----------------------------------------------------------------------------------------


--display.newText(t[1], 200, 200) 

local json = require "json"

local jsonString = json.encode( t )

-- Path for the file to write
local path = system.pathForFile( "myfile.json", system.DocumentsDirectory )

-- Open the file handle, write
local file, errorString = io.open( path, "w" )

if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Write data to file
    file:write( jsonString )
    -- Close the file handle
    io.close( file )
end

file = nil

--local t = json.decode( jsonFile( "myfile.json" ) )


-----------------------------------------------------------------------------------------
-- READ FILE CONTENTS
-----------------------------------------------------------------------------------------


-- Open the file handle, read
local file, errorString = io.open( path, "r" )

if not file then
    -- Error occurred; output the cause
    print( "*** File error: " .. errorString )
else
    -- read data
    contents = file:read ("*a") 

    -- Close the file handle
    io.close( file )
end

file = nil

local endTable = json.decode( contents )


-----------------------------------------------------------------------------------------
-- MANIPULATE TABLE CONTENTS 
-----------------------------------------------------------------------------------------


--display.newText(endTable[2], 200, 300)
--t[1] = nil 

-- t2 = {}
-- table.insert(t2, "one")
-- table.insert(t2, "two")
-- table.insert(t2, "three")

-- Insert new name into t2 table, into the 1 spot 
-- Pushes all others down 
-- table.insert(t2, 2, "apple")

-- print("*** 1=", t2[1])
-- print("*** 2=", t2[2])
-- print("*** 3=", t2[3])
-- print("*** 4=", t2[4])

--length - 2
-- amount in table 

-- Table t, location, name
--table.remove(t, table.indexOf( t, "Research book" ), "Research book")