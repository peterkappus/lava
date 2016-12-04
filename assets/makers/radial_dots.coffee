#radial dots

class window.RadialDots
  constructor:() ->
    sol.background("#fff")

    orig_x = x = sol.width/2
    orig_y = y = sol.height/2
    distance = deg =0
    radius = sol.width/200
    how_many_this_level = 0
    y = orig_y

    inner_color = sol.randColor()
    outer_color = sol.randColor()

    margin = sol.width/50
    while (orig_x - distance - radius*2 > margin)
      #color = new SVG.Color(inner_color).morph(outer_color).at(distance / (orig_x - margin))
      color = sol.randColor()
      radius += sol.width/1200
      distance += radius*1.3
      deg = 0
      how_many_this_level += 5

      while(deg < 2*Math.PI)
        #color = sol.randColor()
        x = orig_x + Math.sin(deg)*distance
        y = orig_y + Math.cos(deg)*distance

        sol.canvas.circle(radius).x(x-radius/2).y(y-radius/2).fill({color:color})
        deg += (2*Math.PI)/how_many_this_level

###
      x = orig_x + Math.sin(deg)*distance
      y = orig_y + Math.cos(deg)*distance

      sol.canvas.circle(radius).x(x).y(y).fill({color:color})

      #one revolution == 2*PI
      deg += (2*Math.PI)/40
      radius *= 1.00004
      distance *= 1.001
###
