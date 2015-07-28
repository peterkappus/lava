
## What is this?

A simple app for exploring shapes, colors, and patterns and saving them to SVGs (and JPGs)

## Requirements/Installation

Install rsvg-convert for converting SVG to JPGs. The easiest way to install on a Mac is with [Homebrew](http://brew.sh/):

```bash
$ brew install rsvg-convert
```

Install the gems:
```bash
$ bundle install
```

Start the app:
```bash
$ shotgun app.rb
```

No idea how to run this on a server... anybody want to help?

## Development
Edit the application.coffee (in the Views folder) it will automagically get compiled and served.
To enable live reload, just uncomment the "live.js" include in the index.slim page.

## Thanks!
- [LibRSVG](https://wiki.gnome.org/Projects/LibRsvg)
- [jQuery](http://jquery.com)
- [SVG.js](https://github.com/wout/svg.js)
- [Sinatra](https://github.com/sinatra)
- [CoffeeScript](http://coffeescript.org/)
