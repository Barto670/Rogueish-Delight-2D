local composer = require( "composer" )
local scene = composer.newScene()


---------------BUTTON CALLING FUCNTIONS--------------------------------------




function gotoInitialLevel()
     composer.gotoScene( ("scenes.tutorial"), { time=800, effect="crossFade" } )
     notMenu = true
     playSFX(newGameSound)
     KillMusic(mainmenumusic)
     --playSFX(level1Music)



     composer.removeScene("scenes.menu")


end

function closeapp()
           native.requestExit()
end


local function gotoCredits()
composer.gotoScene( ("scenes.credits"), { time=400, effect="crossFade" } )
notMenu = true

    composer.removeScene("scenes.menu")

end

local function gotoControls()
composer.gotoScene( ("scenes.controlguide"), { time=400, effect="crossFade" } )
notMenu = true

    composer.removeScene("scenes.menu")


end

-----------------------------------------MUSIC_BACKGROUND-----------------------------------------

--local backgroundMusic = audio.loadStream( "sounds/mainmenumusic.mp3" )

local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=500 } )

audio.reserveChannels( 1 )






-------------------------------------VOLUME CONTROLS---------------------------------------------
local function onSoundsTouch()

           audio.setVolume(0)
end

local function onSoundsTouchON()

           audio.setVolume(1)
end

audio.setVolume( 0.1, { channel=1 } )





-----------------------SOUND EFFECTS--------------------------------
 ----------------RESERVED FOR SOUND EFFECTS MUSIC-------------------
arrowShoot= audio.loadSound( "sounds/arrow.mp3" )
playerHit = audio.loadSound ("sounds/hit.wav")
gunShoot = audio.loadSound ("sounds/gun.mp3")
footStep1 = audio.loadSound ("sounds/footStep1.mp3")
footStep2 = audio.loadSound ("sounds/footStep2.mp3")
footSteps = audio.loadSound ("sounds/footStep.mp3")
grapple = audio.loadSound ("sounds/grapple.mp3")

 ----------RESERVED FOR BACKGROUND MUSIC-------------------
level1Music = audio.loadStream( "sounds/level1music.mp3" )

--------FUNCTION TO LOAD SOUND EFFECTS---------------------
soundisOn = true
musicisOn = true

function playSFX (soundfile, volumelevel)

if soundisOn == true then
  local volumelevel = 0.4
  audio.play(soundfile)
  audio.setVolume(volumelevel, {soundfile} )
  end
end

function KillMusic (soundfile)
  if musicisOn == true then
    audio.fadeOut( { channel=1, time=0} )
  end
end

------------------------------------END OF BUTTONS--------------------------------------


level = 1
local function gotoHighScores()
    composer.gotoScene( "highscores" )
end
-------------------------------------------------------------------------------------------------

function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local background = display.newImageRect( sceneGroup , "graphics/menu/MenuStatic.png", 1280 , 1280)
      background.x = display.contentCenterX
      background.y = display.contentCenterY

--------------------------- ADD BUTTONS HERE-----------------------------------------------

     local playButton = display.newImageRect(sceneGroup ,"graphics/menu/NewGameButton.png" ,497,200)
     playButton.x = display.contentCenterX
     playButton.y = display.contentCenterY -100



     local creditsButton = display.newImageRect(sceneGroup ,"graphics/menu/CreditsButton.png" ,497,200)
     creditsButton.x = display.contentCenterX
     creditsButton.y = display.contentCenterY + 60


     local controlButton = display.newImageRect(sceneGroup ,"graphics/menu/ControlsButton.png" ,497,200)
     controlButton.x = display.contentCenterX
     controlButton.y = display.contentCenterY + 225

     local exitButton = display.newImageRect(sceneGroup ,"graphics/menu/ExitButton.png" ,497,200)
     exitButton.x = display.contentCenterX
     exitButton.y = display.contentCenterY + 390

    local title = display.newImageRect(sceneGroup ,"graphics/menu/rogueish.png", 500, 148)
    title.x = display.contentCenterX
    title.y = display.contentCenterY -300


    ---SOUND OFF BUTTON----------

    local muteButton = display.newImageRect(sceneGroup ,"graphics/menu/soundoff2.png" ,100,75)
    muteButton.x = display.contentCenterX - 400
    muteButton.y = display.contentCenterY + 400

    local unmuteButton = display.newImageRect(sceneGroup ,"graphics/menu/soundon.png" ,100,100)
    unmuteButton.x = display.contentCenterX - 550
    unmuteButton.y = display.contentCenterY + 400

    --TITLE STUFF BELOW

    local playText = display.newText(sceneGroup ,"", display.contentCenterX, display.contentCenterY - 100, native.systemFont, 50)
    playText:setFillColor(0,0,0)

    --BUTTONS CALLED FROM FUNCTIONS AT THE TOP

    playButton:addEventListener("tap" , gotoInitialLevel)
    exitButton:addEventListener("tap" , closeapp)
    creditsButton:addEventListener("tap" , gotoCredits)
    controlButton:addEventListener("tap" , gotoControls)
    muteButton:addEventListener("tap" , onSoundsTouch)
    unmuteButton:addEventListener("tap" , onSoundsTouchON)


end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
