local physics = require('physics')
physics.start()

local w = display.contentWidth
local h = display.contentHeight
local bg = display.newImageRect("background.png", w, h)
bg.x, bg.y = w / 2, h / 2
local balao = display.newImageRect("balloon.png", 100, 100)
balao.x, balao.y = w / 2, h / 3
local plataforma = display.newImageRect("platform.png", 300, 50)
plataforma.x, plataforma.y = w / 2, h * .92

physics.addBody(balao, "dynamic")
physics.addBody(plataforma, "static")

local pontosAtual = 0
local pontosRecorde = 0

local options1 = {
    text = "Atual\n" .. pontosAtual,
    x = w / 4,
    y = h / 5,
    font = native.systemFontBold,
    fontSize = 32,
    align = "center"
}
local texto1 = display.newText(options1)

local options2 = {
    text = "Recorde\n" .. pontosRecorde,
    x = w / 4 * 3,
    y = h / 5,
    font = native.systemFontBold,
    fontSize = 32,
    align = "center"
}
local texto2 = display.newText(options2)

local path = system.pathForFile( "recorde.txt", system.DocumentsDirectory )
--Ler o arquivo para verificar o recorde
local file, errorString = io.open( path, "r" )
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Output lines
    for line in file:lines() do
        print( line )
        pontosRecorde = line
        pontosRecorde = tonumber(pontosRecorde)
        texto2.text = "Recorde\n" .. pontosRecorde
    end
    -- Close the file handle
    io.close( file )
end
file = nil


local function push(e)
    e.target:applyLinearImpulse(0, -1, e.target.x, e.target.y)
    pontosAtual = pontosAtual + 1
    texto1.text = "Atual\n" .. pontosAtual
    if pontosAtual >= pontosRecorde then
        pontosRecorde = pontosAtual
    end
    texto2.text = "Recorde\n" .. pontosRecorde

    --manipulação de arquivo começa aqui
    local file, errorString = io.open( path, "w" )
    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Write data to file
        file:write( pontosRecorde )
        -- Close the file handle
        io.close( file )
    end
    file = nil
end

balao:addEventListener("tap", push)