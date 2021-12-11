--DONT CHANGE THESE

local bullets = {}
local movement = 1

-- settings for the AI's movement (in a square)

--display health / make body static
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

--settings for the bullet

local bulletSpeed = 500
local aiShootingRange = 500

function createSquareAI( x , y , squareSize , speed , hp)

local AIhearts = display.newSprite(heartSheet, sequenceData )
AIhearts.alpha  = 1
AIhearts:setSequence( "heartFrames" )
AIhearts:setFrame( 3 )

--AI + physics
local cooldown = 1
local lasttime = 0
local AI = display.newImageRect("graphics/AI/SlimeBlue.png", 50, 50)
physics.addBody( AI, "dynamic", {density = 1000000, friction=0, bounce=0, radius = 35 } )
AI.isFixedRotation  = true
AI.gravityScale     = 0
AI.isBullet         = false
AI.angularVelocity = 0
AI.isSensor = true
AI.myName = "enemy"
AI.HP = hp
AI.cooldown = cooldown
AI.lasttime = lasttime
AI.squareSize = squareSize
--AI position (DONT CHANGE THESE)
AI.x = x + squareSize/2 --top right of the square
AI.y = y - squareSize/2 --top right of the square


local function gameLoop2(event)
    if(AI.HP > 0) then
      AIhearts:setFrame(AI.HP + 1)
      AIhearts.x      = AI.x + 155 +((AI.HP)*(16*-1))
      AIhearts.y      = AI.y - 65
      if(movement == 1) then
        AI:setLinearVelocity(0,speed)
          if(AI.y >= (y + AI.squareSize/2)) then
            movement = 2
          end
      end
      if(movement == 2) then
        AI:setLinearVelocity((speed*-1),0)
        if(AI.x <= (x - AI.squareSize/2)) then
          movement = 3
        end
      end
      if(movement == 3) then
        AI:setLinearVelocity(0,(speed*-1))
        if(AI.y <= (y - AI.squareSize/2)) then
          movement = 4
      end
    end
    if(movement == 4) then
      AI:setLinearVelocity((speed),0)
        if(AI.x >= (x + AI.squareSize/2)) then
          movement = 1
        end
    end
  else
    display.remove(AIhearts)
  end
end

Runtime:addEventListener("enterFrame", gameLoop2)

--shooting mechanism
local function AIshooting ( event )
    if(AI.HP > 0) then
  if(myPlayer.x > AI.x - aiShootingRange and myPlayer.x < AI.x + aiShootingRange and myPlayer.y > AI.y - aiShootingRange and myPlayer.y < AI.y + aiShootingRange) then
  if (os.time() > (AI.lasttime + AI.cooldown)) then
    --setting cooldown and angle of the "bullet"
    AI.lasttime = os.time()
    local vec = ssk.math2d.diff( AI , myPlayer)
    local angle = ssk.math2d.vector2Angle(vec)
    vec = ssk.math2d.normalize(vec)
    vec = ssk.math2d.scale(vec , bulletSpeed)


    --setting starting position of the "bullet"
    local firedBullet =  display.newImage("graphics/items/marsh.png")
    firedBullet.x = AI.x
    firedBullet.y = AI.y

    --adding physics and physics properties
    physics.addBody( firedBullet, "dynamic", {density = 0, friction=0, bounce=0 } )
    firedBullet.rotation = angle+180
    firedBullet.isFixedRotation  = true
    firedBullet.gravityScale     = 0
    firedBullet.isBullet         = true
    firedBullet.isSensor         = true
    firedBullet:setFillColor( (math.random(255))/255, (math.random(255))/255, (math.random(255))/255)
    firedBullet:setLinearVelocity(vec.x , vec.y)
    firedBullet.myName = "enemyBullet"

    return firedBullet
  end
end
  end
end
  timer.performWithDelay(1, AIshooting , 0)
  return true
end
