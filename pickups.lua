local weaponPickedUp = false
local touchingWeapon = false


        -----Create weapon on the map------
function createWeapon(x,y)
  local sheetOptions = {
    width               = 50,
    height              = 50,
    numFrames           = 2,
    sheetContentWidth   = 50,
    sheetContentHeight  = 100,
  }
  local weaponSheet = graphics.newImageSheet( "graphics/items/newBowGlow.png", sheetOptions )
  local sequenceData = {
      name = "weaponFrames",
      frames = { 1, 2,},
      time = 0,
      loopCount = 0
    }
    weaponPickup = display.newSprite(weaponSheet, sequenceData )
    weaponPickup.alpha  = 1
    weaponPickup.x      = x
    weaponPickup.y      = y
    weaponPickup.isBullet = true
    weaponPickup.isSensor = true
    weaponPickup.isFixedRotation  = true
    weaponPickup.gravityScale     = 0
    weaponPickup:setSequence( "weaponFrames" )
    weaponPickup:setFrame( 1 )
    physics.addBody( weaponPickup, "dynamic", {density = 10000000, friction=0, bounce=0} )
    weaponPickup.myName =  "weapon"

end



          -----Create potion on the map-----
function createPotion( x , y)
  potion        = display.newImageRect("graphics/items/potion.png", 50, 60)
  potion.alpha  = 1
  potion.x      = x
  potion.y      = y
  potion.isBullet = true
  potion.isSensor = true
  potion.isFixedRotation  = true
  physics.addBody( potion, "dynamic", {density = 10000000, friction=0, bounce=0} )
  potion.myName =  "potion"
end


--create text above potion
local potionPickupDisplay = display.newText( "Your HP is max", myPlayer.x, myPlayer.y - 100, native.systemFont, 20 )
potionPickupDisplay:setFillColor( 255, 255, 255 )
potionPickupDisplay.alpha = 0

--create text above weapon
local weaponPickupDisplay = display.newText( "Press 'e' to pickup weapon", 0, 0, native.systemFont, 20 )
weaponPickupDisplay:setFillColor( 255, 255, 255 )
weaponPickupDisplay.alpha = 0


--collision between the player and the weapon
local function onWeaponCollision (event)
  if(weaponPickedUp == false) then
    if ( event.phase == "began" ) then
      weaponPickupDisplay.x = weaponPickup.x
      weaponPickupDisplay.y = weaponPickup.y - 100
        if(event.object1.myName == "weapon" and event.object2.myName == "player") then
            touchingWall = true
            weaponPickup:setFrame( 2 )
            touchingWeapon = true
            weaponPickupDisplay.alpha = 1
            weaponPickupDisplay.alpha = 1
            if(grappleFinished ==false) then
              grappleFinished = true
              display.remove(grappleToSquareCollision)
              CurrentVelocityX =0
              CurrentVelocityY =0
              grapplePaused = 1
              myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
            end
      elseif(event.object2.myName == "weapon" and event.object1.myName == "player")then
            touchingWall = true
            weaponPickup:setFrame( 2 )
            touchingWeapon = true
            weaponPickupDisplay.alpha = 1
            if(grappleFinished ==false) then
              grappleFinished = true
              display.remove(grappleToSquareCollision)
              CurrentVelocityX =0
              CurrentVelocityY =0
              grapplePaused = 1
              myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
            end
          end
  elseif ( event.phase == "ended" ) then
      if(event.object1.myName == "weapon" and event.object2.myName == "player") then
        touchingWall = false
        weaponPickup:setFrame( 1 )
        touchingWeapon = false
        weaponPickupDisplay.alpha = 0
      elseif(event.object2.myName == "weapon" and event.object1.myName == "player")then
        touchingWall = false
        weaponPickup:setFrame( 1 )
        touchingWeapon = false
        weaponPickupDisplay.alpha = 0
      end
    end
  end
end





--player and potion collision
local function onPotionCollision (event)
  if ( event.phase == "began" ) then
      if(event.object1.myName == "potion" and event.object2.myName == "player") then
        touchingWall = true
        if(playerHP <= 4) then
          display.remove(potion)
          potionPickupDisplay.alpha = 0
          playerHP = playerHP+1
        else
          potionPickupDisplay.alpha = 1
          potionPickupDisplay.x = myPlayer.x
          potionPickupDisplay.y = myPlayer.y - 100
          if(grappleFinished ==false) then
            grappleFinished = true
            display.remove(grappleToSquareCollision)
            CurrentVelocityX =0
            CurrentVelocityY =0
            grapplePaused = 1
            myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
          end
        end
      elseif(event.object2.myName == "potion" and event.object1.myName == "player")then
        touchingWall = true
        if(playerHP <= 4) then
          display.remove(potion)
          potionPickupDisplay.alpha = 0
          playerHP = playerHP+1
        else
          potionPickupDisplay.alpha = 1
          potionPickupDisplay.x = myPlayer.x
          potionPickupDisplay.y = myPlayer.y - 100
          if(grappleFinished ==false) then
            grappleFinished = true
            display.remove(grappleToSquareCollision)
            CurrentVelocityX =0
            CurrentVelocityY =0
            grapplePaused = 1
            myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)
          end
      end
    end
  elseif ( event.phase == "ended" ) then
    if(event.object1.myName == "potion" and event.object2.myName == "player") then
      touchingWall = false
      potionPickupDisplay.alpha = 0
    elseif(event.object2.myName == "potion" and event.object1.myName == "player")then
      touchingWall = false
      potionPickupDisplay.alpha = 0
    end
  end
end



--when you press E and you are touching the bow you will pick it up
local function pickup(event)
  if(weaponPickedUp == false) then
    if (event.keyName == 'e' and event.phase == 'down') then
      if(touchingWeapon == true) then
        weaponPickupDisplay.alpha = 0
        display.remove(weaponPickup)
        weapon:setFrame( 2 )
        weaponPickedUp = true
        weaponType = "bow"
      end
    end
  end
end

Runtime:addEventListener("collision" , onWeaponCollision)
Runtime:addEventListener("collision" , onPotionCollision)
Runtime:addEventListener("key", pickup)
