

background("#993")

gap = width/10
color= "#800"

x = y = gap
brick_height = gap
brick_width = brick_height*2

while(y < height)
  if(x + brick_width > width-gap)
    brick_width = width-x-gap
  d.rect(brick_width,brick_height).fill(color).x(x).y(y)
  x += brick_width + gap
  brick_width = rando(gap,gap*10)
  if(x >= width)
    x = gap
    y += gap + brick_height
