local physics = require('physics')
physics.start()
physics.setGravity(0,0)

local w = display.contentWidth
local h = display.contentHeight
local campo = display.newImageRect("soccer.png", w, h)
campo.x, campo.y = w / 2, h / 2
local pessoa = display.newImageRect("people.png", 190/2, 106/2)
pessoa.x, pessoa.y = w / 2, h * 3/4
pessoa.name = "pessoa"
local bola = display.newImageRect("ball.png", 25, 25)
bola.x, bola.y = w / 2, h / 2
bola.name = "bola"

local gols = {}
gols[1] = display.newRect(w / 2, 5, 90, 1)
gols[1].name = "golCima"
gols[2] = display.newRect(w / 2, 475, 90, 1)
gols[2].name = "golBaixo"

physics.addBody(gols[1], "static")
physics.addBody(gols[2], "static")
physics.addBody(pessoa, "dynamic", {radius = 25})
physics.addBody(bola, "dynamic", {radius = 25})

local botoes = {} -- cria uma lista vazia
botoes[1] = display.newImageRect("arrow.png", 35, 35) --right
botoes[1].x, botoes[1].y = 285, 430
botoes[1].name = "right"
botoes[2] = display.newImageRect("arrow.png", 35, 35) --left
botoes[2].x, botoes[2].y = 235, 430
botoes[2].rotation = 180
botoes[2].name = "left"
botoes[3] = display.newImageRect("arrow.png", 35, 35) --up
botoes[3].x, botoes[3].y = 260, 395
botoes[3].rotation = 270
botoes[3].name = "up"
botoes[4] = display.newImageRect("arrow.png", 35, 35) --down
botoes[4].x, botoes[4].y = 260, 460
botoes[4].rotation = 90
botoes[4].name = "down"

local passoX, passoY = 0, 0
local golsCima, golsBaixo = 0, 0

local options = {
    text = "0 x 0",
    x = w / 2,
    y = -40,
    font = native.systemFontBold,
    fontSize = 58
}
local placar = display.newText(options)
placar:setFillColor(0, 1, 0)

local function movimentacao(e)
    if e.phase == "began" or e.phase == "moved" then
        --code
        if e.target.name == "right" then
            --code
            passoX = 5
            pessoa.rotation = 90
        elseif e.target.name == "left" then
            --code
            passoX = -5
            pessoa.rotation = 270
        elseif e.target.name == "up" then
            --code
            passoY = -5
            pessoa.rotation = 0
        elseif e.target.name == "down" then
            --code
            passoY = 5
            pessoa.rotation = 180
        end
    elseif e.phase == "ended" or e.phase == "cancelled" then
        --code
        passoX, passoY = 0, 0
    end
end

local function update (e)
    --code update
    pessoa.x = pessoa.x + passoX
    pessoa.y = pessoa.y + passoY
end

for i=1, 4 do
    botoes[i]:addEventListener("touch", movimentacao)
end

local function marcarGols (e)
    if e.phase == "began" and e.object1.name == "golCima" and e.object2.name == "bola" then
        print("Gol do time de baixo")
        golsBaixo = golsBaixo + 1
        placar.text = golsBaixo .. " x " .. golsCima
        timer.performWithDelay(1, function()
            bola.x, bola.y = w / 2, h / 2
    
        end)
    elseif e.phase == "began" and e.object1.name == "golBaixo" and e.object2.name == "bola" then
        print("Gol do time cima")
        golsCima = golsCima + 1
        placar.text = golsBaixo .. " x " .. golsCima
        timer.performWithDelay(1, function()
            bola.x, bola.y = w / 2, h / 2
    
        end)
    end
    
end

Runtime:addEventListener("collision", marcarGols)

Runtime:addEventListener("enterFrame", update)