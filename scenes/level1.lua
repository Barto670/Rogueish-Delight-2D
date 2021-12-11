-- loads the map




local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

enemyCount = 14
enemyCountDisplay:removeSelf()
enemyCountDisplay = display.newText(enemyCount , 40 , 40, native.systemFont, 30)
playerHP = playerHP + 3
if(playerHP > 10) then
  playerHP = 10
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------



 function changeLevelTo2 ( event )
   roomNumber = "Room 2"
   displayRoom:removeSelf()
   displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )
   displayRoom.alpha = 1

  composer.gotoScene( "scenes.level2" )

  composer.removeScene("scenes.level1")
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

      map = display.newImage(sceneGroup,"graphics/maps/Level1.png")
      map.xScale  = 10
      map.yScale  = 10
      map.x = 6074
      map.y = 1925
      map:toBack()


      myPlayer.x = 300
      myPlayer.y = 2600
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
      local enemySquare = createSquareAI( 3500 ,1000 , 500 , 500 , 3)
      local enemySquare2 = createSquareAI( 4000 ,1000 , 500 , 500 , 3)
      local obstacleRL1 = createRightLeftObstacle( 3180 , 3100 , 3500 , 700 , "graphics/obstacles/gobstopper.png", 4  )
      local obstacleRL2 = createRightLeftObstacle( 3180 , 2000 , 3500 , 700,"graphics/obstacles/gobstopper.png" , 4  )
      local obstacleRL3 = createLeftRightObstacle( 3180 , 3250 , 3500 , 700,"graphics/obstacles/gobstopper.png" , 4  )
      local obstacleRL4 = createLeftRightObstacle( 3180 , 2150 , 3500 , 700, "graphics/obstacles/gobstopper.png" , 4  )
      local obstacle1 = createUpDownObstacle( 4800 , 2750 , 1200 , 700, "graphics/obstacles/gobstopper.png" , 4  )
      local enemyStatic = createStaticAI( 2784 , 880 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
      local enemyStatic1 = createStaticAI( 6958 , 2165 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
      local enemyStatic2 = createStaticAI( 6958 , 3265 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
      local enemyStatic2 = createStaticAI( 7928 , 2734 , 5 ,"graphics/AI/marshmelloArcherAI.png" )
      local enemySquare3 = createSquareAI (7920 , 2734 , 500 , 500 ,3)
      local enemyStatic3 = createStaticAI( 10790 , 1560 , 3 ,"graphics/AI/marshmelloArcherAI.png" )
      local enemyStatic3 = createStaticAI( 10950 , 1560 , 3 ,"graphics/AI/marshmelloArcherAI.png" )
        --function to set alpha channels
        --]]
        local z = 0


        --Outer walls and myName is the collision identifier
        local wallsHitbox = display.newGroup()
        --insert walls here
        topRectKitchen = display.newRect(3725 ,475, 3045, 150)
        topRectKitchen:setFillColor(1, 1, 0, z)
        physics.addBody( topRectKitchen, "static" , {bounce = 0 })
        topRectKitchen.myName = "wall"
        wallsHitbox:insert(topRectKitchen)


        bottomRectKitchen = display.newRect(3090 ,1355, 1500, 150)
        bottomRectKitchen:setFillColor(1, 0, 0, z)
        physics.addBody( bottomRectKitchen, "static" , {bounce = 0 })
        bottomRectKitchen.myName = "wall"
        wallsHitbox:insert(bottomRectKitchen)

        bottomRectKitchen2 = display.newRect(4912 ,1355, 1500, 150)
        bottomRectKitchen2:setFillColor(1, 0, 0, z)
        physics.addBody( bottomRectKitchen2, "static" , {bounce = 0 })
        bottomRectKitchen2.myName = "wall"
        wallsHitbox:insert(bottomRectKitchen2)

        sideRectKitchen = display.newRect(4555 ,1100, 150, 1500)
        sideRectKitchen:setFillColor(1, 0, 0, z)
        physics.addBody( sideRectKitchen, "static" , {bounce = 0 })
        sideRectKitchen.myName = "wall"
        wallsHitbox:insert(sideRectKitchen)

        sideRectKitchen2 = display.newRect(2490 ,1100, 150, 1500)
        sideRectKitchen2:setFillColor(1, 0, 0, z)
        physics.addBody( sideRectKitchen2, "static" , {bounce = 0 })
        sideRectKitchen2.myName = "wall"
        wallsHitbox:insert(sideRectKitchen2)

        sideRectKitchen3 = display.newRect(2630 ,1110, 150, 500)
        sideRectKitchen3:setFillColor(1, 0, 0, z)
        physics.addBody( sideRectKitchen3, "static" , {bounce = 0 })
        sideRectKitchen3.myName = "wall"
        wallsHitbox:insert(sideRectKitchen3)

        sideRectKitchen4 = display.newRect(2750 ,1250, 500, 150)
        sideRectKitchen4:setFillColor(1, 0, 0, z)
        physics.addBody( sideRectKitchen4, "static" , {bounce = 0 })
        sideRectKitchen4.myName = "wall"
        wallsHitbox:insert(sideRectKitchen4)

        sideRectKitchen5 = display.newRect(4600 ,1200, 500, 150)
        sideRectKitchen5:setFillColor(1, 0, 0, z)
        physics.addBody( sideRectKitchen5, "static" , {bounce = 0 })
        sideRectKitchen5.myName = "wall"
        wallsHitbox:insert(sideRectKitchen5)

        diningRoomTopRect = display.newRect(2315, 1845, 3045, 150)
        diningRoomTopRect:setFillColor(1, 1, 0, z)
        physics.addBody( diningRoomTopRect, "static" , {bounce = 0 })
        diningRoomTopRect.myName = "wall"
        wallsHitbox:insert(diningRoomTopRect)

        diningRoomTopRect2 = display.newRect(4655, 1845, 1000, 150)
        diningRoomTopRect2:setFillColor(1, 1, 0, z)
        physics.addBody( diningRoomTopRect2, "static" , {bounce = 0 })
        diningRoomTopRect2.myName = "wall"
        wallsHitbox:insert(diningRoomTopRect2)

        diningRoomTopRect3 = display.newRect(3760, 1600, 150, 400)
        diningRoomTopRect3:setFillColor(1, 1, 0, z)
        physics.addBody( diningRoomTopRect3, "static" , {bounce = 0 })
        diningRoomTopRect3.myName = "wall"
        wallsHitbox:insert(diningRoomTopRect3)

        diningRoomTopRect4 = display.newRect(4230, 1600, 150, 400)
        diningRoomTopRect4:setFillColor(1, 1, 0, z)
        physics.addBody( diningRoomTopRect4, "static" , {bounce = 0 })
        diningRoomTopRect4.myName = "wall"
        wallsHitbox:insert(diningRoomTopRect4)

        diningRoomTable = display.newRect(3200, 2550, 2900, 600)
        diningRoomTable:setFillColor(1, 1, 0, z)
        physics.addBody( diningRoomTable, "static" , {bounce = 0 })
        diningRoomTable.myName = "wall"
        wallsHitbox:insert(diningRoomTable)

        entraceCorridorTop = display.newRect(700, 2325, 1200, 150)
        entraceCorridorTop:setFillColor(0, 0, 1, z)
        physics.addBody(entraceCorridorTop, "static" , {bounce = 0 })
        entraceCorridorTop.myName = "wall"
        wallsHitbox:insert(entraceCorridorTop)

        entraceCorridorbottom = display.newRect(700, 2795, 1200, 150)
        entraceCorridorbottom:setFillColor(0, 0, 1, z)
        physics.addBody(entraceCorridorbottom, "static" , {bounce = 0 })
        entraceCorridorbottom.myName = "wall"
        wallsHitbox:insert(entraceCorridorbottom)

        entraceCorridorbottom = display.newRect(85, 2795, 150, 1200)
        entraceCorridorbottom:setFillColor(0, 0, 1, z)
        physics.addBody(entraceCorridorbottom, "static" , {bounce = 0 })
        entraceCorridorbottom.myName = "wall"
        wallsHitbox:insert(entraceCorridorbottom)

        diningroomWallRect= display.newRect(1360, 2100, 150, 600)
        diningroomWallRect:setFillColor(0, 1, 1, z)
        physics.addBody(diningroomWallRect, "static" , {bounce = 0 })
        diningroomWallRect.myName = "wall"
        wallsHitbox:insert(diningroomWallRect)

        diningroomWallRect2= display.newRect(1360, 3020, 150, 600)
        diningroomWallRect2:setFillColor(0, 1, 1, z)
        physics.addBody(diningroomWallRect2, "static" , {bounce = 0 })
        diningroomWallRect2.myName = "wall"
        wallsHitbox:insert(diningroomWallRect2)

        diningroomWallRect3= display.newRect(3000, 3430, 4000, 150)
        diningroomWallRect3:setFillColor(0, 1, 1, z)
        physics.addBody(diningroomWallRect3, "static" , {bounce = 0 })
        diningroomWallRect3.myName = "wall"
        wallsHitbox:insert(diningroomWallRect3)

        diningroomWallRect4= display.newRect(5035, 2260, 150, 600)
        diningroomWallRect4:setFillColor(0, 1, 1, z)
        physics.addBody(diningroomWallRect4, "static" , {bounce = 0 })
        diningroomWallRect4.myName = "wall"
        wallsHitbox:insert(diningroomWallRect4)

        diningroomWallRect5= display.newRect(5035, 3180, 150, 600)
        diningroomWallRect5:setFillColor(0, 1, 1, z)
        physics.addBody(diningroomWallRect5, "static" , {bounce = 0 })
        diningroomWallRect4.myName = "wall"
        wallsHitbox:insert(diningroomWallRect5)

        corridorOut= display.newRect(5900, 2485, 1610, 150)
        corridorOut:setFillColor(1, 0, 1, z)
        physics.addBody(corridorOut, "static" , {bounce = 0 })
        corridorOut.myName = "wall"
        wallsHitbox:insert(corridorOut)

        corridorOut2= display.newRect(5900, 2955, 1610, 150)
        corridorOut2:setFillColor(1, 0, 1, z)
        physics.addBody(corridorOut2, "static" , {bounce = 0 })
        corridorOut2.myName = "wall"
        wallsHitbox:insert(corridorOut2)

        outsideWalls= display.newRect(6650, 3380, 150, 900)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls2= display.newRect(6650, 2080, 150, 900)
        outsideWalls2:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls2, "static" , {bounce = 0 })
        outsideWalls2.myName = "wall"
        wallsHitbox:insert(outsideWalls2)

        outsideWalls3= display.newRect(7900, 3750, 3000, 150)
        outsideWalls3:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls3, "static" , {bounce = 0 })
        outsideWalls3.myName = "wall"
        wallsHitbox:insert(outsideWalls3)

        outsideWalls4= display.newRect(7900, 1700, 3000, 150)
        outsideWalls4:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls4, "static" , {bounce = 0 })
        outsideWalls4.myName = "wall"
        wallsHitbox:insert(outsideWalls4)

        outsideWalls5= display.newRect(9030, 2000, 150, 900)
        outsideWalls5:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls5, "static" , {bounce = 0 })
        outsideWalls5.myName = "wall"
        wallsHitbox:insert(outsideWalls5)

        outsideWalls6= display.newRect(9030, 3320, 150, 900)
        outsideWalls6:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls6, "static" , {bounce = 0 })
        outsideWalls6.myName = "wall"
        wallsHitbox:insert(outsideWalls6)

        outsideWalls7= display.newRect(9830, 2400, 1500, 150)
        outsideWalls7:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls7, "static" , {bounce = 0 })
        outsideWalls7.myName = "wall"
        wallsHitbox:insert(outsideWalls7)

        outsideWalls8= display.newRect(10000, 2950, 2000, 150)
        outsideWalls8:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls8, "static" , {bounce = 0 })
        outsideWalls8.myName = "wall"
        wallsHitbox:insert(outsideWalls8)

        outsideWalls9= display.newRect(10650, 1880, 150, 1200)
        outsideWalls9:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls9, "static" , {bounce = 0 })
        outsideWalls9.myName = "wall"
        wallsHitbox:insert(outsideWalls9)

        outsideWalls10= display.newRect(11110, 2000, 150, 1800)
        outsideWalls10:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls10, "static" , {bounce = 0 })
        outsideWalls10.myName = "wall"
        wallsHitbox:insert(outsideWalls10)

        outsideWalls11= display.newRect(11000, 1300, 500, 150)
        outsideWalls11:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls11, "static" , {bounce = 0 })
        outsideWalls11.myName = "wall"
        wallsHitbox:insert(outsideWalls11)

        portal = display.newRect(11000,1350, 500, 120)
         portal:setFillColor(1, 0, 0, z)
         physics.addBody( portal, "static" , {bounce = 0 })
         portal.myName = "portalTo2"
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
