

#tufte yellow
background("#333")
color= "#800"

gap = width/50
rows = 30

x = y = gap
brick_height = ((height-gap)/rows)-gap
brick_width_unit = gap*2
brick_width = Math.round(rando(1,2)) * brick_width_unit

make_bricks = () ->
  while(y < height-brick_height)

    #no funny skinny bricks on the right...
    if( width - gap - (x + brick_width) < gap*5)
      brick_width = width-gap-x

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


#do it!
#make_bricks()
