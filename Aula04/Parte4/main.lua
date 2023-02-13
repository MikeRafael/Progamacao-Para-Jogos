local function desenhaLinha (event)
    if event.phase == "began" then
        --code
    elseif event.phase == "moved" then
        --code
        local pingo = display.newCircle(event.x, event.y, 5)
    elseif event.phase == "ended" then
        --code
    end
    return true
end


Runtime:addEventListener("touch", desenhaLinha)