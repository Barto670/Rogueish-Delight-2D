--DONT CHANGE THESE

local bullets = {}

--settings for the bullet

--AI
function createStaticBoss( x , y , hp)
local cooldown = 1
local aiShootingRange = 1000
local bulletSpeed = 600
bossTier = 1
local lasttime = 0
local changeDone = true
--display health / make body static
local sheetOptions1 = {
    width               = 320,
    height              = 320,
    numFrames           = 5,
    sheetContentWidth   = 320,
    sheetContentHeight  = 1600,
}

local bossSheet = graphics.newImageSheet( "graphics/AI/boss.png", sheetOptions1 )

local sequenceData1 = {
      name = "bossframes",
      frames = { 1,2,3,4,5},
      time = 0,
      loopCount = 0
}

local AI = display.newSprite(bossSheet, sequenceData1 )
AI.alpha  = 1
AI:setSequence( "bossframes" )

--AI physics
physics.addBody( AI, "static", {density = 1000000, friction=0, bounce=0, radius = 150} )
AI.isFixedRotation  = true
AI.gravityScale     = 0
AI.isBullet         = true
AI.isSensor         = false
AI.myName = "boss"
AI.HP = hp
AI.radius = 150
AI.cooldown = cooldown
AI.lasttime = lasttime
--AI position settings
AI.x = x
AI.y = y


--display health / make body static
local sheetOptions2 = {
    width               = 320,
    height              = 32,
    numFrames           = 10,
    sheetContentWidth   = 320,
    sheetContentHeight  = 320,
}

local heartSheet = graphics.newImageSheet( "graphics/UI/hearts.png", sheetOptions2 )

local sequenceData2 = {
      name = "heartrames",
      frames = { 1,2,3,4,5,6,7,8,9,10},
      time = 0,
      loopCount = 0
}

local AIhearts = display.newSprite(heartSheet, sequenceData2 )
AIhearts.alpha  = 1
AIhearts:setSequence( "heartFrames" )

--shooting mechanism

local function AIshootingStatic ( event )
  if(AI.HP > 0 and bossTier > 0 and changeDone == true) then
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
          firedBullet.isFixedRotation  = false
          firedBullet.rotation = angle+180
          firedBullet.gravityScale     = 0
          firedBullet.isBullet         = true
          firedBullet.isSensor = true
          firedBullet:setFillColor( (math.random(255))/255, (math.random(255))/255, (math.random(255))/255)
          firedBullet:setLinearVelocity(vec.x , vec.y)
          firedBullet.myName = "enemyBullet"
          return firedBullet
        end
      end
        AIhearts:setFrame(AI.HP + 1)
        if(bossTier == 1) then
          AIhearts.x      = AI.x + 155 +((AI.HP)*(16*-1))
          AIhearts.y      = AI.y - 160
        end
        if(bossTier == 2) then
          AIhearts.x      = AI.x + 155 +((AI.HP)*(16*-1))
          AIhearts.y      = AI.y - 145
        end
        if(bossTier == 3) then
          AIhearts.x      = AI.x + 155 +((AI.HP)*(16*-1))
          AIhearts.y      = AI.y - 120
        end
        if(bossTier == 4) then
          AIhearts.x      = AI.x + 155 +((AI.HP)*(16*-1))
          AIhearts.y      = AI.y - 85
        end
        if(bossTier == 5) then
          AIhearts.x      = AI.x + 155 +((AI.HP)*(16*-1))
          AIhearts.y      = AI.y - 60
        end
    else
      if(bossTier == 6) then
        display.remove(AIhearts)
      end
      if(AI.HP <= 0 and changeDone == true and bossTier <= 5) then
        bossTier = bossTier + 1
        AI.HP = hp
        changeDone = false
        bulletSpeed = bulletSpeed + 200
      end
      if(changeDone == false) then
        if(bossTier == 1) then
          AI:setFrame(1)
          changeDone = true
        end
        if(bossTier == 2) then
          AI:setFrame(2)
          changeDone = true
        end
        if(bossTier == 3) then
          AI:setFrame(3)
          changeDone = true
          createStaticAI (6500 , 900 , 4 ,"graphics/AI/marshmelloArcherAI2.png")
        end
        if(bossTier == 4) then
          AI:setFrame(4)
          changeDone = true
          createStaticAI (7500 , 600 , 4 ,"graphics/AI/marshmelloArcherAI2.png")
        end
        if(bossTier == 5) then
          changeDone = true
          AI:setFrame(5)
          createStaticAI (7500 , 1300 , 4 ,"graphics/AI/marshmelloArcherAI2.png")
          createStaticAI (7500 , 600 , 4 ,"graphics/AI/marshmelloArcherAI2.png")
        end
      end
    end
  end
  timer.performWithDelay(1, AIshootingStatic , 0)
  return AI
end
