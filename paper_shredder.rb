# myapp.rb
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "I am paper_shredder, and I keep conversations private. \n Type '/paper_shredder help' to learn more"
end


get 'help' do
  "Ongoing list of features..."
end

get '/last' do
  "Hello World"
end
