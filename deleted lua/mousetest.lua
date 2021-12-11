--if you wanna see the mouse X and Y coordinates turn this on
count = 0

mouseX = display.newText( count , display.contentCenterX, 60, native.systemFont, 40 )
mouseX:setFillColor( 0, 0, 0 )

mouseY = display.newText( count , display.contentCenterX, 120, native.systemFont, 40 )
mouseY:setFillColor( 0, 0, 0 )

local function onMouseEvent( event )
    mouseX.text = event.x
    mouseY.text = event.y
end

Runtime:addEventListener( "mouse", onMouseEvent )
