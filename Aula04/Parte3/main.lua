local physics = require('physics')
physics.start()
physics.setGravity(0,5)

local width = 320
local height = 480
local lado = 80

local quadrado1 = display.newRect(0, 0, lado, lado);
quadrado1.x = display.contentWidth * .3
quadrado1.y = display.contentHeight * .3
quadrado1.name = "quadrado1"
quadrado1:rotate(45)
physics.addBody(quadrado1, "static")

local quadrado2 = display.newRect(0, 0, lado, lado);
quadrado2.x = display.contentWidth * .75
quadrado2.y = display.contentHeight * .5
quadrado2.name = "quadrado2"
quadrado2:rotate(45)
physics.addBody(quadrado2, "static")

local options1 = {
    text = "1",
    x = quadrado1.x,
    y = quadrado1.y,
    font = native.systemFont,
    fontSize = 24
}

local options2 = {
    text = "2",
    x = quadrado2.x,
    y = quadrado2.y,
    font = native.systemFont,
    fontSize = 24
}

local texto1 = display.newText(options1)
texto1:setFillColor(0,0,0)
local texto2 = display.newText(options2)
texto2:setFillColor(0,0,0)


local bola = display.newCircle(0, 0, 25)
bola.x = width / 2
bola.y = height * .1
bola.name = "bola"
physics.addBody(bola, "dynamic", { radius = 25})

local function globalCollision(event)
    print( event.object1.name )       --the first object in the collision
    print( event.object2.name )       --the second object in the collision
    return true
end

local function localCollision(self, event)
    if event.phase == "ended" then
        --print( self.name )            --the first object in the collision
        --print( event.other.name )         --the second object in the collision
        --event.other:setFillColor(1, 0, 0)
        --self:setFillColor(0, 0, 1)
        if event.other.name == "quadrado2" then
            event.other:setFillColor(0, 1, 0)
            timer.performWithDelay(1, function() 
                self.y = height * .1
                self.x = 160
                self:setLinearVelocity(0,0)
            end)
        end
    end

    return true
end

--Runtime:addEventListener("collision", globalCollision)
bola.collision = localCollision
bola:addEventListener("collision")