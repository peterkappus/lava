#alert "okay"
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
background_color = "#fffff3"
foreground_color = "#000"
min_count = 3
max_count = 8
max_thickness = width/32

old_title = document.title

rando = (min,max) ->
  return Math.random() * (max - min) + min

background = (color=background_color) ->
  #clear the screen
  d.rect(width,height).fill(color)

save_svg = () ->
  #$.post('/save_svg',{data: $('#svg').html()})
  $.post('/save_svg',{data: $('#svg').html()}, () -> document.title = "Saved!")

vline = (x,w) ->
    d.rect(w,height).x(x).fill(foreground_color)

hline = (y,h) ->
    d.rect(width,h).y(y).fill(foreground_color)

#rand foreground?
randColor = () ->
  '#'+(0xFFFFFF-Math.random()*0xFFFFFF).toString(16).substr(0, 6)


#capture <ENTER> key presses
$('body').keypress (event) ->
    if(event.which == 13)
      save_svg()

#save on click
$('body').mousedown (event) ->
      save_svg()
