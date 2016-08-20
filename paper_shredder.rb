# myapp.rb
require 'sinatra'

get '/' do
  "You'll need to start the url with '/last' if you want me to do anything."
end

get '/last' do
  "Hello World"
end
