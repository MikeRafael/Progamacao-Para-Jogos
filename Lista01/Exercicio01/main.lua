local ret1 = display.newRect(0,0, 320, 40);
ret1.anchorX = 0
ret1.anchorY = 0
ret1.x = 0
ret1.y = 30
ret1:setFillColor(47/255, 56/255, 0)


local ret2 = display.newRect(0,0, 160, 205);
ret2.anchorX = 0
ret2.anchorY = 0
ret2.x = 0
ret2.y = 70
ret2:setFillColor(208/255, 41/255, 0)

local ret3 = display.newRect(0,0, 160, 205);
ret3.anchorX = 1
ret3.anchorY = 1
ret3.x = 320
ret3.y = 480
ret3:setFillColor(6/255, 149/255, 140/255)

local ret4 = display.newRect(0,0, 160, 205);
ret4.anchorX = 0
ret4.anchorY = 0
ret4.x = 0
ret4.y = 275
ret4:setFillColor(29/255, 116/255, 243/255)

local ret5 = display.newRect(0,0, 160, 205);
ret5.anchorX = 1
ret5.anchorY = 1
ret5.x = 320
ret5.y = 275
ret5:setFillColor(251/255, 163/255, 185/255)

local options = {
    text = "Knock",
    x = 160,
    y = 50, 
    font = native.systemFontBold,
    fontSize = 24
}
local on = {
    text = "On",
    x = 211,
    y = 50, 
    font = native.systemFont,
    fontSize = 24
}


local texto = display.newText(options)
local texto2 = display.newText(on)

local stop = {
    text = "Stop the app",
    x = 80,
    y = 170, 
    font = native.systemFont,
    fontSize = 18
}
local stop = display.newText(stop)

local settings = {
    text = "Settings",
    x = 240,
    y = 170, 
    font = native.systemFont,
    fontSize = 18
}
local settings = display.newText(settings)

local get = {
    text = "Get the pro version",
    x = 80,
    y = 380, 
    font = native.systemFont,
    fontSize = 18
}
local get = display.newText(get)

local try = {
    text = "try floofl",
    x = 240,
    y = 380, 
    font = native.systemFont,
    fontSize = 18
}
local try = display.newText(try)

