local w = display.contentWidth
local h = display.contentHeight
local campo = display.newImageRect("soccer.png", w, h)
campo.x, campo.y = w / 2, h / 2

--Sprites
--Sprite sheet
local sheetData = {
    width = 45, --135px, 3 frames, 135/3 = 45
    height = 63, --255px, 4 frames, 255/4 = 63
    numFrames = 12
}

local sheet = graphics.newImageSheet("gaara.png", sheetData)

--Animations sequences
local sequences = {
    {name = "paradoBaixo", start = 1, count = 1, time = 300, loopCount = 1, loopDirection = 'forward'},
    {name = "paradoEsquerda", start = 4, count = 1, time = 300, loopCount = 1, loopDirection = 'forward'},
    {name = "paradoDireita", start = 7, count = 1, time = 300, loopCount = 1, loopDirection = 'forward'},
    {name = "paradoCima", start = 10, count = 1, time = 300, loopCount = 1, loopDirection = 'forward'},
    {name = "andandoBaixo", start = 2, count = 2, time = 300, loopCount = 0, loopDirection = 'forward'},
    {name = "andandoEsquerda", start = 5, count = 2, time = 300, loopCount = 0, loopDirection = 'forward'},
    {name = "andandoDireita", start = 8, count = 2, time = 300, loopCount = 0, loopDirection = 'forward'},
    {name = "andandoCima", start = 11, count = 2, time = 300, loopCount = 0, loopDirection = 'forward'}
}

--Sprite object, junta sprite sheet com animation sequence
local pessoa = display.newSprite(sheet, sequences)
pessoa.x = w / 2
pessoa.y = h / 2
pessoa:scale(1.5, 1.5)


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

local options = {
    text = "0 x 0",
    x = w / 2,
    y = -40,
    font = native.systemFontBold,
    fontSize = 58
}

local function movimentacao(e)
    if e.phase == "began" or e.phase == "moved" then
        if e.target.name == "right" then
            passoX = 5
            pessoa:setSequence("andandoDireita")
        elseif e.target.name == "left" then
            passoX = -5
            pessoa:setSequence("andandoEsquerda")
        elseif e.target.name == "up" then
            passoY = -5
            pessoa:setSequence("andandoCima")
        elseif e.target.name == "down" then
            passoY = 5
            pessoa:setSequence("andandoBaixo")
        end
    elseif e.phase == "ended" or e.phase == "cancelled" then
        passoX, passoY = 0, 0
        if e.target.name == "right" then
            pessoa:setSequence("paradoDireita")
        elseif e.target.name == "up" then 
            pessoa:setSequence("paradoCima")
        else
            pessoa:setSequence("paradoBaixo")
        end
    end
end

local function update (e)
    --code update
    pessoa.x = pessoa.x + passoX
    pessoa.y = pessoa.y + passoY
    pessoa:play()
end

for i=1, 4 do
    botoes[i]:addEventListener("touch", movimentacao)
end

pessoa:setSequence("paradoBaixo")

Runtime:addEventListener("enterFrame", update)