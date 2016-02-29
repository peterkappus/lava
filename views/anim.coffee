foreground_color = "#fff"
show_color = false
background_color = "#111"

circle = (x,y,rad,stroke_width) ->
  d.circle(rad).cx(x).cy(y).fill({opacity: .6, color: background_color}).stroke({color: foreground_color, width: stroke_width})
  #d.circle(rad).cx(x).cy(y).fill({opacity: 1, color: background_color}).stroke({color: foreground_color, width: stroke_width})

#number of circles
margin = height/10

circ_count = 3
size = height*1.1
stroke = size/10
show_color = true
background()

time = 4000 * 100
hold_time = time/2
circs = []

make =() ->
  for circ in [1..circ_count]
    #array of circles
    #TODO: how about letters instead of circles?
    circs[circ] = circle(width/2,height/2,size,stroke)

destroy = () ->
  for circ in circs
    circs[circ].remove()
    circs = []

migrate = (time = time) ->
  for circ in [1..circ_count]
    target_x = rando((margin),width-margin)
    target_y = rando((margin),height-margin)
    if(show_color)
      target_color = randColor()
    else
      target_color = background_color
    circs[circ].animate(time).attr('cx',target_x).attr('cy',target_y).fill({opacity: .6, color: target_color})


#background("#333")
make()
migrate(time)
#now do it every X seconds
int = setInterval migrate, hold_time, time
