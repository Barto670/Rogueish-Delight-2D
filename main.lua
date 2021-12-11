--display and composer settings
H = display.contentHeight
W = display.contentWidth
local composer = require( "composer" )

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )
-- Seed the random number generator
math.randomseed( os.time() )
require ("ssk2.loadSSK")
_G.ssk.init()
display.setDefault("magTextureFilter", "nearest" )
physics.start()
physics.setGravity( 0, 0 )
physics.setAverageCollisionPositions(true)
physics.setVelocityIterations(8)
physics.setPositionIterations(8)
display.setDefault("magTextureFilter", "nearest" )
-- Go to the menu screen
composer.gotoScene( "scenes.menu" )
physics.setContinuous( false )
