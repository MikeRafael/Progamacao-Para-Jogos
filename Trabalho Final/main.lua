math.randomseed(os.time())
local physics = require("physics")
physics.start()

lugar = math.random(0, 260)
tamanho = math.random(40, 70)
tamanhoNave = 70
velocidade = math.random(0, 10)
physics.setGravity(0, velocidade)
local x = display.contentCenterX
local y = display.contentCenterY

-- Adicionando um fundo
local background = display.newImageRect("background.jpg", 320, 480)
background.x = x
background.y = y

-- Criando o personagem
local nave = display.newImageRect("navinha.png", tamanhoNave, tamanhoNave)
nave.x = x
nave.y = y * 1.7

-- Criando os inimigos 
inimigo = {}
local function criarInimigos(randomPosition)
    for i = 1, 1, 1 do
        inimigo[i] = display.newImageRect("inimigo.png", tamanho, tamanho)
        inimigo[i].x = lugar
        physics.addBody(inimigo[i], "dynamic")
    end
    
end
local randomPosition = lugar
local myClosure = function() return criarInimigos( randomPosition ) end
timer.performWithDelay( 2000, myClosure, 10 )
-- Adicionando física aos personagens

physics.addBody(nave, "static")

-- Criando o placar 
local options = {
    text = 0,
    x = x,
    y = 70,
    font = native.systemFont,
    fontSize = 60
}
local placar = display.newText(options)

-- Movendo meu personagem 
local function mover(event)
    if (event.phase == "began") then 

    elseif (event.phase == "moved") then
        nave.x = event.x
        nave.y = event.y

    elseif (event.phase == "ended ") then
        nave.x = event.x
        nave.y = event.y
    end
    
end

-- Criando a colisao com o personagem
local function colisao(self, event)
    if (event.phase == "began") then
        gameover = display.newImageRect("gameover.jpg", 320, 480)
        gameover.x = x
        gameover.y = y
        gameover:toFront()
    elseif (event.phase == "ended") then
        
    end
end

Runtime:addEventListener("touch", mover)
nave.collision = colisao
nave:addEventListener("collision")
--Runtime:addEventListener("enterFrame", criarInimigos)


