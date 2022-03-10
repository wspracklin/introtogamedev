require "libs.classic"

Ball = Object:extend()

function Ball:new()
    self.speed = 300
    self.radius = 5
    self.position = { x = love.graphics.getWidth() / 2,
                      y = love.graphics.getHeight() / 2 }
    self.direction = { x = 1 * self.speed, 
                       y = 0 * self.speed }
end

function Ball:checkCollision(paddle)
    -- Here we check for collision with walls if no paddle object is passed, and check collision with paddle if one is given. We return the result for some other code to handle what to do.

    if paddle == nil then
        -- check for collision with walls
        if self.position.x + self.radius * 2 >= love.graphics.getWidth() then
            return "rightWall"
        elseif self.position.x <= 0 then
            return "leftWall"
        elseif self.position.y <= 0 then
            return "topWall"
        elseif self.position.y + self.radius * 2 >= love.graphics.getHeight() then
            return "bottomWall"
        end
    else
        -- check for collision with paddles
        paddle.y = paddle.position
        if paddle.side == "left" then
            paddle.x = paddle.thickness + 10
        elseif paddle.side == "right" then
            paddle.x = love.graphics.getWidth() - paddle.thickness - 10
        end

        local paddleTop = paddle.y
        local paddleBottom = paddle.y + paddle.length
        local paddleLeft = paddle.x
        local paddleRight = paddle.x + paddle.thickness

        local ballTop = self.position.y
        local ballBottom = self.position.y + self.radius * 2
        local ballLeft = self.position.x
        local ballRight = self.position.x + self.radius * 2

        if ballTop <= paddleBottom and
        ballBottom >= paddleTop and
        ballLeft <= paddleRight and
        ballRight >= paddleLeft then
            return true
        end
        
    end
end

function Ball:move(dt)
    self.position.x = self.position.x + self.direction.x * dt
    self.position.y = self.position.y + self.direction.y * dt
end

function Ball:draw()
    love.graphics.circle("line",
                         self.position.x,
                         self.position.y,
                         self.radius)
end
