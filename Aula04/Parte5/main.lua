local physics = require("physics")
physics.start()
physics.setGravity(0, 4)

local w = display.contentWidth
local h = display.contentHeight
local bola = display.newCircle(0, 0, 25)
bola.x = w * .1
bola.y = h * .1
physics.addBody(bola, "dynamic", {radius = 25})

local base = display.newRect(0, 0, 250, 20)
base.x = w * .9
base.y = h * .9
physics.addBody(base, "static")

local function desenhaLinha(event)
    if event.phase == "moved" then
        local pingo = display.newCircle(event.x, event.y, 5)
        physics.addBody(pingo, "static")
    end
    return true
end

Runtime:addEventListener("touch", desenhaLinha)