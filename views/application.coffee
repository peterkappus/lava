# alert "okay"
###
#use the smaller of the two dimensions so the whole thing fits on the screen. But always square
if(window.innerHeight > window.innerWidth) #phonez
  width = height = window.innerWidth
else #desktop
  width = height = window.innerHeight
###

#nah, use native dimensions for my pretty landscape
width = window.innerWidth;
height = window.innerHeight;


#use native dimensions
#width = window.innerWidth
#height = window.innerHeight

#create the SVG object to draw in
d = SVG("svg").size(width,height)

#width = window.innerWidth
background_color = "#eee"
foreground_color = ""
min_count = 3
max_count = 8
max_thickness = width/32

old_title = document.title

rando = (min,max) ->
  return Math.random() * (max - min) + min

save_svg = () ->
  #$.post('/save_svg',{data: $('#svg').html()})
  $.post('/save_svg',{data: $('#svg').html()}, () -> document.title = "Saved!")

vline = (x,w) ->
    d.rect(w,height).x(x).fill(foreground_color)

hline = (y,h) ->
    d.rect(width,h).y(y).fill(foreground_color)

#rand foreground?
randColor = () ->
  '#'+(0xFFFFFFFF-Math.random()*0xFFFFFFFF).toString(16).substr(0, 6)


#capture <ENTER> key presses
$('body').keypress (event) ->
    if(event.which == 13)
      save_svg()

#save on click
$('body').mousedown (event) ->
      save_svg()

#draw a random gridish thing
drawLines = () ->
  #switch our title back in case we saved the last one...
  document.title = old_title

  #randomly mix up foreground/background black on white or vice versa
  if(Math.random() > 0.5)
    background_color = "#000"
    foreground_color = "#fff"
  else
    background_color = "#fff"
    foreground_color = "#000"

  background_color = randColor();


  background()

  for num in [0..rando(min_count,max_count)]
    thickness = rando(1,max_thickness)
    #thickness = rando(1,3)
    maxcols = 2 * rando(2,8)
    #foreground_color = randColor()
    #make our lines fall somewhat on a grid
    vline((width * rando(1,maxcols)/maxcols)-(thickness/2),thickness)
    #foreground_color = randColor()
    hline((height * rando(1,maxcols)/maxcols)-(thickness/2),thickness)

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

background = () ->
  #clear the screen
  d.rect(width,height).fill(background_color)


mountains = () ->
  x = 0
  y = height
  dy_crazy = rando(0.25,3) #bigger is crazier
  stroke_width = Math.floor(width/rando(50,1200))
  if(stroke_width < 1)
    stroke_width = 1
  dx = stroke_width

  while y > height/4 && stroke_width > 0.005
    while(x < width)
      y = y+rando(-width*dy_crazy/300,width*dy_crazy/300)

      #stay on canvas
      if (y > height)
        y = height
		  #if (y < 0) y = 0

      d.line(x,height,x,y).stroke({width: stroke_width, color: "#000", linecap: "round" })
      x += dx
    #reset x on the left side
    x = 0
    #move up...
    #y -= width/40+Math.random(width/30)
    y -= rando(height/20,height/5)

    #get skinnier
    stroke_width = stroke_width*0.85
  return(y)



#do it!
#drawLines()
background()
sun(mountains()) #mountains passes the last Y coord into the sun so we can keep it above them


#drawLines()
#sun(height/3)

#now do it every 5 seconds...
#setInterval draw, 5000
