require "libs.classic"

Ball = Object:extend()

function Ball:new()
    self.speed = 0
    self.radius = 0
    self.xPosition = 0 
    self.yPosition = 0
    self.xDirection = 0 * self.speed
    self.yDirection = 0 * self.speed
end

function Ball:checkCollision()
    -- Here we check for collision with walls if no paddle object is passed, and check collision with paddle if one is given. We return the result for some other code to handle what to do.

    -- "rightWall", "leftWall", "topWall", "bottomWall"

    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

   return ""
end

function Ball:move(millisecondsBetweenFrame)
end

function Ball:draw()
    love.graphics.circle("line",
                         self.xPosition,
                         self.yPosition,
                         self.radius)
end
