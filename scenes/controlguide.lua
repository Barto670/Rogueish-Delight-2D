local composer = require( "composer" )

local scene = composer.newScene()


local function gotoMenu()
    composer.gotoScene( ("scenes.menu"), { time=300, effect="crossFade" } )
    notMenu = true

    composer.removeScene("scenes.credits")

end



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

function scene:create( event )

    local sceneGroup = self.view
    local background = display.newImageRect( sceneGroup , "graphics/menu/MenuGif1.png", 1280 , 1280)
      background.x = display.contentCenterX
      background.y = display.contentCenterY


      local mainButton = display.newImageRect(sceneGroup ,"graphics/menu/backtomain.png" ,497,200)
      mainButton.x = display.contentCenterX
      mainButton.y = display.contentCenterY + 390

      local title = display.newImageRect(sceneGroup ,"graphics/menu/controls.png", 1280, 720)
          title.x = display.contentCenterX
          title.y = display.contentCenterY -50



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
