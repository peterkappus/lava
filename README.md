
# Lava

A simple art-maker for exploring shapes, colors, and patterns and saving them to SVGs (and JPGs).

## Running Locally
0. Follow the installation instructions below...
1. Run `bundle exec shotgun app.rb`
2. Visit http://localhost:9393
3. Press "Enter" to save an SVG & JPG in the "works" folder

## Installation

Install rsvg-convert for converting SVG to JPGs. The easiest way to install on a Mac is with [Homebrew](http://brew.sh/):

```bash
brew install watch
#brew install coffee
brew install librsvg
brew install v8
gem install therubyracer
gem install libv8 -v '3.16.14.11' -- --with-system-v8
bundle install

```
NOTE: if you have issues with the above, you may have to `gem uninstall v8`


## Architecture
Uses a simple Sinatra app to save the SVG and convert to a JPG (using rsvg-convert). Uses coffee script and [SVG.js](http://www.svgjs.com) to render pretty things on the client side. All the coffee scripts get compiled and served via an asset pipeline.
The "Sol" class (named for Sol Lewitt) contains basic methods for drawing, and global vars for colours, etc. (to be continued).

### Making your own "art makers"
Each art maker is a coffeescript file in the `assets/makers` folder. Each one is a unique class.
Create a new coffeescript file in that folder, create a class, give it a constructor which uses the sol.canvas object to do some drawing...


```
class window.MyNewArtMaker
  constructor:() ->
    sol.background("#fff")

    sol.canvas.circle...whatever.
```

Now update the `main.coffee` file to call your constructor:

```
window.init = () ->
  new MyNewArtMaker()
```




## Thanks!
- [LibRSVG](https://wiki.gnome.org/Projects/LibRsvg)
- [jQuery](http://jquery.com)
- [SVG.js](https://github.com/wout/svg.js)
- [Sinatra](https://github.com/sinatra)
- [CoffeeScript](http://coffeescript.org/)
