-- loads the map

local buttonAppeared = 0
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
function reload (event)

composer.gotoScene( ("scenes.tutorial"), { time=800, effect="crossFade" } )

end


function gameOver ( event )

  if (buttonAppeared == 0) then
  camera:stopCamera()

  myPlayer:toBack()

  local redBackground = display.newRect(camera.x ,camera.y, 5000, 5000)
  redBackground.x = camera.x
  redBackground.y = camera.y
  redBackground:setFillColor(1, 0, 0, 0.4)

  local gameExitButton = display.newImageRect("graphics/menu/ExitButton.png" ,497,200)
  gameExitButton.x = camera.x
  gameExitButton.y = camera.y + 200


  local gameRetryButton = display.newImageRect("graphics/menu/YouDied.png" ,586,82)
  gameRetryButton.x = camera.x
  gameRetryButton.y = camera.y -300


gameExitButton:addEventListener("tap" , closeapp)


buttonAppeared = 1
end
end


 function changeLevelTo1 ( event )
  roomNumber = "Room 1"
  displayRoom:removeSelf()
  displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )
  displayRoom.alpha = 1


  composer.gotoScene( "scenes.level1" )

  composer.removeScene("scenes.tutorial")
end

-- create()
function scene:create( event )
audio.play(level1Music ,{ channel=6, loops=-1, fadein=5000 } )

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

      local map = display.newImage("graphics/maps/TutorialMap.png")
        map.xScale  = 10
        map.yScale  = 10
        map.x = map.x +2480
        map.y = map.y +800
        map:toBack()
        sceneGroup:insert(map)
        --map scape

        character = require("movement")
        charAnimations = require("animation")
        mouse = require("mouse")
        firing = require("bullet")
        myPlayer.x = 1280-1000
        myPlayer.y = 1280-300



        --actually idk what this does


        --variable map is stored/loaded into



        cameraGroup = display.currentStage
        ssk.camera.tracking( camera, cameraGroup, {centered =true}  )

        local AIsquare = require("ai.AIMovesInSquare")
        local AIstatic = require("ai.AIstatic")
        local AIboss = require("ai.AIStaticBoss")
        local squareObstacle = require("obstacles.MovesInSquare")
                local lineObstacle = require("obstacles.MovesRightLeft")
                local lineObstacle2 = require("obstacles.MovesLeftRight")
                local line2Obstacle = require("obstacles.MovesUpDown")
                local line2Obstacle2 = require("obstacles.MovesDownUp")
        require("grapple")
        require("pickups")

        roomNumber = "Tutorial Room"
        displayRoom.alpha = 1

        enemyCount = 2
        enemyCountDisplay:removeSelf()
        enemyCountDisplay = display.newText(enemyCount , 40 , 40, native.systemFont, 30)

        grappleCooldown = false
        grappleFinished = true
        CurrentVelocityX =0
        CurrentVelocityY =0
        myPlayer:setLinearVelocity(CurrentVelocityX , CurrentVelocityY)

        local enemy3 = createStaticAI (4100 , 1300 , 2 ,"graphics/AI/marshmelloArcherAI.png")
        local enemy1 = createStaticAI ( 4100 , 700 , 2 ,"graphics/AI/marshmelloArcherAI.png" )

      local weapon = createWeapon(20000000,10000000)

        --function to set alpha channels
        local z = 0

        --Outer walls and myName is the collision identifier
        local wallsHitbox = display.newGroup()
        topRect1 = display.newRect(0 ,0, 3045, 150)
        topRect1.x = 1525
        topRect1.y = 725
        topRect1:setFillColor(1, 0, 0, z)
        physics.addBody( topRect1, "static" , { density = 1 , friction = 0.3 ,bounce = 0 })
        topRect1.myName = "wall"
        wallsHitbox:insert(topRect1)


        topRect2 = display.newRect(0 ,0, 3045, 150)
        topRect2.x = 3725
        topRect2.y = 575
        topRect2:setFillColor(1, 0, 0, z)
        physics.addBody( topRect2, "static" , {bounce = 0 })
        topRect2.myName = "wall"
        wallsHitbox:insert(topRect2)

        bottomRect1 = display.newRect(0 ,0, 3045, 150)
        bottomRect1.x = 1525
        bottomRect1.y = 1360
        bottomRect1:setFillColor(1, 0, 0, z)
        physics.addBody( bottomRect1, "static" , {bounce = 0 })
        bottomRect1.myName = "wall"
        wallsHitbox:insert(bottomRect1)

        bottomRect2 = display.newRect(0 ,0, 3045, 150)
        bottomRect2.x = 3725
        bottomRect2.y = 1515
        bottomRect2:setFillColor(1, 0, 0, z)
        physics.addBody( bottomRect2, "static" , {bounce = 0 })
        bottomRect2.myName = "wall"
        wallsHitbox:insert(bottomRect2)

        sideRect2 = display.newRect(0 ,0, 150, 400)
        sideRect2.x = 4245
        sideRect2.y = 1325
        sideRect2:setFillColor(1, 0, 0, z)
        physics.addBody( sideRect2, "static" , {bounce = 0 })
        sideRect2.myName = "wall"
        wallsHitbox:insert(sideRect2)


        sideRect3 = display.newRect(0 ,0, 150, 400)
        sideRect3.x = 4245
        sideRect3.y = 760
        sideRect3:setFillColor(1, 0, 0, z)
        physics.addBody( sideRect3, "static" , {bounce = 0 })
        sideRect3.myName = "wall"
        wallsHitbox:insert(sideRect3)

        sideRect4 = display.newRect(0 ,0, 150, 400)
        sideRect4.x = 4560
        sideRect4.y = 760
        sideRect4:setFillColor(1, 0, 1, z)
        physics.addBody( sideRect4, "static" , {bounce = 0 })
        sideRect4.myName = "wall"
        wallsHitbox:insert(sideRect4)

        sideRect5 = display.newRect(0 ,0, 150, 800)
        sideRect5.x = 4875
        sideRect5.y = 775
        sideRect5:setFillColor(1, 0, 0, z)
        physics.addBody( sideRect5, "static" , {bounce = 0 })
        sideRect5.myName = "wall"
        wallsHitbox:insert(sideRect5)

        sideRect6 = display.newRect(0 ,0, 800, 150)
        sideRect6.x = 4625
        sideRect6.y = 1205
        sideRect6:setFillColor(1, 0, 0, z)
        physics.addBody( sideRect6, "static" , {bounce = 0 })
        sideRect6.myName = "wall"
        wallsHitbox:insert(sideRect6)

        sideRect7 = display.newRect(0 ,0, 400, 150)
        sideRect7.x = 4430
        sideRect7.y = 880
        sideRect7:setFillColor(1, 0, 1, z)
        physics.addBody( sideRect7, "static" , {bounce = 0 })
        sideRect7.myName = "wall"
        wallsHitbox:insert(sideRect7)

        sideRect8 = display.newRect(0 ,0, 150, 800)
        sideRect8.x = 85
        sideRect8.y = 1025
        sideRect8:setFillColor(1, 0,0, z)
        physics.addBody( sideRect8, "static" , {bounce = 0 })
        sideRect8.myName = "wall"
        wallsHitbox:insert(sideRect8)

        grappleRock = display.newRect(2165,1055, 140, 120)
        grappleRock:setFillColor(1, 0, 0, z)
        physics.addBody( grappleRock, "static" , {bounce = 0 })
        grappleRock.myName = "wall"
        wallsHitbox:insert(grappleRock)

        portal = display.newRect(4730,720, 120, 120)
        portal:setFillColor(1, 0, 0, z)
        physics.addBody( portal, "static" , {bounce = 0 })
        portal.myName = "portalTo1"
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
