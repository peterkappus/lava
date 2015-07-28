# alert "okay"

#use the smaller of the two dimensions so the whole thing fits on the screen.
#but always square
if(window.innerHeight > window.innerWidth) #phonez
  width = height = window.innerWidth
else #desktop
  width = height = window.innerHeight

#use native dimensions
#width = window.innerWidth
#height = window.innerHeight

#create the SVG object to draw in
d = SVG("svg").size(width,height)

#width = window.innerWidth
background_color = foreground_color = ""
min_count = 3
max_count = 10
max_thickness = width/32

old_title = document.title

rando = (min,max) ->
  return Math.floor(Math.random() * (max - min) + min)

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

draw = () ->
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



  #clear the screen
  d.rect(width,height).fill(background_color)

  for num in [0..rando(min_count,max_count)]
    thickness = rando(1,max_thickness)
    #thickness = rando(1,3)
    maxcols = 2 * rando(2,6)
    foreground_color = randColor()
    vline((width * rando(1,maxcols)/maxcols)-(thickness/2),thickness)
    foreground_color = randColor()
    hline((height * rando(1,maxcols)/maxcols)-(thickness/2),thickness)


#do it!
draw()

#now do it every 5 seconds...
setInterval draw, 5000
