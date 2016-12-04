#make the words "Peter San" fly across the screen to random locations

class window.FlyingPeterSan
  constructor: ->
    sol.background("#000")
    foreground_color = "#fff"
    window.text = d.text("Peter San")
    text.font({family: 'Source Sans Pro'
      ,size: 80
      , anchor: 'left'})
      .cx(width/2)
      .cy(height/2).fill({color: foreground_color})

    console.log text.lines()

  move = () ->
    text.animate(800).move(rando(0,width),rando(0,height))

  # do it!
  #move()
  #setInterval move, 3000
