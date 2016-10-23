
class window.Sol
  constructor: ->
    @width = window.innerWidth
    @height = window.innerHeight
    #@canvas_id = canvas_id
    @canvas = SVG("svg").size(@width,@height)
    @foreground_color = "#000"
    @background_color = "#fff"

  rando: (min,max) ->
    return(Math.random() * (max - min) + min)


  vline: (x,thickness) ->
      @canvas.rect(thickness,@height).x(x).fill(@foreground_color)

  hline: (y,thickness) ->
      @canvas.rect(@width,thickness).y(y).fill(@foreground_color)

  #rand foreground?
  randColor: ->
    '#'+(0xFFFFFF-Math.random()*0xFFFFFF).toString(16).substr(0, 6)

  background: (color=@background_color) ->
    #clear the screen
    @canvas.rect(@width,@height).fill(color)

window.save_svg = () ->
  #alert "Saving..."
  console.log "Saving..."
  #$.post('/save_svg',{data: $('#svg').html()})
  $.post('/save_svg',{data: $('#svg').html()}, () -> document.title = "Saved!")

#capture <ENTER> key presses
$('body').keypress (event) ->
  if(event.which == 13)
    window.save_svg()

#save on click
#$('body').mousedown (event) ->
#  window.save_svg()
