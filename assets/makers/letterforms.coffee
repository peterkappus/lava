
#"global" vars accessible to both clases below
letters = []
font_face = ""
background_color = ""
font_size = anim_time = steps = 0

class window.LetterForms
  #NOTE: I can't just use the built in animation methods because of some dumb bug with SVG Text which makes the letters jump vertically everytime they start moving....
  #So I'm reverting to a DIY approach...

  constructor: ->
    #make this blank if you want random letters...
    letter_string = ""
    #letter_string = "PETER SAN LOUIE KAPPUS"

    #randomly downcase
    if Math.random() > 0.5
      letter_string = letter_string.toLowerCase()

    #jumble letters

    #"A"
    first_letter_code = 65;

    #initialise here in the constructor
    font_size = width
    anim_time = 2500
    steps = 1000 #steps to move from A to B

    foreground_color = randColor()
    background_color = randColor()

    if letter_string == ""
      how_many = rando(3,15)
      for i in [0..how_many]
        letter_string += String.fromCharCode(Math.round((Math.random()*26))+first_letter_code);

    font_face = "Times New Roman"
    if Math.random() > 0.5
      font_face = "Helvetica"

    #window.letters = []

    sol.background(background_color)
    foreground_color = foreground_color

    for letter in letter_string.split('')
      letters.push(new LetterForm(letter))

    setInterval move, 20

  move =() ->
      for letter in letters
        letter.step()

class window.LetterForm
  constructor: (letter) ->
    #instance var to hold our SVG element
    @color = foreground_color
    #make half of them black.
    @color = background_color if Math.random() < 0.5

    @glyph = sol.canvas
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
    @target_x = @glyph.cx()
    @target_y = @glyph.cy()

    #allow our SVG to refer back to its parent letterForm object
    @glyph.parent = this

  step: ->
    #console.log "ok
    if(Math.abs(@glyph.cx()-@target_x) < 5 && Math.abs(@glyph.cy()-@target_y) < 5)
      @target_x = rando(0,width)
      @target_y = rando(0,height)
      @dx = (@target_x - @glyph.cx())/steps
      @dy = (@target_y - @glyph.cy())/steps
    #now move it...
    @glyph.cx(@glyph.cx() + @dx)
    @glyph.cy(@glyph.cy() + @dy)
    #This should work but doesn't with text... Jumps vertically for some reason.
    # TODO: File a bug report w/ SVGJS
    #@glyph.animate(anim_time).move(rando(0,width),rando(0,height))
    #.after ->
    #  this.parent.go()
