#pass an approximate Y where you'd like the sun
sun = (y) ->
  #rad = rando(width/8,width/3)
  rad = rando(y/3,y*2) #make radius fit the distance from y to the top
  steps = rando(3,12)
  x = rando(rad+width/10,width-(rad+width/10))
  #y = height/2 + rando(-rad/2,rad/2)
  #y -= rad - rando(0,width/4)

  #keep it totally on the page
  y = rad + rando(0,y-rad)

  #coin flip
  if(Math.random() > 0.5)
    #concentric rings
    while(rad > 1)
      #d.circle(rad).cx(x).cy(y).fill({opacity: 0}).stroke({color: "#f30", width: rad/80})
      d.circle(rad).cx(x).cy(y).fill({opacity: 0}).stroke({color: "#f30", width: height/120})
      rad *= 0.97
  else
    #opaque disks
    while(rad > 1)
      d.circle(rad).cx(x).cy(y).fill({opacity: 1/steps, color: "#f30"})
      rad *= 1-(1/steps)


#pretty mountains
vert_mountains = () ->
  x = 0
  y = height
  dy_crazy = rando(0.25,1) #bigger is crazier
  stroke_width = Math.floor(width/rando(50,1200))
  if(stroke_width < 1)
    stroke_width = 1
  dx = stroke_width

  while y > height/4 && stroke_width > 0.005
    color = foreground_color
    while(x < width)
      y = y+rando(-width*dy_crazy/300,width*dy_crazy/300)

      #stay on canvas
      if (y > height)
        y = height
		  #if (y < 0) y = 0

      d.line(x,height,x,y).stroke({width: stroke_width, color: color, linecap: "round" })
      x += dx
    #reset x on the left side
    x = 0
    #move up...
    #y -= width/40+Math.random(width/30)
    y -= rando(height/20,height/5)

    #get skinnier
    stroke_width = stroke_width*0.85
  return(y)


#concentric circly cloud thing
cloud = (x,y,rad) ->
  stroke_width = height/400
  while(rad > 1)
    d.circle(rad).cx(x).cy(y).fill({opacity: 1, color: "#fff"}).stroke({color: "#000", width: stroke_width})
    rad -= stroke_width * 4


mountain_scene = () ->
  #do it!
  #drawLines()
  background()
  #for i in [1..10]
  #  cloud(Math.random()*width,Math.random()*height,width/(3+(Math.random()*20)))
  sun(vert_mountains()) #mountains passes the last Y coord into the sun so we can keep it above them
  #cloud(width*2/3,height/2,width/5)
  #cloud(width*5/8,height*5/8,width/7)

  #drawLines()
  #sun(height/3)



# DO IT!
#mountain_scene()



#now do it every 5 seconds...
#setInterval draw, 5000
