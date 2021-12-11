--variables DONT CHANGE THESE
grappleFinished = true
grappleCooldown = false
local lasttime = os.time()
local grappleText = 0
local inventoryAnimation = 0
grapplePaused = 0
local createNewX = 0
local cooldown = 3
touchingWall = false

--set grapple settings
local grappleSpeed = 1500
local grappleRange = 750

--texts for the grapple
local grappleRangeDisplay = display.newText( "Out of range", grapplepos.x, grapplepos.y, native.systemFont, 20 )
grappleRangeDisplay:setFillColor( 255, 0, 0 )
grappleRangeDisplay.alpha = 0

local grappleCooldownDisplay = display.newText( "On Cooldown", grapplepos.x, grapplepos.y, native.systemFont, 20 )
grappleCooldownDisplay:setFillColor( 0, 255, 255 )
grappleCooldownDisplay.alpha = 0

local touchingWallDisplay = display.newText( "Not able to grapple", grapplepos.x, grapplepos.y, native.systemFont, 20 )
touchingWallDisplay:setFillColor( 0, 255, 255 )
touchingWallDisplay.alpha = 0


local function grappleTimer ( event )
  --animation for the grapple on the UI
  if(grappleCooldown == true and inventoryAnimation == 0) then
    inventory:setSequence( "UI" )
    inventory:pause()
    inventory:setFrame( 1 )
    inventory:play()
    inventoryAnimation = 1
  end
  --counts to the cooldown specified above and restarts the grapple
  if (grappleCooldown == true and os.time() > (lasttime + cooldown)) then
    grappleCooldown = false
    grapplePaused = 0
    inventoryAnimation = 0
    inventory:pause()
    inventory:setSequence( "idle" )
    inventory:setFrame( 1 )
  end
  --creates an X to the place where you grapple to when right mouse button is pressed
  if(grappleCooldown == true and createNewX == 1) then
    grappleToSquareCollision = display.newImage("graphics/UI/x.png",grapplepos.x, grapplepos.y)
    grappleToSquareCollision.myName = "x"
    physics.addBody( grappleToSquareCollision, "dynamic", {density = 1, friction=0, bounce=0 ,radius=2} )
    createNewX = 0
    playSFX(grapple, 1)
  end
  --grappleRangeDisplay above the mouse pointer
  if(grappleRangeDisplay.alpha>0) then
    grappleRangeDisplay.alpha = grappleRangeDisplay.alpha - 0.03
    grappleRangeDisplay.x = grapplepos.x
    grappleRangeDisplay.y = grapplepos.y - 30
  end
  --grappleCooldownDisplay above the mouse pointer
  if(grappleCooldownDisplay.alpha>0 )then
    grappleCooldownDisplay.alpha = grappleCooldownDisplay.alpha - 0.03
    grappleCooldownDisplay.x = grapplepos.x
    grappleCooldownDisplay.y = grapplepos.y - 30
  end
  --touchingWallDisplay above the mouse pointer
  if (touchingWallDisplay.alpha>0)then
    touchingWallDisplay.alpha = touchingWallDisplay.alpha - 0.03
    touchingWallDisplay.x = grapplepos.x
    touchingWallDisplay.y = grapplepos.y - 30
  end
end

--collisions for the grapple which stops the grappling when it hits a "wall"
--only works when grapple is activated
local function onCollision2 (event)
  if ( event.phase == "began") then
        --collisions with walls so you stop when you reach them
        if((event.object1.myName == "wall" and event.object2.myName == "player") and grappleFinished == false) then
          display.remove(grappleToSquareCollision)
          grappleFinished = true
          CurrentVelocityX =0
          CurrentVelocityY =0
          grapplePaused = 1
          myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
        elseif((event.object2.myName == "wall" and event.object1.myName == "player")and grappleFinished == false) then
          display.remove(grappleToSquareCollision)
          CurrentVelocityX =0
          CurrentVelocityY =0
          grappleFinished = true
          grapplePaused = 1
          myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
        end
        if((event.object1.myName == "void" and event.object2.myName == "player") and grappleFinished == false) then
          display.remove(grappleToSquareCollision)
          grappleFinished = true
          CurrentVelocityX =0
          CurrentVelocityY =0
          grapplePaused = 1
          myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
        elseif((event.object2.myName == "void" and event.object1.myName == "player")and grappleFinished == false) then
          display.remove(grappleToSquareCollision)
          CurrentVelocityX =0
          CurrentVelocityY =0
          grappleFinished = true
          grapplePaused = 1
          myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
        end
        --collisions with x so you stop when you reach it
        if((event.object1.myName == "x" and event.object2.myName == "player")and grappleFinished == false) then
          touchingWall = true
          display.remove(grappleToSquareCollision)
          grappleFinished = true
          CurrentVelocityX =0
          CurrentVelocityY =0
          grapplePaused = 1
          myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
          touchingWall = false
        elseif((event.object2.myName == "x" and event.object1.myName == "player")and grappleFinished == false) then
          touchingWall = true
          display.remove(grappleToSquareCollision)
          CurrentVelocityX =0
          CurrentVelocityY =0
          grappleFinished = true
          grapplePaused = 1
          myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
          touchingWall = false
        end
        --collisions with boss so you stop when you reach it
        if(event.object1.myName == "boss" and event.object2.myName == "player"and grappleFinished == false) then
          playerHP = playerHP -1
          myPlayer.alpha = 0.5
          if(grappleFinished == false) then
            display.remove(grappleToSquareCollision)
            grappleFinished = true
            CurrentVelocityX =0
            CurrentVelocityY =0
            grapplePaused = 1
            myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
          end
        elseif(event.object2.myName == "boss" and event.object1.myName == "player"and grappleFinished == false) then
          playerHP = playerHP -1
          myPlayer.alpha = 0.5
          if(grappleFinished == false) then
            display.remove(grappleToSquareCollision)
            CurrentVelocityX =0
            CurrentVelocityY =0
            grappleFinished = true
            grapplePaused = 1
            myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
          end
        end
    end
end

--checks if the 2nd button of the mouse is pressed and if in range and then does the grapple
local function onMouseEvent( event )
   if(event.isSecondaryButtonDown ) then
     grappleRangeDisplay.alpha = 0
     grappleCooldownDisplay.alpha = 0
     touchingWallDisplay.alpha = 0
     if((grappleFinished == true) and myPlayer.x > grapplepos.x - grappleRange and myPlayer.x < grapplepos.x + grappleRange and myPlayer.y > grapplepos.y - grappleRange and myPlayer.y < grapplepos.y + grappleRange)then
       if(touchingWall == false)then
        if(grappleCooldown == false) then
              myPlayer:pause()
              grappleFinished = false
              grappleCooldown = true
              lasttime = os.time()
              local vec = ssk.math2d.diff( myPlayer , grapplepos)
              local angle = ssk.math2d.vector2Angle(vec)
              vec = ssk.math2d.normalize(vec)
              vec = ssk.math2d.scale(vec , grappleSpeed)
              myPlayer:setLinearVelocity(vec.x , vec.y)
              createNewX = 1
             else
               grappleCooldownDisplay.alpha = 1
             end
          else
            touchingWallDisplay.alpha = 1
        end
    else
      grappleRangeDisplay.alpha = 1
     end
  end
end

Runtime:addEventListener("collision" , onCollision2)
timer.performWithDelay(10, grappleTimer , 0)
Runtime:addEventListener( "mouse", onMouseEvent )
