local composer = require( "composer" )

local scene = composer.newScene()


function gotoMenu()
    composer.gotoScene( ("scenes.menu"), { time=300, effect="crossFade" } )
    notMenu = true

    composer.removeScene("scenes.credits")

end



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

function scene:create( event )

    local sceneGroup = self.view
    local background = display.newImageRect( sceneGroup , "graphics/menu/MenuStatic.png", 1280 , 1280)
      background.x = display.contentCenterX
      background.y = display.contentCenterY


      local mainButton = display.newImageRect(sceneGroup ,"graphics/menu/backtomain.png" ,497,200)
      mainButton.x = display.contentCenterX
      mainButton.y = display.contentCenterY + 225

      local title = display.newImageRect(sceneGroup ,"graphics/menu/endcredits.png", 500, 500)
          title.x = display.contentCenterX
          title.y = display.contentCenterY -150



      mainButton:addEventListener("tap" , gotoMenu)

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
