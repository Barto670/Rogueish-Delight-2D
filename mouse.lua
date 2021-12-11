--variables DONT CHANGE THESE
MouseX = myPlayer.x
MouseY = myPlayer.y
direction = 1
local squareSize = 20

--making the camera cube in between the player and the mouse + settings giving it X and Y value at the start
camera        = display.newRect(5, 5 , squareSize, squareSize)
camera.alpha  = 0
camera.x      = myPlayer.x
camera.y      = myPlayer.y

--grapple location
grapplepos        = display.newImageRect("graphics/crosshair/crosshairstyle4.png",30,30)   -- change value of the image from 1-5 to change crosshair
grapplepos.alpha  = 1
grapplepos.x      = myPlayer.x
grapplepos.y      = myPlayer.y

--enemyCount initialised
enemyCount = 0
enemyCountDisplay = display.newText(enemyCount , 40 , 40, native.systemFont, 30)
enemyCountTextDisplay = display.newText("Enemies Left: " , 40 , 40, native.systemFont, 30)
-- splits the screen into the shape X so we know on which quadrant the cursor is at the moment
local function onMouseEvent( event )
    --sets current cursors x and y values
    MouseX = event.x
    MouseY = event.y

    --top triangle
    if(event.x > event.y and ((event.x+event.y)<=1200  and event.y < 640)) then
      direction = 1

      --right trangle
  elseif(event.x > event.y and ((event.x+event.y)>=1200 and event.x > 640)) then
      direction = 2

      --bottom triangle
  elseif(event.x < event.y and ((event.x+event.y)>=1200 and event.y> 640)) then
      direction = 3

      --left triangle
  elseif(event.x < event.y and ((event.x+event.y)<=1200 and event.x < 640)) then
      direction = 4
  end

  return direction
end

--display level number
roomNumber = "Tutorial Room"
displayRoom = display.newText( roomNumber, 0, 0, native.systemFont, 40 )





--display inventory / make body static
local sheetOptions1 = {
    width               = 198,
    height              = 96,
    numFrames           = 8,
    sheetContentWidth   = 1584,
    sheetContentHeight  = 96,
}
local inventorySheet = graphics.newImageSheet( "graphics/UI/uiWeaponsItems.png", sheetOptions1 )
local sequenceData = {
    {name = "idle",   frames = { 1},     time = 0, loopCount = 0},
    {name = "UI",     frames = { 2,3,4,5,6,7,8},     time = 3700, loopCount = 0},
}
inventory = display.newSprite(inventorySheet, sequenceData )
inventory.alpha  = 1
inventory:setSequence( "idle" )
inventory:setFrame( 1 )




--weapons on the UI
local sheetOptions2 = {
    width               = 64,
    height              = 64,
    numFrames           = 2,
    sheetContentWidth   = 64,
    sheetContentHeight  = 128,
}
local weaponSheet = graphics.newImageSheet( "graphics/items/weapons.png", sheetOptions2 )
local sequenceData = {
      name = "UI",
      frames = { 1, 2},
      time = 0,
      loopCount = 0
}
weapon = display.newSprite(weaponSheet, sequenceData )
weapon.alpha  = 1
weapon:setFrame( 1 )






--display health / make body static
local sheetOptions3 = {
    width               = 480,
    height              = 48,
    numFrames           = 11,
    sheetContentWidth   = 480,
    sheetContentHeight  = 528,
}
local healthSheet = graphics.newImageSheet( "graphics/UI/myPlayerHealth.png", sheetOptions3 )
local sequenceData2 = {
      name = "UI",
      frames = { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1},
      time = 0,
      loopCount = 0
}
health = display.newSprite(healthSheet, sequenceData2 )
health:setFrame( 1 )
health.alpha  = 1




--updates the UI with a timer
local function CameraTimedReset ( event )
  camera.x = ((myPlayer.x)+ (MouseX/3)) - 215 --camera x value
  camera.y = ((myPlayer.y)+ (MouseY/3)) - 230 --camera y value
  grapplepos.x = ((myPlayer.x) + (MouseX + MouseX/3) - 855 ) -- cursor positon from the myPlayer
  grapplepos.y = ((myPlayer.y) + (MouseY + MouseY/3 ) - 870) -- cursor positon from the myPlayer
  inventory.x = camera.x - 520  -- inventory on bottom
  inventory.y = camera.y  + 350 -- inventory on bottom
  displayRoom.x = camera.x       -- displays room number
  displayRoom.y = camera.y - 350 -- displays room number
  weapon.x = camera.x - 570    --inventory on bottom
  weapon.y = camera.y  + 350      --inventory on bottom
  health.x = camera.x  - 360  --inventory on bottom
  health.y = camera.y  - 500      --inventory on bottom
  enemyCountDisplay.x = camera.x + 500
  enemyCountDisplay.y = camera.y - 500
  enemyCountTextDisplay.x = camera.x + 370
  enemyCountTextDisplay.y = camera.y - 500
  health:setFrame( playerHP +1 )
  grapplepos:toFront() --so the crosshair is always ontop of the screen
  --player alpha goes back to 1 after it lowers
  if(myPlayer.alpha ~= 1)then
    myPlayer.alpha = myPlayer.alpha + 0.02
  else
    myPlayer:setFillColor( 255)
  end
  --room display dissapears after it shows when you enter a new room
  if(displayRoom.alpha>0)then
    displayRoom.alpha  = displayRoom.alpha - 0.01
  end
end


 cameraReset = timer.performWithDelay(1, CameraTimedReset , 0)
Runtime:addEventListener( "mouse"  , onMouseEvent  )
