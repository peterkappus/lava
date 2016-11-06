
#the main program... use this to instantiate any classes that you want...



window.init = () ->
  #new CircleJumble()
  # NOT WORKING :(
  # TODO: resize svg when the window resizes
  # Have to make a new SOL object to initialise the SVG canvas...
  #not working... can't find "sol" :(
  #window.sol = new Sol()

  #new Weave()
  new LetterForms()
  #new Mountains()

init()
