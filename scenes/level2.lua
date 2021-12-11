-- loads the map




local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

enemyCount = 17
enemyCountDisplay:removeSelf()
enemyCountDisplay = display.newText(enemyCount , 40 , 40, native.systemFont, 30)
playerHP = playerHP + 3
if(playerHP > 10) then
  playerHP = 10
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------



 function changeLevelTo3 ( event )
   roomNumber = "Room 3"
   displayRoom:removeSelf()
   displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )
   displayRoom.alpha = 1
  composer.gotoScene( "scenes.level3" )

  composer.removeScene("scenes.level2")
end

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --position the map in the center

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

      map = display.newImage(sceneGroup,"graphics/maps/Level2.png")
      map.xScale  = 10
      map.yScale  = 10
      map.x = 6074
      map.y = 1925
      map:toBack()


      myPlayer.x = 3250
      myPlayer.y = 4800
      MouseX = 0
      MouseY = 0
      camera.x = ((myPlayer.x)+ (MouseX/3)) - 215 --camera x value
      camera.y = ((myPlayer.y)+ (MouseY/3)) - 230 --camera y value

      grappleCooldown = false
      grappleFinished = true
      CurrentVelocityX =0
      CurrentVelocityY =0
      myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)

        --variable map is stored/loaded into
        cameraGroup = display.currentStage

  --create enemies here
local obstacleRL1 = createRightLeftObstacle( 3350 , 3433 , 600 , 700 , "graphics/obstacles/gobstopper.png", 4  )
local enemyStatic2 = createStaticAI( 3283 , 2200 , 3 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 4750 , 1950 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 4950 , 3150 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 5220 , 1950 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 5400 , 3150 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 5800 , 1950 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 5800 , 3150 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemySquare3 = createSquareAI (3920 , 3000 , 400 , 500 ,2)

local obstacle = createUpDownObstacle(4520 , 2533 , 600 , 300, "graphics/obstacles/gobstopper.png" , 3  )
local obstacle = createUpDownObstacle(5880 , 2533 , 600 , 300, "graphics/obstacles/gobstopper.png" , 3  )
local enemyStatic2 = createStaticAI( 6480 , 3280 , 3 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 7880 , 550 , 4 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 7610 , 683 , 4 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 8240 , 236 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 7580 , -63 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemyStatic2 = createStaticAI( 7110 , 2348 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
--]]
        --function to set alpha channels


        --Outer walls and myName is the collision identifier
        local wallsHitbox = display.newGroup()
        --insert walls here
          z = 0


        outsideWalls= display.newRect(2955, 3000, 150, 5000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3750, 4400, 150, 2000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(4225, 1900, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(4225, 3230, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(6325, 1900, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(6325, 3230, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7750, 1900, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7750, 3380, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(8860, 2460, 150, 3000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(8250, 1685, 150, 1440)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3500, 5040, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3500, 5040, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3500, 1700, 1400, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(4010, 3440, 600, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(5250, 2250, 2000, 150)
        outsideWalls:setFillColor(1, 0, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(5250, 2800, 2000, 150)
        outsideWalls:setFillColor(1, 0, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7010, 3440, 2000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7010, 1680, 2000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(8010, 2330, 400, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(8310, 2965, 1200, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7600, 1035, 1200, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(9500, 1035, 1200, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7440, 465, 150, 1400)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(9180, 465, 150, 1400)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7600, -750, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(8075, -750, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(8675, -220, 1200, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        portal = display.newRect(7875, -1020, 500, 120)
        portal:setFillColor(1, 0, 0, z)
        physics.addBody( portal, "static" , {bounce = 0 })
        portal.myName = "portalTo3"
        wallsHitbox:insert(portal)

        sceneGroup:insert(wallsHitbox)
    end
end



-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        -- loads the map

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end





-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
