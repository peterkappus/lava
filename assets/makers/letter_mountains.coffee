#radial dots


font_face = "Times New Roman"

class window.LetterMountains
  constructor:() ->
    sol.background("#fff")
    @color = foreground_color
    letter("P");

  letter:(letter) ->
    sol.canvas
    .text(letter)
    .font({
      family: font_face
      , weight: 800
      ,size: rando(width/10,width*1.2)
      , anchor: 'left'})
    .cx(width/2)
    .cy(height/2)
    .fill({
      color: @color
    })
