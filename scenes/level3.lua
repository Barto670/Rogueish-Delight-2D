-- loads the map

bowRoomEntered = false


local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

enemyCount = 12
enemyCountDisplay:removeSelf()
enemyCountDisplay = display.newText(enemyCount , 40 , 40, native.systemFont, 30)
playerHP = playerHP + 3
if(playerHP > 10) then
  playerHP = 10
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------



 function changeLevelTo4 ( event )
   roomNumber = "Room 4"
   displayRoom:removeSelf()
   displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )
   displayRoom.alpha = 1
  composer.gotoScene( "scenes.level4" )

  composer.removeScene("scenes.level3")
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

      map = display.newImage(sceneGroup,"graphics/maps/Level3.png")
      map.xScale  = 10
      map.yScale  = 10
      map.x = 3600
      map.y = 2000
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

local enemykk = createSquareAI( 1365 ,820 , 500 , 500 , 3)
local enemykk = createStaticAI( 2028 , 776 , 4 ,"graphics/AI/marshmelloArcherAI.png" )

local enemykk = createSquareAI( 2300 ,3530 , 500 , 500 , 3)
local enemykk = createStaticAI( 2170 , 3033 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemykk = createStaticAI( 3100 , 2560 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemykk = createStaticAI( 2933 , 3340 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemykk = createStaticAI( 2463 , 3840 , 2 ,"graphics/AI/marshmelloArcherAI.png" )
local enemykk = createSquareObstacle( 2535 , 3023 , 700 , 700 , 4 , 1)
local enemykk = createSquareAI( 3330 ,3470 , 500 , 500 , 3)
local enemykk =  createUpDownObstacle( 3110 , 3250 , 1000 , 700, "graphics/obstacles/gobstopper.png" , 4  )
local enemykk = createStaticAI( 6633 , 3610 , 4 ,"graphics/AI/marshmelloArcherAI.png" )
local enemykk = createStaticAI( 3750 , 3850 , 4 ,"graphics/AI/marshmelloArcherAI.png" )
--]]

        --function to set alpha channels
        local z = 0


        --Outer walls and myName is the collision identifier
        local wallsHitbox = display.newGroup()
        --insert walls here


        outsideWalls= display.newRect(-240, 0, 150, 800)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(1500, -310, 3500, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(200, 310, 1000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(1600, 1600, 1600, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3510, 1600, 1600, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(1600, 2400, 1600, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3510, 2400, 1600, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2810, 4150, 2000, 150)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(720, 1250, 150, 2000)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3280, 600, 150, 2100)
        outsideWalls:setFillColor(1, 0, 1, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3910, 2800, 150, 1000)
        outsideWalls:setFillColor(1, 0, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(3910, 4260, 150, 1000)
        outsideWalls:setFillColor(1, 0, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(1850, 3500, 150, 2000)
        outsideWalls:setFillColor(1, 0, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2323, 2000, 150, 800)
        outsideWalls:setFillColor(1, 0, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(2795 , 2000, 150, 800)
        outsideWalls:setFillColor(1, 0, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(5350 , 3370, 3000, 150)
        outsideWalls:setFillColor(0, 1, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(5850 , 3830, 4000, 150)
        outsideWalls:setFillColor(0, 1, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(7440 , 3430, 150, 800)
        outsideWalls:setFillColor(0, 1, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        outsideWalls= display.newRect(6950 , 3035, 170, 800)
        outsideWalls:setFillColor(0, 1, 0, z)
        physics.addBody(outsideWalls, "static" , {bounce = 0 })
        outsideWalls.myName = "wall"
        wallsHitbox:insert(outsideWalls)

        portal = display.newRect(7150, 3220, 500, 120)
        portal:setFillColor(1, 0, 0, z)
        physics.addBody( portal, "static" , {bounce = 0 })
        portal.myName = "portalTo4"
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
