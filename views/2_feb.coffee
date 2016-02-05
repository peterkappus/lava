#orbitron, light.

x = width/2
y = height/2
stroke_width = 10
offset = stroke_width

background("#110")

concentric = (x,y,rad) ->
  while(rad > 10 )
    d.circle(rad).cx(x).cy(y).fill({opacity: 0}).stroke({color: randColor(), width: stroke_width})
    rad -= stroke_width*3
    #stroke_width *= 0.95
    #rad -= stroke_width

# DO IT!
#concentric x-offset,y,width*0.9
#concentric x+offset,y,width*0.9
