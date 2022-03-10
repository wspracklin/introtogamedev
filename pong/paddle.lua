Object = require "libs.classic"

Paddle = Object:extend()

function Paddle:new(side)
    self.score = 0
    self.side = side
    self.length = 50
    self.thickness = 10
    self.position = love.graphics.getHeight() / 2
end

function Paddle:move(distance)
    -- Distance should be negative if moving up
    local edge_reached = false
    if distance > 0 and self.position >= love.graphics.getHeight() - self.length then
        edge_reached = true
    elseif distance < 0 and self.position <= 0 then
        edge_reached = true
    end

    if edge_reached == false then
        self.position = self.position + distance
    end
end

function Paddle:draw()
    y = self.position
    if self.side == "left" then
        x = self.thickness + 10
    elseif self.side == "right" then
        x = love.graphics.getWidth() - self.thickness - 10
    else
        print("NO side given to this paddle.")
    end

    love.graphics.rectangle("line", x, y, self.thickness, self.length)
end
