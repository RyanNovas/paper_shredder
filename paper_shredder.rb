# myapp.rb
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'

URL = "https://slack.com/api/im.history?token=#{key}&channel=".freeze
DELETE_URL = "https://slack.com/api/chat.delete?token=#{key}&ts=".freeze
get '/' do
end

post '/' do
    text = params.fetch('text').strip.split(' ')
    user_id = params.fetch('user_id')
    channel_id = params.fetch('channel_id')
    num_to_delete = text[1].to_i
    channel_name = params.fetch('channel_name')
    if text.first == 'last' && num_to_delete
        if channel_name == 'directmessage'
            user_history = HTTParty.get(URL + channel_id)
            messages = user_history['messages']
            user_messages = []
            count = 0
            messages.each do |message|
                if message["user"] == user_id
                  HTTParty.get(DELETE_URL + message["ts"] + '&channel=' + channel_id)
                  count += 1
                end
                break if count == num_to_delete
            end
        end

    end
    params.fetch('text').split(' ').to_s
end
