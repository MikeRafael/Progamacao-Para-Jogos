local w = display.contentWidth
local h = display.contentHeight

--imagens de fundo
local fundo = display.newRect(0,0,w,h)
fundo.x = w / 2
fundo.y = h / 2
local face = display.newImageRect("facewatch.png", 300, 300)
face.x = w / 2
face.y = h / 2
--face watch without hands

--desenhar os ponteiros
local ponteirohoras = display.newRect(0, 0, 10, 60)
ponteirohoras:setFillColor(0,0,0)
ponteirohoras.x = face.x
ponteirohoras.y = face.y
ponteirohoras.anchorX = 0.5
ponteirohoras.anchorY = 1

local ponteirominutos = display.newRect(0, 0, 10, 100)
ponteirominutos:setFillColor(0,0,0)
ponteirominutos.x = face.x
ponteirominutos.y = face.y
ponteirominutos.anchorX = 0.5
ponteirominutos.anchorY = 1

local ponteirosegundos = display.newRect(0, 0, 4, 100)
ponteirosegundos:setFillColor(1,0,0)
ponteirosegundos.x = face.x
ponteirosegundos.y = face.y
ponteirosegundos.anchorX = 0.5
ponteirosegundos.anchorY = 1

--definir a posição inicial dos ponteiros
local timetable = os.date("*t")
ponteirominutos.rotation = timetable.min * 6
ponteirosegundos.rotation = timetable.sec * 6
ponteirohoras.rotation = timetable.hour * 30 + (timetable.min * .5)

local function atualiza(e)
    local timetable = os.date("*t")
    ponteirominutos.rotation = timetable.min * 6
    ponteirosegundos.rotation = timetable.sec * 6
    ponteirohoras.rotation = timetable.hour * 30 + (timetable.min * .5)
end
timer.performWithDelay(1000, atualiza, 0)