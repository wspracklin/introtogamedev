require "paddle"
require "ball"

function love.load()
    ball = Ball()
end

function love.update(dt)
    ball:move(dt)
end

function love.draw()
    ball:draw()
end
