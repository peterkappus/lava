

make_specks = () ->
  orig_x = width/2
  orig_y = height/2
  deg = 0
  distance = 8
  radius = 10
  background("#eee")

  while (x < width-radius)
    x = orig_x + Math.sin(deg)*distance
    y = orig_y + Math.cos(deg)*distance

    d.circle(radius).x(x).y(y).fill({color:'#000'})

    deg += Math.PI/16
    radius *= 1.04
    distance *= 1.09
    #deg *= 1.02
    #radius *= 1.003
    #dist *= 1.01
    #console.log(dist)

#do it!
#make_specks()
