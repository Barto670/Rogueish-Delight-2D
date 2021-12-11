-- loads the map




local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


enemyCount = 0

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------



 function changeLevelToX ( event )
   roomNumber = "Room X"
   displayRoom:removeSelf()
   displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )
   displayRoom.alpha = 1
  composer.gotoScene( "scenes.levelX" )

  composer.removeScene("scenes.level(X-1)")
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
      map.x =0
      map.y =0
      map:toBack()


      myPlayer.x = 0
      myPlayer.y = 0
      MouseX = 0
      MouseY = 0


        --variable map is stored/loaded into
        cameraGroup = display.currentStage

  --create enemies here

        --function to set alpha channels
        local z = 1

        --Outer walls and myName is the collision identifier
        local wallsHitbox = display.newGroup()
        --insert walls here

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
