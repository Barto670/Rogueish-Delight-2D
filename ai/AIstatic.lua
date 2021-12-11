--DONT CHANGE THESE

local bullets = {}

--settings for the bullet

local bulletSpeed = 700
local aiShootingRange = 800

function createStaticAI( x , y , hp , image)
--AI

local cooldown = 1
local AI = display.newImageRect(image, 75, 100)
local lasttime = 0
--AI physics
physics.addBody( AI, "static", {density = 1000000, friction=0, bounce=0 } )
AI.isFixedRotation  = true
AI.gravityScale     = 0
AI.isBullet         = false
AI.isSensor         = true
AI.myName = "enemy"
AI.HP = hp
AI.cooldown = cooldown
AI.lasttime = lasttime
--AI position settings
AI.x = x
AI.y = y


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
      name = "heartrames",
      frames = { 1,2,3,4,5,6,7,8,9,10},
      time = 0,
      loopCount = 0
}

local AIhearts = display.newSprite(heartSheet, sequenceData )
AIhearts.alpha  = 1
AIhearts:setSequence( "heartFrames" )

--shooting mechanism

local function AIshootingStatic ( event )
  if(AI.HP > 0) then
    AIhearts:setFrame(AI.HP + 1)
    AIhearts.x      = AI.x + 155 +((AI.HP)*(16*-1))
    AIhearts.y      = AI.y - 65
    if(myPlayer.x > AI.x - aiShootingRange and myPlayer.x < AI.x + aiShootingRange and myPlayer.y > AI.y - aiShootingRange and myPlayer.y < AI.y + aiShootingRange) then
      if (os.time() > (AI.lasttime + AI.cooldown)) then
        --setting cooldown and angle of the "bullet"
        AI.lasttime = os.time()
        local vec = ssk.math2d.diff( AI , myPlayer)
        local angle = ssk.math2d.vector2Angle(vec)
        vec = ssk.math2d.normalize(vec)
        vec = ssk.math2d.scale(vec , bulletSpeed)

        --setting starting position of the "bullet"
        local firedBullet =  display.newImage("graphics/items/arrow.png")
        firedBullet.x = AI.x
        firedBullet.y = AI.y

        --adding physics and physics properties
        physics.addBody( firedBullet, "dynamic", {density = 0, friction=0, bounce=0 } )
        firedBullet.isFixedRotation  = false
        firedBullet.rotation = angle-90
        firedBullet.gravityScale     = 0
        firedBullet.isBullet         = true
        firedBullet.isSensor = true
        firedBullet:setFillColor( (math.random(255))/255, (math.random(255))/255, (math.random(255))/255)
        firedBullet:setLinearVelocity(vec.x , vec.y)
        firedBullet.myName = "enemyBullet"
		playSFX(arrowShoot, 0.05)
        return firedBullet
    end
  end
else
  display.remove(AIhearts)
end
end
  timer.performWithDelay(1, AIshootingStatic , 0)
  return AI
end
