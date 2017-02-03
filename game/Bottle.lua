local composer = require("composer")
local physics  = require("physics")
local utils    = require("lib.utils")

local function colision(self, event)
    if not self.isVisible then
        return
    end
    if event.phase == "began" and event.other.isPlayer then
        local player = event.other
        self.isVisible = false
        player:increaseRotationSpeed(self.speedUpRatio, self.speedUpDuration)
    end
end

local function constructor()
    -- TODO: Починить спрайт бутылки
    self = display.newImage("assets/bottle.png")
    physics.addBody(self, {
        isSensor = true,
    })

    self.x = 50
    self.y = 70
    self.angularVelocity = 360
    self.speedUpDuration = 10000
    self.speedUpRatio = 2

    self.collision = colision

    self:addEventListener("collision")
    return self
end

return constructor