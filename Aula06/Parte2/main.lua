local h = display.contentHeight
local w = display.contentWidth
local raio = 80
local outerCircle = display.newCircle(w/2, h/2, raio)
local innerCircle = display.newCircle(w/2, h/2, raio/2)
innerCircle:setFillColor(0, 0, 1)

local xaya = display.newCircle(0,0,5)
xaya:setFillColor(1,0,0)
local xbyb = display.newCircle(0,0,5)
xbyb:setFillColor(1,0,0)

local options = {
    text = 0,
    x = w / 2,
    y = h / 4,
    font = native.systemFontBold,
    fontSize = 70
}
local angulo = display.newText(options)

local function mover(e)
    if e.phase == "began" or e.phase == "moved" then
        --code
        local xa = w / 2
        local ya = h / 2
        local xb = e.x
        local yb = e.y
        xaya.x = xa
        xaya.y = ya
        xbyb.x = xb
        xbyb.y = yb
        e.target.x = e.x
        e.target.y = e.y
        
        angle = math.atan2((ya-yb), (xb-xa))
        angle = angle * (180 / math.pi)
        angle = math.floor((angle + 360) % 360)
        print(angle)
        angulo.text = angle

    else
        --code
        e.target.x = w / 2
        e.target.y = h / 2
    end
end
innerCircle:addEventListener("touch", mover)