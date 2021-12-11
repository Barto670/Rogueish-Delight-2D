local function Animation ( event )


-- sets the the values once during the level and prevents animations bugging
local set = false
if (set == false) then
      local currentWalkDirection = 0
      local animationOn = 0
      set = true
end

--standing still animation
if(grappleFinished == true) then
  if(CurrentVelocityX == 0 and CurrentVelocityY == 0 ) then
    myPlayer:pause() -- pauses the animation
    myPlayer:setSequence( "walkUp" ) -- sets the sequence to walkUp because the myPlayer is looking up
    myPlayer:setFrame( 1 ) -- makes sure the frame is the idle position of the myPlayer
    currentWalkDirection = 0
    animationOn = 0
  end
  -- up animation
if((direction == 1 and animationOn == 0) or (currentWalkDirection ~= 1 and animationOn == 1 and direction == 1)) then
      myPlayer:pause()
      myPlayer:setSequence( "walkUp" ) -- sets the sequence to walkUp because the myPlayer is looking up before we start the animation
      myPlayer:setFrame(1)  -- makes sure the frames start from the start
      myPlayer:play()  -- plays the animation
      currentWalkDirection = 1
      animationOn = 1
  end

  --right animation
  if((direction == 2 and animationOn == 0) or (currentWalkDirection ~= 2 and animationOn == 1 and direction == 2)) then
        myPlayer:pause()
        myPlayer:setSequence( "walkRight" ) -- sets the sequence to walkUp because the myPlayer is looking up before we start the animation
        myPlayer:setFrame(1)  -- makes sure the frames start from the start
        myPlayer:play()  -- plays the animation
        currentWalkDirection = 2
        animationOn = 1
    end

  --down animation
  if((direction == 3 and animationOn == 0) or (currentWalkDirection ~= 3 and animationOn == 1 and direction == 3)) then
        myPlayer:pause()
        myPlayer:setSequence( "walkDown" ) -- sets the sequence to walkUp because the myPlayer is looking up before we start the animation
        myPlayer:setFrame(1)  -- makes sure the frames start from the start
        myPlayer:play()  -- plays the animation
        currentWalkDirection = 3
        animationOn = 1
    end

  --left animation
  if((direction == 4 and animationOn == 0) or (currentWalkDirection ~= 4 and animationOn == 1 and direction == 4)) then
        myPlayer:pause()
        myPlayer:setSequence( "walkLeft" ) -- sets the sequence to walkUp because the myPlayer is looking up before we start the animation
        myPlayer:setFrame(1)  -- makes sure the frames start from the start
        myPlayer:play()  -- plays the animation
        currentWalkDirection = 4
        animationOn = 1
    end
end
end
animationTimer = timer.performWithDelay(1, Animation , 0)
