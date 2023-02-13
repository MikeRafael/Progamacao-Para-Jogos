local physics = require("physics")
physics.start()

local x = display.contentCenterX
local y = display.contentCenterY
local background = display.newImageRect("background.png", 320, 480)
background.x = x
background.y = y

local balloon = display.newImageRect("balloon.png", 112, 112)
balloon.x = x
balloon.y = y - 50
physics.addBody(balloon, "dynamic", {radius = 56})

local base = display.newImageRect("platform.png", 300, 50)
base.x = x
base.y = 450
physics.addBody(base,"static");

local options = {
    text = "0",
    x = x,
    y = 70,
    font = native.systemFont,
    fontSize = 60
}
local placar = display.newText(options)