
class window.Weave
  constructor: ->
    #use existing window.sol object
    width = sol.width
    height = sol.height
    rando = sol.rando

    #sol.foreground_color = "#000"

    lines = 250
    for n in [1..lines]
      #sol.foreground_color = "#FFF"
      #if Math.random() > 0.5
      #  sol.foreground_color = "#000"

      sol.foreground_color = sol.randColor()
      #sol.hline(rando(0,height),rando(1,20))
      if Math.random() > 0.5
        #sol.hline((height/lines)*n,sol.rando(1,1.5))
        sol.hline(sol.rando(1,height),sol.rando(1,5))
      else
        sol.vline(sol.rando(1,width),sol.rando(1,5))

#do it
#weave()
