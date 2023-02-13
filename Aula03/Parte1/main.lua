local physics = require("physics")
physics.start();
physics.setGravity(0,10);
local x = display.contentCenterX
local y = display.contentCenterY

local bolinha = display.newCircle(x+50, y-100, 45);
bolinha:setFillColor(0,1,0)
physics.addBody(bolinha, "dynamic", {radius=45, bounce=0.5})

-- local bolinha2 = display.newCircle(x-50, y-100, 45);
-- bolinha2:setFillColor(0,1,1)
-- physics.addBody(bolinha2, "dynamic", {radius=45, bounce=0.5})


-- local bola2 = display.newCircle(x-20, 450, 30)
-- bola2:setFillColor(1,0,0)
-- physics.addBody(bola2, "static", {radius=30, bounce=0.2})

local xb = display.contentCenterX
local yb = 460
local base = display.newRect(xb, yb, 320, 40)
physics.addBody(base,"static", {bounce=0.0, friction=1.0});
base:rotate(0)

local function printPosicao(event)
    print(bolinha.x, bolinha.y)
end

Runtime:addEventListener("enterFrame", printPosicao)

local function impulsoLinear(event)
    bolinha:applyLinearImpulse(0, -0.5, bolinha.x, bolinha.y)
end


bolinha:addEventListener("tap", impulsoLinear)