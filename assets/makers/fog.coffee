
class window.Fog
  constructor: () ->
    sol.background("#fff")
    init_x = init_y = y = x = 0
    cell_size = 30
    #shade = sol.rando(220,255)
    shade = 255
    color = new SVG.Color("#FFFFFF").morph("#000")
    while (y < sol.height)
      while(x < sol.width)
        #color = new SVG.Color({ r: shade, g: shade, b: shade })
        #sol.canvas.rect(cell_size, cell_size).cx(x).cy(y).fill(color)
        font_size = cell_size #* sol.rando(0.2,3)
        sol.canvas
        .text("O")
        .font({
          family: "Helvetica"
          , weight: 800
          ,size: font_size
          , anchor: 'left'})
        .cx(x)
        .cy(y)
        .fill({
          color: color
        })
        #color = new SVG.Color("#fff").morph("#000").at(y/sol.height)
        color = new SVG.Color(randColor())#.morph("#000").at(y/sol.height)
        #shade = Math.round(sol.rando_within(shade, -(5+(y*0.005)), 5, 0, 255))
        #console.log(shade)
        x += cell_size #* sol.rando(0.8,1.2) #cell_size
      x = init_x
      y += cell_size #* sol.rando(0.8,1.2) #cell_size
