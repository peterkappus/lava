#draw a random gridish thing
drawLines = () ->
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


  background()

  for num in [0..rando(min_count,max_count)]
    thickness = rando(1,max_thickness)
    #thickness = rando(1,3)
    maxcols = 2 * rando(2,8)
    #foreground_color = randColor()
    #make our lines fall somewhat on a grid
    vline((width * rando(1,maxcols)/maxcols)-(thickness/2),thickness)
    #foreground_color = randColor()
    hline((height * rando(1,maxcols)/maxcols)-(thickness/2),thickness)
