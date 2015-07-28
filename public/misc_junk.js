//REFACTOR THIS INTO SOME TIDY COFFEE SCRIPT :)

// First lets create our drawing surface out of existing SVG element
// If you want to create new surface just provide dimensions
// like s = Snap(800, 600);

//var draw = SVG('drawing').size(300, 300)
//var rect = draw.rect(100, 100).attr({ fill: '#f06' })


var d = SVG("svg").size(window.innerWidth, window.innerHeight);
height = window.innerHeight;
width = window.innerWidth;

var base_rad = width/40; //base unit
var margin = base_rad/2;
var cx = width/2;
var cy = height/2;

light = "#E8E1CC"
medium = "#BEB294"
darker ="#442A00"
dark = "#330"
background = dark

function wavy_grid(){
  y = margin+base_rad;
  percent_of_box = 0.9;
    while(y < height-margin-base_rad){
      x = margin;
      while(x < width-margin-base_rad) {
        rad = new SVG.Number(base_rad).morph(base_rad/10).at(Math.random());
        x += rad;
        if(x+rad < width-margin){
          bullseye(rad*2,x,y,true);
        }
        x += rad;
      }
      //next row
      y += base_rad*2;
    }
}


//make a randomish bullseye with max radius of "radius" and center x,y
//pass "true" to  "make_rings" to make rings. Otherwise, get discs
function bullseye(radius,x,y,make_rings){
  inner_rad = radius*1.5;
  while(inner_rad > radius/5){ //5 rings max
    //inside_color = new SVG.Color(light).morph(medium).at(x/width).toHex();
    inside_color = new SVG.Color(light).morph(medium).at(Math.random()).toHex();
    /*if(Math.random() > 0.9) {
      inside_color = new SVG.Color(medium).morph(dark).at(Math.random()).toHex();
    }*/
    if(make_rings){
      d.circle(inner_rad).cx(x).cy(y).fill('none').stroke({ color: inside_color, opacity: 1, width: inner_rad/15 });
    }else{
      //circle...
      d.circle(inner_rad).cx(x).cy(y).fill(inside_color);
      //square!
      //d.rect(inner_rad,inner_rad).cx(x).cy(y).fill(inside_color);
    }

    //reduce size
    inner_rad *= 1-(Math.random()*4/5);
    //inner_rad /= 10;
  }
}

function debug(msg){
  console.log(msg);
}

function swirly(howMany){
  for(i =0; i < howMany; i++) {
    rad = width/30*(i*howMany);
    //rad = new SVG.Number(rad).morph(rad*2).at(Math.random());
    distance = i*0.9;
    y = cy + (distance * Math.sin(i*1.2));
    x = cx + (distance * Math.cos(i*1.2));
    d.circle(rad).cx(x).cy(y).fill("#442A00").opacity(0.8).stroke({ color: '#BEB294', opacity: 1, width: width/500 });
    d.circle(rad/2).cx(x).cy(y).fill("#E8E1CC").opacity(0.8);
    d.circle(rad/4).cx(x).cy(y).fill("#004E53").opacity(0.8);
  }
}


//make a ring of circles.
//howMany (how many steps to dividie our ring into)
//start with small numbers
function circ_ring(cx,cy,howMany,distance,rad,color){
  for(i = 0; i < howMany; i++){
    radians = (2*Math.PI*i/howMany);
    y = cy + (distance * Math.sin(radians));
    x = cx + (distance * Math.cos(radians));
    d.circle(rad).cx(x).cy(y).fill(color);
    if(rad > 20){
      //circ_ring(cx,cy,howMany*0.8,distance/5,rad/5,color);
    }
  }
}


//time our drawing
//start the clock...
start= Date.now();
console.log("starting at:" + start)
//now draw
draw();
//how long did we take?
end = Date.now();
console.log("time taken:" + parseInt(end-start));

function grid(){
  percent_of_box = 0.8;
    var cols = 30;
    margin = window.innerWidth/20;
    box_width = (window.innerWidth-(margin*2))/cols;
    rows = Math.floor(cols * window.innerHeight/window.innerWidth);
    //alert(rows);
    for (row = 0; row < rows; row++){
      x = margin
      y = (box_width * row) + margin + (box_width/2)
      for (col = 0; col < cols; col++){
        x = (box_width * col) + margin + (box_width/2)
        this_rad = box_width/2 * (percent_of_box-(Math.random()*0));
        double_circ(this_rad,x,y);
      }
      console.log(row)
    }
}

function double_circ(rad,x,y){
  d.circle(rad*2).cx(x).cy(y).fill("#000");
  //pick a random color between yellow and red
  inside_color = new SVG.Color('#0a9').morph('#F00').at(Math.random()).toHex();
  //now draw the center inside circle
  d.circle(rad/(1+Math.random()*0.1)).cx(x).cy(y).fill(inside_color);
}

function to_rads(degs){
  return degs * (180 / Math.PI);
}

//save SVG when we press enter...
$('body').keypress(function(event){
  //alert(event.which);
    //enter key pressed?
    if(event.which == 13) {
      //save SVG
      $.post('/save_svg',{data: $('#svg').html()}, function(){
        alert('saved!');
      });
    }
});


function draw(){
  //d.clear();
  d.rect(width,height).fill(background);
  //d.rect(width-margin*2,height-margin*2).x(margin).y(margin).fill(background);
  //swirly(5);
  //function circ_ring(cx,cy,howMany,distance,rad,color){

  /*layers = 10;
  angles = 20;
  for(var i = 1; i <= layers; i++){
      circ_ring(width/2,height/2,angles,height/2-(i*30), width/(20*i),new SVG.Color("#009").morph("#900").at(i/layers).toHex());
  }*/
  grid();
  //bullseye(500,width/2,height/2,true);
  //wavy_grid();
}
