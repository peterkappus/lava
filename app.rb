#require 'rubygems'
require 'sinatra'
require 'slim'
require 'coffee-script'
require 'v8'
#require 'tilt' (for other templating engines)

#set our views path
set :views, File.dirname(__FILE__) + '/views'

#make pretty HTML if you like (for debugging, maybe)
#set :slim, :pretty => true

#root url
get '/' do
  slim :index
end

#render our application.js file from our CoffeeScript
get '/application.js' do
  content_type "text/javascript"
  coffee :application
end

#nice wrapper to allow functions to respond to get or post
def self.get_or_post(url,&block)
  get(url,&block)
  post(url,&block)
end

get_or_post '/save_svg' do
  #use a timestamp as the title
	file_name = Time.now.to_i

	FOLDER = "works" #okay to change this

  #need to add this header....
  #<?xml version="1.0" encoding="UTF-8" standalone="no" ?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
  #<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="582.3000000000001" height="582.3000000000001" style="background-color: #fff" xml:space="preserve">
	IO.write("#{FOLDER}/#{file_name}.svg",params['data'])
	#NOTE! you may have to customize the bin path on your server...
	#Unfortunately I can't do
		#rsvg = system('which rsvg-convert')
		#{}`#{rsvg} blah blah`
	#not sure why
  #set width (-w) to 10,000px for printable image :)
	`rsvg-convert #{FOLDER}/#{file_name}.svg -w 1200 -o #{FOLDER}/#{file_name}.jpg`
end
