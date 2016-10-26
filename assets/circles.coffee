
#a jumble/jungle of random circles

#singleton sol is set in window object by sol class file

#import sol values into this script
height = sol.height
width = sol.width
d = sol.canvas
rando = sol.rando
foreground_color = sol.foreground_color


circ_jumble = () ->
  for n in [1..50]
    rad = rando(width/50,width/20)
    x = rando(10,width)
    y = rando(10,height)
    #x = width/2
    #y = height/2
    stroke_width = rando(width/80,width/10)

    #gray
    #shade = Math.round(rando(1,255))
    #color = new SVG.Color({r: shade,  g: shade, b: shade})

    #rand color
    color = sol.randColor()

    d.circle(rad).cx(x).cy(y).fill({opacity: 0}).stroke({color: color, width: stroke_width})


#do it!
#circ_jumble()
