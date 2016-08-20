# myapp.rb
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'pry'

URL = "https://slack.com/api/im.history?token=xoxp-2608360951-2609609888-71342382098-2d4999fc54&channel="
DELETE_URL = "https://slack.com/api/chat.delete?token=xoxp-2608360951-2609609888-71342382098-2d4999fc54&ts="
get '/' do
end

post '/' do
    # text = params.fetch('text').strip
    # user_id = params.fetch('user_id')
    # channel_id =  params.fetch('channel_id')
    # channel_name = params.fetch('channel_name')
    #
    # if text && text.split('').first == 'last'
    #   if channel_name == 'directmessage'
    #     user_history = HTTParty.get(URL + channel_id)
    #
    #   end
    # end

    # TODO: REMOVE THESE
    user_id = 'U02HXHXS4'
    channel_id = 'D1KFNCLRK'

    user_history = HTTParty.get(URL + channel_id)
    messages = user_history["messages"]
    user_messages = []
    count = 0
    messages.each do |message|
      break if count == 5
      if message["user"] == user_id
        HTTParty.get(DELETE_URL + message["ts"] + '&channel=' + channel_id)
        count ++
      end
    end
    puts 'received'




    # case text
    # when 'params'
    #     params.to_s
    # when 'help'
    #     'soon there will be help'
    # end

    # "params  #{params['splat'].to_s} request body #{request.body.read} self #{self} env #{@env}"

    # puts "#{params.to_s} are the params and the body is #{request.body.read}"
    # "I am paper_shredder, and I keep conversations private. \n Type '/paper_shredder help' to learn more"
end

get 'help' do
    'Ongoing list of features...'
end

get '/last' do
    'Hello World'
end
