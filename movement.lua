--variables
keydown = false
myPlayerMovementSpeed = 700



          -------MY PLAYER SETUP--------
--tells the program what are the options for the frames
local sheetOptions = {
    width               = 64,
    height              = 96,
    numFrames           = 16,
    sheetContentWidth   = 256,
    sheetContentHeight  = 384,
}
--loads in the character frames
local playerSheet = graphics.newImageSheet( "graphics/character/CharacterFrames.png", sheetOptions)
--splitting the frames into 4 different directions + setting time between each frame
local sequenceData = {
  {name = "walkDown",   frames = { 1, 2, 3, 4},     time = 600, loopCount = 0},
  {name = "walkUp",     frames = { 5, 6, 7, 8},     time = 600, loopCount = 0},
  {name = "walkLeft",   frames = { 9, 10, 11, 12},  time = 600, loopCount = 0},
  {name = "walkRight",  frames = { 14, 15, 16, 13}, time = 600, loopCount = 0}
}

--myPlayer is set to be a sprite and it loads the sequencedata(index+direction) + playersheet (the actual png's split)
myPlayer = display.newSprite(playerSheet, sequenceData )
playerHP = 10
--coordinates of myPlayer
myPlayer.x = display.contentCenterX
myPlayer.y = display.contentCenterY

--Makes sure the Velocity is 0 so player doesnt move when the game starts
CurrentVelocityX = 0
CurrentVelocityY = 0

--adds physics to character
physics.addBody( myPlayer, "dynamic", { density = 1 , friction = 0, bounce = 0  } )
myPlayer.isFixedRotation  = true
myPlayer.gravityScale     = 0
myPlayer.myName = "player"





          ----------WASD movement-------------
local function walkPerson(event)
  --move right with press
  if(grappleFinished == true ) then
    if (event.keyName == 'd' and event.phase == 'down' ) then
        CurrentVelocityX = CurrentVelocityX + myPlayerMovementSpeed
        myPlayer:setLinearVelocity( CurrentVelocityX, CurrentVelocityY)
        keydown = true
        playSFX(footStep1, 1)
      return true
    end
  --stop moving right with press
    if (event.keyName == 'd' and event.phase == 'up') then
        CurrentVelocityX = 0
        myPlayer:setLinearVelocity(CurrentVelocityX, CurrentVelocityY )
        keydown = false


      return true
    end

--move left with press
    if (event.keyName == 'a' and event.phase == 'down') then
        CurrentVelocityX = CurrentVelocityX - myPlayerMovementSpeed
        myPlayer:setLinearVelocity( CurrentVelocityX, CurrentVelocityY )
        keydown = true
        playSFX(footStep1, 1)
        return true

      end
--stop moving left with press
    if (event.keyName == 'a' and event.phase == 'up') then
        CurrentVelocityX = 0
        myPlayer:setLinearVelocity( CurrentVelocityX , CurrentVelocityY )
        keydown = false
        return true
      end

--move up with press
    if (event.keyName == 'w' and event.phase == 'down') then
        CurrentVelocityY = CurrentVelocityY - myPlayerMovementSpeed
        myPlayer:setLinearVelocity( CurrentVelocityX, CurrentVelocityY )
        keydown = true
        playSFX(footStep1, 1)
        return true
      end
--stop moving up
    if (event.keyName == 'w' and event.phase == 'up') then
        CurrentVelocityY = 0
        myPlayer:setLinearVelocity( CurrentVelocityX, CurrentVelocityY )
        keydown = false
        return true
      end

--move down with press
    if (event.keyName == 's' and event.phase == 'down') then
        CurrentVelocityY = CurrentVelocityY + myPlayerMovementSpeed
        myPlayer:setLinearVelocity( CurrentVelocityX, CurrentVelocityY )
        keydown = true
        playSFX(footStep2, 1)
        return true
      end
--stop moving down with press
    if (event.keyName == 's' and event.phase == 'up') then
        CurrentVelocityY = 0
        myPlayer:setLinearVelocity( CurrentVelocityX, CurrentVelocityY )
        keydown = false
        return true
      end
   end
end

Runtime:addEventListener("key", walkPerson)
