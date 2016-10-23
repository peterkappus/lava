foreground_color = "#fff"
show_color = false
background_color = "#fc0"

sol = new window.Sol()
rando = sol.rando
randColor = sol.randColor
width = sol.width
height = sol.height
d = sol.canvas


circle = (x,y,rad,stroke_width) ->
  d.circle(rad).cx(x).cy(y).fill({opacity: .6, color: background_color}).stroke({color: foreground_color, width: stroke_width})
  #d.circle(rad).cx(x).cy(y).fill({opacity: 1, color: background_color}).stroke({color: foreground_color, width: stroke_width})

#number of circles
margin = height/10

circ_count = 100
size = height*0.025
stroke = size/20
show_color = true
sol.background("#000")

time = 10 * 100
rows = cols = 10

hold_time = time*3.75
circs = []

make =() ->
  for circ in [1..circ_count]
    #array of circles
    #TODO: how about letters instead of circles?
    circs[circ] = circle(width/2,height/2,size,stroke)

randOrange =()->
    shade = (Math.random() * 0xFF).toString(16)
    return '#' + (shade + shade + shade).toString(16).substr(0, 6);

destroy = () ->
  for circ in circs
    circs[circ].remove()
    circs = []

migrate = (time = time) ->
  for circ in [1..circ_count]
    #target_x = rando((margin),width-margin)
    #target_y = rando((margin),height-margin)

    target_x = (Math.round(rando(0,cols)) * (width-(margin*3))/cols) + margin
    #console.log(target_x)
    target_y = (Math.round(rando(0,rows)) * (height-(margin*3))/rows) + margin
    if(show_color)
      target_color = sol.randColor()
      #target_color = "#ee0"
    else
      target_color = background_color
    circs[circ].animate(time).attr('cx',target_x).attr('cy',target_y).fill({opacity: .6, color: target_color})


#background("#333")
make()
migrate(time)
#now do it every X seconds
#TODO: Fix hold_time... not working right now
int = setInterval migrate, hold_time, time
