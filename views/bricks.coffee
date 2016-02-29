
#bricks which start at a "horizon" and gradually come closer.

#tufte yellow
color= "#800"

gap = width/500
#rows = 30

x = y = gap
#brick_height = ((height-gap)/rows)-gap
brick_height = 0.03
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
      brick_height *= 1.15 #bigger bricks in each row
      brick_width_unit *= 1.01


#do it!
#background("#333")
#make_bricks()
