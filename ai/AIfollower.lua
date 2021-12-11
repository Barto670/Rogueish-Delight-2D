--AI
local AI = display.newImageRect("graphics/AI/yellowsquare.png", 32, 32)

-- set speed of the AI
SPEED = 1

--AI physics
physics.addBody( AI, "dynamic", {density = 1000000, friction=0, bounce=0 } )
AI.isFixedRotation  = true
AI.gravityScale     = 0
AI.isBullet         = false

--AI position
AI.x = 1000
AI.y = 1000


function gameLoop(event)
    -- constantly adjust velocity to track yellowOrb
    AI:setLinearVelocity(
        SPEED * (myPlayer.x - AI.x),
        SPEED * (myPlayer.y - AI.y)
    )
end

--attack mechanism



Runtime:addEventListener("enterFrame", gameLoop)
