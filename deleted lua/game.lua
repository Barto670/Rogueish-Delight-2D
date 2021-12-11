local composer = require( "composer" )

local scene = composer.newScene()
physics = require ("physics" )
local function gotoMenu()

  composer.gotoScene("menu")
  return true
end

function scene:create ( event )
local sceneGroup = self.view
local camerEngine = require ("ssk2.loadSSK")
_G.ssk.init()

display.setDefault("magTextureFilter", "nearest" )


--start physics
  group = display.currentStage

  physics.start()
  physics.setGravity( 0, 0 )
  physics.setAverageCollisionPositions(true)
  physics.setVelocityIterations(8)
  physics.setPositionIterations(8)

--menu / level loading

    require("level1")       -- level loader
    require("movement")     --myPlayer movement WASD
    require("mouse")        -- turn on mouse
    require("animation")    -- animated myPlayer
    --require("AIstatic")
    --require("wall")       -- turn walls on /wall collistion on
    --require("AIFollower") -- AI that follows you around
    --require("mousetest")  -- test the mouse X and Y coordinates
level = level + 1
print (level)
-- track camera ssk2
    ssk.camera.tracking( camera, group, {centered =true}  )



local tiled   = require "com.ponywolf.ponytiled"
local mapData = require "Map1"

display.setDefault("background", 0.2)
myPlayer:addEventListener("tap" , gotoMenu)

end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
