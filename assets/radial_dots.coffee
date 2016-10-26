#radial dots

radial_dots = () ->
  orig_x = sol.width/2
  orig_y = sol.height/2
  x = y = deg = 0
  radius = sol.width/80
  distance = radius

  while (x < sol.width-radius)
    color = sol.randColor()
    x = orig_x + Math.sin(deg)*distance
    y = orig_y + Math.cos(deg)*distance

    sol.canvas.circle(radius).x(x).y(y).fill({color:color})

    #one revolution == 2*PI
    deg += (2*Math.PI)/40
    radius *= 1.00004
    distance *= 1.001

#do it!
#radial_dots()
