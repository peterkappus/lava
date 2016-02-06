

#tufte yellow
background("#333")
color= "#800"

gap = width/200
rows = 12

x = y = gap
brick_height = ((height-gap)/rows)-gap
brick_width_unit = gap*10
brick_width = Math.round(rando(1,5)) * brick_width_unit

while(y < height-brick_height)
  #right hand margin
  if(x + brick_width > width-gap)
    brick_width = width-x-gap

  #draw
  d.rect().width(brick_width).height(brick_height).fill(randColor()).x(x).y(y)

  #advance...
  x += brick_width + gap
  #randomize brick width
  brick_width = Math.round(rando(1,8)) * brick_width_unit

  #wrap
  if(x >= width)
    x = gap
    y += gap + brick_height
