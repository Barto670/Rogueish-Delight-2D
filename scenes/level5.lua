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



function changeLevelTo6 ( event )
  roomNumber = "Room 6"
  displayRoom:removeSelf()
  displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )
  displayRoom.alpha = 1
 composer.gotoScene( "scenes.level6" )

 composer.removeScene("scenes.level5")
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

      map = display.newImage(sceneGroup,"graphics/maps/level5.png")
      map.xScale  = 10
      map.yScale  = 10
      map.x = 1500
      map.y = -2000
      map:toBack()


      myPlayer.x  = 0
      myPlayer.y  = 0
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

      local enemyStatic = createStaticAI( 1200 , 0 , 4 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 1200 , -300 , 4 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 1200 , 300 , 4 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 800 , -1000 , 4 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 1200 , -1500, 4 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 2500 , -1600, 4 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 2500 , -1700, 4 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 1400 , -1900 , 4 ,"graphics/AI/marshmelloArcherAI2.png" )

      local obstacle1 = createUpDownObstacle(1400 , 1800, 600 , 700, "graphics/obstacles/gobstopper.png" , 3  )
      local obstacle1 = createUpDownObstacle( 200 , 0, 600 , 700, "graphics/obstacles/gobstopper.png" , 3  )
      local obstacle1 = createUpDownObstacle( 200 , -1600, 600 , 700, "graphics/obstacles/gobstopper.png" , 3  )
      local obstacle1 = createUpDownObstacle( 2000, -1600, 600 , 700, "graphics/obstacles/gobstopper.png" , 3  )

      local enemyStatic = createStaticAI( 2500 , -3250, 5 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 2500 , -3650, 5 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 2500 , -3500, 5 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 3800 , -3250, 5 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 3800 , -3650, 5 ,"graphics/AI/marshmelloArcherAI2.png" )
      local enemyStatic = createStaticAI( 3800 , -3500, 5 ,"graphics/AI/marshmelloArcherAI2.png" )

        --function to set alpha channels
        local z = 0

        --Outer walls and myName is the collision identifier
        local wallsHitbox = display.newGroup()
        --insert walls here

        outsideWalls= display.newRect(-650, -50, 150, 1500)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(1580, -50, 150, 1500)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(1580, -50, 150, 1500)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(800, 640, 3000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(-300, -800, 2000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2015, -800, 2000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(-300, -1120, 2000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2015, -1120, 2000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(800, -2400, 3000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(-10, -1900, 150, 1500)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2370, -2595, 150, 1500)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2370, -775, 150, 1500)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(625, -900, 150, 300)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(1095, -900, 150, 300)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3400, -1445, 2000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2650, -1920, 600, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3340, -2100, 150, 2000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2850, -2500, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2850, -4380, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3340, -4380, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3340, -3680, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2850, -3680, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        wallsHitbox:insert(outsideWalls)

        portal = display.newRect(3000, -4500, 500, 150)
        portal:setFillColor(1, 0, 0, z)
        physics.addBody( portal, "static" , {bounce = 0 })
        portal.myName = "portalTo6"
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
