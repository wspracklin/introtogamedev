require "libs.classic"

Ball = Object:extend()

function Ball:new()
    self.speed = 200
    self.radius = 10
    self.xPosition = love.graphics.getWidth() / 2 
    self.yPosition = love.graphics.getHeight() / 2 
    self.xDirection = 1 * self.speed
    self.yDirection = 0 * self.speed
    self.screenWidth = love.graphics.getWidth()
    self.screenHeight = love.graphics.getHeight()
end

function Ball:checkCollision()
    -- Here we check for collision with walls if no paddle object is passed, and check collision with paddle if one is given. We return the result for some other code to handle what to do.

    -- "rightWall", "leftWall", "topWall", "bottomWall"

    if self.xPosition >= self.screenWidth then return "rightWall"
    elseif self.xPosition < 0 then return "leftWall"
    end

   return ""
end

function Ball:move(millisecondsBetweenFrame)
    collision = self:checkCollision()

    if( collision == "rightWall" or collision == "leftWall" )
    then self.xDirection = self.xDirection * -1
    end

    self.xPosition = self.xPosition + self.xDirection * millisecondsBetweenFrame

end

function Ball:draw()
    love.graphics.circle("line",
                         self.xPosition,
                         self.yPosition,
                         self.radius)
end
