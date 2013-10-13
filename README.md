Baseball Parser Version 2 (Fangraphs Parser)
-------------------------------------------
This parser exclusivly parses fangraphs.com using the libxml parser to crawl and sort data from fangraphs.com
It is a Mac OS X application written in Cocoa and Objective-C

Improvements Over Version 1
------------
The way it parses is it downloads the player data then sends the Webpage to seperate modules which run on different threads to parse and format the data.
After the data is parsed new formatted data is sent to the AppController which handles the gui.

Fangraphs Parser is written with modularization and object oriented design in mind. 
The code is far cleaner and better commented than version 1.

Current UI
--------------
![alt tag](http://cl.ly/Rv3R/Screen%20Shot%202013-10-13%20at%204.16.29%20PM.png)

To be implemented
-------------
UI for Duplicate Items
Make Custom Searchbox with Autocomplete
Add Images and Independed operations for Images

Hitters:
Advanced Stats
Batted Ball
More Batted Ball
Pitch Type
Pitch Type
Pitchf/x Pitch Type
Pitchf/x Pitch Velocity
Plate Dicipline
Fielding
Advanced Fielding
Fans Scouting Report
Value
Contracts

Pitchers:
Standard
Advanced Stats
Batted Ball 
More Batted Ball
Win Probability
Pitch Type
Pitchf/x Pitch Type
Pitchf/x Pitch Velocity
Pitch Value
Plate Dicipline
Fielding
Advanced Fielding
Value
