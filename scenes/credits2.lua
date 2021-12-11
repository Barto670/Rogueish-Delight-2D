-- loads the map


local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

enemyCount = 0
enemyCountDisplay:removeSelf()
enemyCountDisplay = display.newText(enemyCount, 40, 40, native.systemFont, 30)
playerHP = playerHP + 3
if(playerHP > 10) then
  playerHP = 10
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

function changeLevelToCredits ( event )
  roomNumber = "Room Credits"
  displayRoom.alpha = 0

  composer.gotoScene( "scenes.credits" )

  composer.removeScene("scenes.level6")
end

-- create()
function scene:create( event )

  local sceneGroup = self.view
  -- Code here runs when the scene is first created but has not yet appeared on screen

  --position the map in the center

end


-- show()
function scene:show( event )
  local widget = require "widget"
  local sceneGroup = self.view
  local phase = event.phase


  if ( phase == "will" ) then

    -- Code here runs when the scene is still off screen (but is about to come on screen)

  elseif ( phase == "did" ) then
    -- Code here runs when the scene is entirely on screen

    map = display.newImage(sceneGroup, "graphics/maps/credits.png")
    map.xScale = 1
    map.yScale = 1
    map.x = 0
    map.y = 0
    map:toBack()

    local exitButton2 = display.newImageRect("graphics/menu/ExitButton.png", 497, 200)
    exitButton2.x = 0
    exitButton2.y = 500


    exitButton2:addEventListener("tap" , closeapp)


    myPlayer.x = 0
    myPlayer.y = 0
    MouseX = 0
    MouseY = 0
    camera.x = ((myPlayer.x) + (MouseX / 3)) - 215 --camera x value
    camera.y = ((myPlayer.y) + (MouseY / 3)) - 230 --camera y value
    grappleCooldown = false
    grappleFinished = true
    CurrentVelocityX = 0
    CurrentVelocityY = 0
    myPlayer:setLinearVelocity(CurrentVelocityX, CurrentVelocityY)

    --variable map is stored/loaded into
    cameraGroup = display.currentStage
    myPlayer:toBack()
    myPlayerMovementSpeed = 0
    --create enemies here


    --function to set alpha channels
    local z = 0

    --Outer walls and myName is the collision identifier
    local wallsHitbox = display.newGroup()
    --insert walls here

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
