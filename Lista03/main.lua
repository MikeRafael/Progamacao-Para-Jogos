local physics = require("physics")
physics.start()

local x = display.contentCenterX
local y = display.contentCenterY
local background = display.newImageRect("background.png", 320, 480)

background.x = x
background.y = y

local balao = display.newImageRect("balao.png", 112, 112)
balao.x = x
balao.y = y - 50
physics.addBody(balao, "dynamic", {radius = 56})

local base = display.newImageRect("plataforma.png", 300, 50)
base.x = x
base.y = 450
physics.addBody(base, "static")

local options = {
    text = 0,
    x = x,
    y = 70,
    font = native.systemFont,
    fontSize = 60
}
local placar = display.newText(options)

local function impulsoLinear(event)
    balao:applyLinearImpulse(0, -1, balao.x, balao.y)
end

local function contadorTap(event)
    placar.text = placar.text + 1
end

local function fundo(event)
    if (tonumber(placar.text) == 10) then
        background = display.newImageRect("fundo2.jpg", 320, 480)
        background.x = x
        background.y = y
        balao:toFront()
        base:toFront()
        placar:toFront()

    end
end

local function fundo2(event)
    if (tonumber(placar.text) == 20) then
        background = display.newImageRect("fundo3.jpg", 320, 480)
        background.x = x
        background.y = y
        balao:toFront()
        base:toFront()
        placar:toFront()
    end
end

local function fundo3(event)
    if (tonumber(placar.text) == 30) then
        background = display.newImageRect("fundo4.jpg", 320, 480)
        background.x = x
        background.y = y
        balao:toFront()
        base:toFront()
        placar:toFront()
    end
end

local function colisao(self, event)
    if (event.phase == "began") then
        print("inicio da colisão")
        background = display.newImageRect("gameover.jpg", 320, 480)
        background.x = x
        background.y = y
    elseif (event.phase == "ended") then
        print("Termino da colisão")
    end
end

balao.collision = colisao
balao:addEventListener("collision")
balao:addEventListener("tap", impulsoLinear)
balao:addEventListener("tap", contadorTap)
Runtime:addEventListener("enterFrame", fundo)
Runtime:addEventListener("enterFrame", fundo2)
Runtime:addEventListener("enterFrame", fundo3)