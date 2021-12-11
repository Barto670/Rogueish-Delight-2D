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

function createDownUpObstacle ( x , y , lineLength , speed , image , hp)

local obstacle = display.newImageRect(image, 100, 100)

local obstacleHearts = display.newSprite(heartSheet, sequenceData )
obstacleHearts.alpha  = 1
obstacleHearts:setSequence( "heartFrames" )
obstacleHearts:setFrame( 4 )

-- set starting position and square size

--AI physics
physics.addBody( obstacle, "dynamic", {density = 1000000, friction=0, bounce=0 } )
obstacle.isFixedRotation  = false
obstacle.gravityScale     = 0
obstacle.isBullet         = false
obstacle.angularVelocity = 720
obstacle.isSensor = true
obstacle.myName = "enemy"
obstacle.speed = speed
obstacle.HP = 4


--AI position
obstacle.x = x  --place the object at the bottom of the line
obstacle.y = y - lineLength/2--place the object at the bottom of the line
local movement = 1    -- so it starts

function gameLoop5(event)
  if(obstacle.HP>0)then
  obstacleHearts:setFrame(obstacle.HP + 1)
  obstacleHearts.x      = obstacle.x + 155 +((obstacle.HP)*(16*-1))
  obstacleHearts.y      = obstacle.y - 65
    -- constantly adjust velocity to track yellowOrb
    if(movement == 1) then
      obstacle:setLinearVelocity(0,obstacle.speed*-1)
        if(obstacle.y <= (y - lineLength/2)) then
          movement = 2
        end
      end
    if(movement == 2) then
      obstacle:setLinearVelocity(0,obstacle.speed)
      if(obstacle.y >= (y + lineLength/2)) then
        movement = 1
      end
    end
  else
    display.remove(obstacleHearts)
  end
  end

--attack mechanism



Runtime:addEventListener("enterFrame", gameLoop5)
end
