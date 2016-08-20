# myapp.rb
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'

URL = 'https://slack.com/api/im.history?token=xoxp-2608360951-2609609888-71342382098-2d4999fc54&channel='.freeze
DELETE_URL = 'https://slack.com/api/chat.delete?token=xoxp-2608360951-2609609888-71342382098-2d4999fc54&ts='.freeze
get '/' do
end

post '/' do
  str = 'hi'
    text = params.fetch('text').strip
    user_id = params.fetch('user_id')
    channel_id = params.fetch('channel_id')
    channel_name = params.fetch('channel_name')
    if text == 'last'
      str += ' line 19'
        if channel_name == 'directmessage'
          str += ' line 20'
            user_history = HTTParty.get(URL + channel_id)
            messages = user_history['messages']
            user_messages = []
            count = 0
            messages.each do |message|
                str += 'line 27'
                if message["user"] == user_id
                  str += 'line 29'
                  HTTParty.get(DELETE_URL + message["ts"] + '&channel=' + channel_id)
                end
                break if count == 5
            end
        end

    end
    # if text && text.split('').first == 'last'
    #   if channel_name == 'directmessage'
    #     user_history = HTTParty.get(URL + channel_id)
    #     messages = user_history["messages"]
    #     user_messages = []
    #     count = 0
    #     messages.each do |message|
    #       break if count == 5
    #       if message["user"] == user_id
    #         HTTParty.get(DELETE_URL + message["ts"] + '&channel=' + channel_id)
    #         count ++
    #       end
    #     end
    #   end
    str
end

# TODO: REMOVE THESE
# user_id = 'U02HXHXS4'
# channel_id = 'D1KFNCLRK'
#
# user_history = HTTParty.get(URL + channel_id)
# messages = user_history["messages"]
# user_messages = []
# count = 0
# messages.each do |message|
#   break if count == 5
#   if message["user"] == user_id
#     HTTParty.get(DELETE_URL + message["ts"] + '&channel=' + channel_id)
#     count ++
#   end
# end

# get 'help' do
#     'Ongoing list of features...'
# end
#
# get '/last' do
#     'Hello World'
# end
