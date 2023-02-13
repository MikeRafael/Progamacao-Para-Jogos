local physics = require("physics")
physics.start()
physics.setGravity(0,0)

local w = display.contentWidth
local h = display.contentHeight
local raio = 25
local lado = 50
local bola = display.newCircle(w / 2, h / 2, raio)
bola.name = "bola"
bola:setFillColor(1,0,0)
physics.addBody(bola, "dynamic", {radius = raio})
local quadrado = display.newRect(0, 0, lado, lado)
quadrado.name = "quadrado"
physics.addBody(quadrado, "static")

quadrado.x = w / 2
quadrado.y = h * .25

local function moveBola(event)
    if event.phase == "began" then
        --code began
    elseif event.phase == "moved" then
        --code moved
        event.target.x = event.x
        event.target.y = event.y
    elseif event.phase == "ended" or event.phase == "cancelled" then
        --code ended
    end
    return true
end

bola:addEventListener("touch", moveBola)

local function bolaCollision(self, event)
    if event.phase == "ended" then
        print(self.name .. " colidiu com " .. event.other.name)
    end
    return true
end

bola.collision = bolaCollision
bola:addEventListener("collision")