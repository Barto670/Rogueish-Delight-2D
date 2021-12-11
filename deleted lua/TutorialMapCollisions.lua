topRectKitchen = display.newRect(3725 ,475, 3045, 150)
topRectKitchen:setFillColor(1, 1, 0, 1)
physics.addBody( topRectKitchen, "static" , {bounce = 0 })
topRectKitchen.myName = "wall"
wallsHitbox:insert(topRectKitchen)



bottomRectKitchen = display.newRect(3090 ,1355, 1500, 150)
bottomRectKitchen:setFillColor(1, 0, 0, z)
physics.addBody( bottomRectKitchen, "static" , {bounce = 0 })
bottomRectKitchen.myName = "wall"
wallsHitbox:insert(bottomRectKitchen)

bottomRectKitchen2 = display.newRect(4912 ,1355, 1500, 150)
bottomRectKitchen2:setFillColor(1, 0, 0, z)
physics.addBody( bottomRectKitchen2, "static" , {bounce = 0 })
bottomRectKitchen2.myName = "wall"
wallsHitbox:insert(bottomRectKitchen2)

sideRectKitchen = display.newRect(4555 ,1100, 150, 1500)
sideRectKitchen:setFillColor(1, 0, 0, z)
physics.addBody( sideRectKitchen, "static" , {bounce = 0 })
sideRectKitchen.myName = "wall"
wallsHitbox:insert(sideRectKitchen)

sideRectKitchen2 = display.newRect(2490 ,1100, 150, 1500)
sideRectKitchen2:setFillColor(1, 0, 0, z)
physics.addBody( sideRectKitchen2, "static" , {bounce = 0 })
sideRectKitchen2.myName = "wall"
wallsHitbox:insert(sideRectKitchen2)

sideRectKitchen3 = display.newRect(2630 ,1110, 150, 500)
sideRectKitchen3:setFillColor(1, 0, 0, z)
physics.addBody( sideRectKitchen3, "static" , {bounce = 0 })
sideRectKitchen3.myName = "wall"
wallsHitbox:insert(sideRectKitchen3)

sideRectKitchen4 = display.newRect(2750 ,1250, 500, 150)
sideRectKitchen4:setFillColor(1, 0, 0, z)
physics.addBody( sideRectKitchen4, "static" , {bounce = 0 })
sideRectKitchen4.myName = "wall"
wallsHitbox:insert(sideRectKitchen4)

sideRectKitchen5 = display.newRect(4600 ,1200, 500, 150)
sideRectKitchen5:setFillColor(1, 0, 0, z)
physics.addBody( sideRectKitchen5, "static" , {bounce = 0 })
sideRectKitchen5.myName = "wall"
wallsHitbox:insert(sideRectKitchen5)

diningRoomTopRect = display.newRect(2315, 1845, 3045, 150)
diningRoomTopRect:setFillColor(1, 1, 0, z)
physics.addBody( diningRoomTopRect, "static" , {bounce = 0 })
diningRoomTopRect.myName = "wall"
wallsHitbox:insert(diningRoomTopRect)

diningRoomTopRect2 = display.newRect(4655, 1845, 1000, 150)
diningRoomTopRect2:setFillColor(1, 1, 0, z)
physics.addBody( diningRoomTopRect2, "static" , {bounce = 0 })
diningRoomTopRect2.myName = "wall"
wallsHitbox:insert(diningRoomTopRect2)

diningRoomTopRect3 = display.newRect(3760, 1600, 150, 400)
diningRoomTopRect3:setFillColor(1, 1, 0, z)
physics.addBody( diningRoomTopRect3, "static" , {bounce = 0 })
diningRoomTopRect3.myName = "wall"
wallsHitbox:insert(diningRoomTopRect3)

diningRoomTopRect4 = display.newRect(4230, 1600, 150, 400)
diningRoomTopRect4:setFillColor(1, 1, 0, z)
physics.addBody( diningRoomTopRect4, "static" , {bounce = 0 })
diningRoomTopRect4.myName = "wall"
wallsHitbox:insert(diningRoomTopRect4)

diningRoomTable = display.newRect(3200, 2550, 2900, 600)
diningRoomTable:setFillColor(1, 1, 0, z)
physics.addBody( diningRoomTable, "static" , {bounce = 0 })
diningRoomTable.myName = "wall"
wallsHitbox:insert(diningRoomTable)

entraceCorridorTop = display.newRect(700, 2325, 1200, 150)
entraceCorridorTop:setFillColor(0, 0, 1, z)
physics.addBody(entraceCorridorTop, "static" , {bounce = 0 })
entraceCorridorTop.myName = "wall"
wallsHitbox:insert(entraceCorridorTop)

entraceCorridorbottom = display.newRect(700, 2795, 1200, 150)
entraceCorridorbottom:setFillColor(0, 0, 1, z)
physics.addBody(entraceCorridorbottom, "static" , {bounce = 0 })
entraceCorridorbottom.myName = "wall"
wallsHitbox:insert(entraceCorridorbottom)

entraceCorridorbottom = display.newRect(85, 2795, 150, 1200)
entraceCorridorbottom:setFillColor(0, 0, 1, z)
physics.addBody(entraceCorridorbottom, "static" , {bounce = 0 })
entraceCorridorbottom.myName = "wall"
wallsHitbox:insert(entraceCorridorbottom)

diningroomWallRect= display.newRect(1360, 2100, 150, 600)
diningroomWallRect:setFillColor(0, 1, 1, z)
physics.addBody(diningroomWallRect, "static" , {bounce = 0 })
diningroomWallRect.myName = "wall"
wallsHitbox:insert(diningroomWallRect)

diningroomWallRect2= display.newRect(1360, 3020, 150, 600)
diningroomWallRect2:setFillColor(0, 1, 1, z)
physics.addBody(diningroomWallRect2, "static" , {bounce = 0 })
diningroomWallRect2.myName = "wall"
wallsHitbox:insert(diningroomWallRect2)

diningroomWallRect3= display.newRect(3000, 3430, 4000, 150)
diningroomWallRect3:setFillColor(0, 1, 1, z)
physics.addBody(diningroomWallRect3, "static" , {bounce = 0 })
diningroomWallRect3.myName = "wall"
wallsHitbox:insert(diningroomWallRect3)

diningroomWallRect4= display.newRect(5035, 2260, 150, 600)
diningroomWallRect4:setFillColor(0, 1, 1, z)
physics.addBody(diningroomWallRect4, "static" , {bounce = 0 })
diningroomWallRect4.myName = "wall"
wallsHitbox:insert(diningroomWallRect4)

diningroomWallRect5= display.newRect(5035, 3180, 150, 600)
diningroomWallRect5:setFillColor(0, 1, 1, z)
physics.addBody(diningroomWallRect5, "static" , {bounce = 0 })
diningroomWallRect4.myName = "wall"
wallsHitbox:insert(diningroomWallRect5)

corridorOut= display.newRect(5900, 2485, 1610, 150)
corridorOut:setFillColor(1, 0, 1, z)
physics.addBody(corridorOut, "static" , {bounce = 0 })
corridorOut.myName = "wall"
wallsHitbox:insert(corridorOut)

corridorOut2= display.newRect(5900, 2955, 1610, 150)
corridorOut2:setFillColor(1, 0, 1, z)
physics.addBody(corridorOut2, "static" , {bounce = 0 })
corridorOut2.myName = "wall"
wallsHitbox:insert(corridorOut2)

outsideWalls= display.newRect(6650, 3380, 150, 900)
outsideWalls:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls, "static" , {bounce = 0 })
outsideWalls.myName = "wall"
wallsHitbox:insert(outsideWalls)

outsideWalls2= display.newRect(6650, 2080, 150, 900)
outsideWalls2:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls2, "static" , {bounce = 0 })
outsideWalls2.myName = "wall"
wallsHitbox:insert(outsideWalls2)

outsideWalls3= display.newRect(7900, 3750, 3000, 150)
outsideWalls3:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls3, "static" , {bounce = 0 })
outsideWalls3.myName = "wall"
wallsHitbox:insert(outsideWalls3)

outsideWalls4= display.newRect(7900, 1700, 3000, 150)
outsideWalls4:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls4, "static" , {bounce = 0 })
outsideWalls4.myName = "wall"
wallsHitbox:insert(outsideWalls4)

outsideWalls5= display.newRect(9030, 2000, 150, 900)
outsideWalls5:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls5, "static" , {bounce = 0 })
outsideWalls5.myName = "wall"
wallsHitbox:insert(outsideWalls5)

outsideWalls6= display.newRect(9030, 3320, 150, 900)
outsideWalls6:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls6, "static" , {bounce = 0 })
outsideWalls6.myName = "wall"
wallsHitbox:insert(outsideWalls6)

outsideWalls7= display.newRect(9830, 2400, 1500, 150)
outsideWalls7:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls7, "static" , {bounce = 0 })
outsideWalls7.myName = "wall"
wallsHitbox:insert(outsideWalls7)

outsideWalls8= display.newRect(10000, 2950, 2000, 150)
outsideWalls8:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls8, "static" , {bounce = 0 })
outsideWalls8.myName = "wall"
wallsHitbox:insert(outsideWalls8)

outsideWalls9= display.newRect(10650, 1880, 150, 1200)
outsideWalls9:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls9, "static" , {bounce = 0 })
outsideWalls9.myName = "wall"
wallsHitbox:insert(outsideWalls9)

outsideWalls10= display.newRect(11110, 2000, 150, 1800)
outsideWalls10:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls10, "static" , {bounce = 0 })
outsideWalls10.myName = "wall"
wallsHitbox:insert(outsideWalls10)

outsideWalls11= display.newRect(11000, 1300, 500, 150)
outsideWalls11:setFillColor(1, 0, 1, z)
physics.addBody(outsideWalls11, "static" , {bounce = 0 })
outsideWalls11.myName = "wall"
wallsHitbox:insert(outsideWalls11)
