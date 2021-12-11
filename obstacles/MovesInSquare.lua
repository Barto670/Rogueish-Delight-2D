--AI
local sheetOptions = {
    width               = 320,
    height              = 32,
    numFrames           = 10,
    sheetContentWidth   = 320,
    sheetContentHeight  = 320,
}

local heartSheet = graphics.newImageSheet( "graphics/UI/hearts.png", sheetOptions )

local sequenceData = {
      name = "heartFrames",
      frames = { 1,2,3,4,5,6,7,8,9,10},
      time = 0,
      loopCount = 0
}

function createSquareObstacle ( x , y , squareSize , speed , hp , movement)

local obstacleHearts = display.newSprite(heartSheet, sequenceData )
obstacleHearts.alpha  = 1
obstacleHearts:setSequence( "heartFrames" )
obstacleHearts:setFrame( 4 )

local obstacle = display.newImageRect("graphics/obstacles/gobstopper.png", 100, 100)

-- set starting position and square size

--AI physics
physics.addBody( obstacle, "dynamic", {density = 1000000, friction=0, bounce=0 } )
obstacle.isFixedRotation  = false
obstacle.gravityScale     = 0
obstacle.isBullet         = false
obstacle.angularVelocity = 720
obstacle.isSensor = true
obstacle.squareSize = squareSize
obstacle.speed = speed
obstacle.myName = "enemy"
obstacle.HP = hp
obstacle.x = x
obstacle.y = y
obstacle.movement = movement

--AI position
obstacle.x = x + squareSize/2 --top right of the square
obstacle.y = y - squareSize/2 --top right of the square
    -- so it starts

function gameLoop3(event)
  if(obstacle.HP>0)then
  obstacleHearts:setFrame(obstacle.HP + 1)
  obstacleHearts.x      = obstacle.x + 155 +((obstacle.HP)*(16*-1))
  obstacleHearts.y      = obstacle.y - 65
    if(obstacle.movement == 1) then
      obstacle:setLinearVelocity(0,speed)
        if(obstacle.y >= (y + obstacle.squareSize/2)) then
          obstacle.movement = 2
        end
      end
    if(obstacle.movement == 2) then
      obstacle:setLinearVelocity((speed*-1),0)
      if(obstacle.x <= (x - obstacle.squareSize/2)) then
        obstacle.movement = 3
      end
    end
    if(obstacle.movement == 3) then
      obstacle:setLinearVelocity(0,(speed*-1))
      if(obstacle.y <= (y - obstacle.squareSize/2)) then
        obstacle.movement = 4
      end
    end
    if(obstacle.movement == 4) then
      obstacle:setLinearVelocity((speed),0)
      if(obstacle.x >= (x + obstacle.squareSize/2)) then
        obstacle.movement = 1
      end
    end
  else
    display.remove(obstacleHearts)
  end
end

--attack mechanism



Runtime:addEventListener("enterFrame", gameLoop3)
end
