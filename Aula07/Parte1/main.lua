local w = display.contentWidth
local h = display.contentHeight

--imagens de fundo
local fundo = display.newRect(0,0,w,h)
fundo.x = w / 2
fundo.y = h / 2
-- local face = display.newImageRect("facewatch.png", 300, 300)
-- face.x = w / 2
-- face.y = h / 2

local options = {
    text = "Hora\nMinutos\nSegundos",
    x = w * 1 / 4,
    y = h * 1 / 3,
    font = native.systemFont,
    fontSize = 30,
    align = "right"
}
local texto = display.newText(options)
texto:setFillColor(0,0,0)

local options2 = {
    text = "Hora",
    x = w * 3 / 4,
    y = h * 1 / 3,
    font = native.systemFont,
    fontSize = 30,
    align = "left"
}
--os.date()
local timetable = os.date("*t") 
local texto2 = display.newText(options2)
texto2:setFillColor(0,0,0)
texto2.text = timetable.hour .. "\n" .. timetable.min .. "\n" .. timetable.sec

--atualizar o relógio a cada segundo
local function atualiza(e)
    --os.date()
    local timetable = os.date("*t")
    texto2.text = timetable.hour .. "\n" .. timetable.min .. "\n" .. timetable.sec
end
timer.performWithDelay(1000, atualiza, 0)

--ponteiros

--movimentação dos ponteiros