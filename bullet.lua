--variables
local lasttime = 0
local cooldown = 0
local bulletSpeed = 1600
local bullets = {}
local playerBossCol = false
local projectileCount = 3
local spread = 7
weaponType = "gun"

--all collision code
local function onCollision (event)
  if ( event.phase == "began" ) then
    if (event.object1.myName == "player") then
      print(event.object1.x)
      print(event.object1.y)
    end
    --player bullet disappears on wall hit
    if(event.object1.myName == "bullet" and event.object2.myName == "wall" ) then
      event.object1:removeSelf()

    elseif(event.object2.myName == "bullet" and event.object1.myName == "wall" ) then
      event.object2:removeSelf()
    end

    --player enters portal
    if(event.object1.myName == "player" and event.object2.myName == "portalTo1" ) then
      if(enemyCount < 1) then
        changeLevelTo1()
      end
    end

    if(event.object1.myName == "player" and event.object2.myName == "portalTo2" ) then
      if(enemyCount < 1) then
        changeLevelTo2()
      end
    end

    if(event.object1.myName == "player" and event.object2.myName == "portalTo3" ) then
      if(enemyCount < 1) then
        changeLevelTo3()
      end
    end

    if(event.object1.myName == "player" and event.object2.myName == "portalTo4" ) then
      if(enemyCount < 1) then
        changeLevelTo4()
      end
    end
    if(event.object1.myName == "player" and event.object2.myName == "portalTo4BowRoom" ) then
    
        changeLevelTo4()

    end



    if(event.object1.myName == "player" and event.object2.myName == "portalTo5" ) then
      if(enemyCount < 1)then
        changeLevelTo5()
      end
    end
    if(event.object1.myName == "player" and event.object2.myName == "portalTo6" ) then
      if(enemyCount < 1)then
        changeLevelTo6()
      end
    end
    if(event.object1.myName == "player" and event.object2.myName == "portalTo7" ) then
      if(enemyCount < 1)then
        changeLevelTo7()
      end
    end
    if(event.object1.myName == "player" and event.object2.myName == "portalToBowRoom" ) then
      changeLevelToBowRoom()
    end

    --end of portals

    if(event.object1.myName == "wall" and event.object2.myName == "player" ) then
      touchingWall = true

    elseif(event.object2.myName == "wall" and event.object1.myName == "player" ) then
      touchingWall = true

    end

    if(event.object1.myName == "void" and event.object2.myName == "player" ) then
      touchingWall = true

    elseif(event.object2.myName == "void" and event.object1.myName == "player" ) then
      touchingWall = true

    end

    --player bullet hits enemy
    if(event.object1.myName == "bullet" and event.object2.myName == "enemy" ) then
      event.object1:removeSelf()
      print( event.object2.HP)
      event.object2.HP = event.object2.HP - 1
      print( event.object2.HP)
      if(event.object2.HP == 0) then
        event.object2:removeSelf()
        enemyCount = enemyCount - 1
        enemyCountDisplay:removeSelf()
        enemyCountDisplay = display.newText(enemyCount, 40, 40, native.systemFont, 30)
      end

      --remove hp
    elseif(event.object2.myName == "bullet" and event.object1.myName == "enemy" ) then
      event.object2:removeSelf()
      event.object1.HP = event.object1.HP - 1

      if(event.object1.HP == 0) then
        event.object1:removeSelf()
        enemyCount = enemyCount - 1
        enemyCountDisplay:removeSelf()
        enemyCountDisplay = display.newText(enemyCount, 40, 40, native.systemFont, 30)
      end
      --remove hp
    end

    --player bullet hits boss
    if(event.object1.myName == "bullet" and event.object2.myName == "boss" ) then
      event.object1:removeSelf()
      event.object2.HP = event.object2.HP - 1
      if(event.object2.HP <= 0 and bossTier == 5) then
        event.object2:removeSelf()
        enemyCount = enemyCount - 1
        enemyCountDisplay:removeSelf()
        enemyCountDisplay = display.newText(enemyCount, 40, 40, native.systemFont, 30)
      end

      --remove hp
    elseif(event.object2.myName == "bullet" and event.object1.myName == "boss" ) then
      event.object2:removeSelf()
      event.object1.HP = event.object1.HP - 1
      if(event.object1.HP <= 0 and bossTier == 5) then
        event.object1:removeSelf()
        enemyCount = enemyCount - 1
        enemyCountDisplay = display.newText(enemyCount, 40, 40, native.systemFont, 30)
      end
      --remove hp
    end

    --enemy bullet disappears on wall hit
    if(event.object1.myName == "enemyBullet" and event.object2.myName == "wall" ) then
      event.object1:removeSelf()
    elseif(event.object2.myName == "enemyBullet" and event.object1.myName == "wall" ) then
      event.object2:removeSelf()
    end

    --enemy bullet hits player
    if(event.object1.myName == "enemyBullet" and event.object2.myName == "player" ) then
      event.object1:removeSelf()
      myPlayer.alpha = 0.5
      myPlayer:setFillColor( 255, 0, 0)
      playSFX(playerHit, 1)


      --remove hp
    elseif(event.object2.myName == "enemyBullet" and event.object1.myName == "player" ) then
      event.object2:removeSelf()
      myPlayer.alpha = 0.5
      myPlayer:setFillColor( 255, 0, 0)
      playSFX(playerHit, 1)

      --remove hp
    end

    if(event.object1.myName == "enemyBullet" and event.object2.myName == "player" ) then
      event.object1:removeSelf()
      playerHP = playerHP - 1

      if(playerHP < 1 ) then
        gameOver()
      end
      --remove hp
    elseif(event.object2.myName == "enemyBullet" and event.object1.myName == "player" ) then
      event.object2:removeSelf()
      playerHP = playerHP - 1

      --remove hp
      if(playerHP < 1 ) then
        gameOver()
      end
    end

    --player and boss collision
    if(event.object1.myName == "boss" and event.object2.myName == "player" ) then
      playerBossCol = true
      playerHP = playerHP - 1
      playSFX(playerHit, 1)

      --remove hp
      if(playerHP < 1 ) then
        gameOver()
      end
    elseif(event.object2.myName == "boss" and event.object1.myName == "player" ) then
      playerBossCol = true
      playerHP = playerHP - 1

      playSFX(playerHit, 1)
      --remove hp
      if(playerHP < 1 ) then
        gameOver()
      end
    end

    if(event.object1.myName == "enemy" and event.object2.myName == "player" ) then
      playerBossCol = true
      playerHP = playerHP - 1
      playSFX(playerHit, 1)
      myPlayer.alpha = 0.5
      myPlayer:setFillColor( 255, 0, 0)
      --remove hp
      if(playerHP < 1 ) then
        gameOver()
      end
    elseif(event.object2.myName == "enemy" and event.object1.myName == "player" ) then
      myPlayer.alpha = 0.5
      myPlayer:setFillColor( 255, 0, 0)
      playerBossCol = true
      playerHP = playerHP - 1

      playSFX(playerHit, 1)
      --remove hp
      if(playerHP < 1 ) then
        gameOver()
      end
    end

  elseif ( event.phase == "ended" ) then

    if(event.object1.myName == "boss" and event.object2.myName == "player" ) then
      playerBossCol = false
    elseif(event.object2.myName == "boss" and event.object1.myName == "player" ) then
      playerBossCol = false
    end

    if(event.object1.myName == "wall" and event.object2.myName == "player" ) then
      touchingWall = false
      grapplePaused = 0
    elseif(event.object2.myName == "wall" and event.object1.myName == "player" ) then
      touchingWall = false
      grapplePaused = 0
    end
    if(event.object1.myName == "void" and event.object2.myName == "player" ) then
      touchingWall = false
      grapplePaused = 0
    elseif(event.object2.myName == "void" and event.object1.myName == "player" ) then
      touchingWall = false
      grapplePaused = 0
    end
  end
end


--bullet code
local function createBullet (event)
  if ( event.phase == "began" ) then
    if (os.time() > (lasttime + cooldown)) then

      if(weaponType == "gun") then
        --setting cooldown and angle of the "bullet"
        lasttime = os.time()
        local vec = ssk.math2d.diff( myPlayer, grapplepos)
        local angle = ssk.math2d.vector2Angle(vec)
        vec = ssk.math2d.normalize(vec)
        vec = ssk.math2d.scale(vec, bulletSpeed)
        playSFX(gunShoot, 0.1)

        --setting starting position of the "bullet"
        local firedBullet = display.newImageRect("graphics/items/gunbullet.png", 16, 16)
        firedBullet.x = myPlayer.x
        firedBullet.y = myPlayer.y

        --adding physics and physics properties
        physics.addBody( firedBullet, "dynamic", {density = 1, friction = 0, bounce = 0 } )
        firedBullet.rotation = angle + 270
        firedBullet.isFixedRotation = true
        firedBullet.gravityScale = 0
        firedBullet.isBullet = true
        firedBullet.isSensor = true
        firedBullet:setLinearVelocity(vec.x, vec.y)
        firedBullet.myName = "bullet"
        firedBullet.collision = "bulletCollision"


      elseif(weaponType == "bow") then
        bulletSpeed = 1000
        lasttime = os.time()
        local vec = ssk.math2d.diff( myPlayer, grapplepos)
        local angle0 = ssk.math2d.vector2Angle(vec)

        local angle = angle0 - spread * (projectileCount - 1) / 2
        for i = 1, projectileCount do
          local vec2 = ssk.math2d.angle2Vector( angle, true)
          vec2 = ssk.math2d.normalize(vec2)
          vec2 = ssk.math2d.scale(vec2, bulletSpeed)
          playSFX(arrowShoot, 0.1)

          --setting starting position of the "bullet"
          local firedBullet = display.newImageRect("graphics/items/arrow.png", 32, 16)
          firedBullet.x = myPlayer.x
          firedBullet.y = myPlayer.y

          --adding physics and physics properties
          physics.addBody( firedBullet, "dynamic", {density = 1, friction = 0, bounce = 0 } )
          firedBullet.rotation = angle + 270
          firedBullet.isFixedRotation = true
          firedBullet.gravityScale = 0
          firedBullet.isBullet = true
          firedBullet.isSensor = true
          firedBullet:setLinearVelocity(vec2.x, vec2.y)
          firedBullet.myName = "bullet"
          firedBullet.collision = "bulletCollision"
          angle = angle + spread
        end
      end


    end -- ostime end
  end --phase end
end -- function end
Runtime:addEventListener("collision", onCollision)
grapplepos:addEventListener ("touch", createBullet)

return bullets
