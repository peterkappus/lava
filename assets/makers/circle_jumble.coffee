
class window.CircleJumble
  constructor: ->
    #import sol values into this script
    height = sol.height
    width = sol.width
    d = sol.canvas
    rando = sol.rando
    #sol.background("#fff")
    foreground_color = sol.foreground_color

    for n in [1..50]
      rad = rando(width/50,width/20)

      # Even XY distribution across the page
      #x = rando(10,width)
      #y = rando(10,height)

      #clustered around the center
      x = width/2 + (rando(10,width/2*0.9)*Math.cos(rando(0,Math.PI*2)))
      y = height/2 + (rando(10,height/2*0.9)*Math.sin(rando(0,Math.PI*2)))

      #x = width/2
      #y = height/2
      stroke_width = rando(width/200,width/10)

      #gray
      #shade = Math.round(rando(1,255))
      #color = new SVG.Color({r: shade,  g: shade, b: shade})

      #rand color
      color = sol.randColor()

      d.circle(rad).cx(x).cy(y).fill({opacity: 0}).stroke({color: color, width: stroke_width})
