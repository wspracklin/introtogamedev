require "paddle"
require "ball"

function love.load()
    paddleLeft = Paddle("left")
    paddleRight = Paddle("right")
    ball = Ball()
end

function love.update(dt)
    local speed = 300
    paddleRight.position = ball.position.y - paddleRight.length / 2
    if paddleLeft.isMoving == "up" then
        paddleLeft:move(-speed * dt)
    elseif paddleLeft.isMoving == "down" then
        paddleLeft:move(speed * dt)
    end

    if ball:checkCollision() == "rightWall" then
        paddleLeft.score = paddleLeft.score + 1
        ball.position = { x = love.graphics.getWidth() / 2,
                          y = love.graphics.getHeight() / 2 }
        ball.direction.y = 0
    elseif ball:checkCollision() == "leftWall" then
        paddleRight.score = paddleRight.score + 1
        ball.position = { x = love.graphics.getWidth() / 2,
                          y = love.graphics.getHeight() / 2 }
        ball.direction.y = 0
    elseif ball:checkCollision() == "topWall"
    or ball:checkCollision() == "bottomWall" then
        ball.direction.y = -ball.direction.y
    end

    if ball:checkCollision(paddleLeft) then
        ball.direction.x = 1 * ball.speed
        ball.direction.y = -love.math.random(1,100) * 0.01 * ball.speed
    elseif ball:checkCollision(paddleRight) then
        ball.direction.x = -1 * ball.speed
        ball.direction.y = love.math.random(1,100) * 0.01 * ball.speed
    end

    ball:move(dt)
end

function love.keypressed(key)
    if key == "up" then
        paddleLeft.isMoving = "up"
    elseif key == "down" then
        paddleLeft.isMoving = "down"
    elseif key == "escape" then
        love.event.quit()
    end
end

function love.keyreleased(key)
    if key == "up" and paddleLeft.isMoving == "up" then
        paddleLeft.isMoving = false
    elseif key == "down" and paddleLeft.isMoving == "down" then
        paddleLeft.isMoving = false
    end
end

function love.draw()
    love.graphics.print("Scores\n" .. paddleLeft.score .. "      " .. paddleRight.score,
                        love.graphics.getWidth() / 2 - 40,
                        10,
                        nil,
                        3,
                        3)
    paddleLeft:draw()
    paddleRight:draw()
    ball:draw()
end
