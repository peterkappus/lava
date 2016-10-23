
## What is this?

A simple app for exploring shapes, colors, and patterns and saving them to SVGs (and JPGs)

## Architecture
Uses a simple Sinatra app to save the SVG and convert to a JPG (using rsvg-convert). Uses coffee script and SVG.js to render pretty things on the client side. All the coffee scripts get compiled and served via an asset pipeline.
The "Sol" class (named for Sol Lewitt) contains basic methods for drawing, and global vars for colors, etc. (to be continued).


## Requirements/Installation

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

Start the app:
```bash
$ bundle exec shotgun app.rb
```
No idea how to run this on a server... anybody want to help?

## Thanks!
- [LibRSVG](https://wiki.gnome.org/Projects/LibRsvg)
- [jQuery](http://jquery.com)
- [SVG.js](https://github.com/wout/svg.js)
- [Sinatra](https://github.com/sinatra)
- [CoffeeScript](http://coffeescript.org/)
