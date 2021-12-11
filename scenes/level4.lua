-- loads the map




local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
if(bowRoomEntered == false) then
  enemyCount = 20

end

enemyCountDisplay:removeSelf()
enemyCountDisplay = display.newText(enemyCount , 40 , 40, native.systemFont, 30)
playerHP = playerHP + 3
if(playerHP > 10) then
  playerHP = 10
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------



 function changeLevelTo5 ( event )
   roomNumber = "Room 5"
   displayRoom:removeSelf()
   displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )
   displayRoom.alpha = 1
  composer.gotoScene( "scenes.level5" )

  composer.removeScene("scenes.level4")
end

function changeLevelToBowRoom ( event )
  roomNumber = "Bow Room"
  displayRoom:removeSelf()
  displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )
  displayRoom.alpha = 1
 composer.gotoScene( "scenes.BowRoom" )

 composer.removeScene("scenes.level4")
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

      map = display.newImage(sceneGroup,"graphics/maps/level4.png")
      map.xScale  = 10
      map.yScale  = 10
      map.x = 7000
      map.y = 1200
      map:toBack()


      myPlayer.x = 0
      myPlayer.y = 0
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
  if(bowRoomEntered == false) then
    local obstacle1 = createUpDownObstacle( 1900 , -100 , 600 , 700, "graphics/obstacles/gobstopper.png" , 3  )
    local enemyStatic = createStaticAI( 6300 , -600 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 6500 , -650 , 3 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 6650 , -650 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 6100 , -660 , 3 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 6000 , -780 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 7400 , 509 , 2 ,"graphics/AI/marshmelloArcherAI.png" )

    local enemyStatic = createStaticAI( 8230 , 510 , 3 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 8400 , 510 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 8550 , 610  , 2 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 8700 , 510 , 3 ,"graphics/AI/marshmelloArcherAI.png" )

    local enemyStatic = createStaticAI( 8530 , -780 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 8740 ,-680  , 3 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 8933 , -580  , 3 ,"graphics/AI/marshmelloArcherAI.png" )
    local enemyStatic = createStaticAI( 9060 , -580 , 2 ,"graphics/AI/marshmelloArcherAI.png" )

    local obstacle1 = createUpDownObstacle( 13160 , -70 , 1200 , 700, "graphics/obstacles/gobstopper.png" , 4  )
    local obstacle1 = createUpDownObstacle(  13400 , -70 , 1200 , 700, "graphics/obstacles/gobstopper.png" , 4  )

    local enemySquare = createSquareAI( 11560 ,-600 , 300 , 500 , 3)
    local enemySquare = createSquareAI( 11360 ,-780 , 300 , 500 , 3)
    local enemySquare = createSquareAI( 11580 ,-660 , 300 , 500 , 3)
  end
        --function to set alpha channels

        local z = 0


        --Outer walls and myName is the collision identifier
        local wallsHitbox = display.newGroup()
        --insert walls here


        outsideWalls= display.newRect(-600, -50, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3250, -900, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3720, -900, 150, 1200)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(14750, -50, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(14850, -480, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(13700, -480, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(14850, 310, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(13700, 310, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(13650, -320, 150, 150)
        outsideWalls:setFillColor(0, 0, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(14000, 460, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(13700, -480, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(510, 580, 150, 1000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(-200, -640, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(-200, 475, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(465, 315, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(625, -470, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7000, 150, 13000, 150)
        outsideWalls:setFillColor(1, 1, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "void"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(1640, -325, 3360, 150)
        outsideWalls:setFillColor(1, 1, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "void"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(8640, -325, 10000, 150)
        outsideWalls:setFillColor(1, 1, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "void"
        wallsHitbox:insert(outsideWalls)

        portal = display.newRect(14200, -520, 500, 120)
        portal:setFillColor(1, 0, 0, z)
        physics.addBody( portal, "static" , {bounce = 0 })
        portal.myName = "portalTo5"
        wallsHitbox:insert(portal)

    portal2 = display.newRect(3700, -1550, 1000, 120)
    portal2:setFillColor(1, 0, 0, z)
    physics.addBody( portal2, "static" , {bounce = 0 })
    portal2.myName = "portalToBowRoom"
    wallsHitbox:insert(portal2)


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
