# myapp.rb
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'

URL = "https://slack.com/api/im.history?token=#{ENV['SLACK_API_KEY']}&channel=".freeze
DELETE_URL = "https://slack.com/api/chat.delete?token=#{ENV['SLACK_API_KEY']}&ts=".freeze

def delete_last_number(num_to_delete, params)
    user_id = params.fetch('user_id')
    channel_id = params.fetch('channel_id')
    channel_name = params.fetch('channel_name')
    user_history = HTTParty.get(URL + channel_id)
    messages = user_history['messages']
    user_messages = []
    count = 0
    messages.each do |message|
        if message['user'] == user_id
            HTTParty.get(DELETE_URL + message['ts'] + '&channel=' + channel_id)
            count += 1
        end
        break if count == num_to_delete
    end
end


post '/' do
    text = params.fetch('text').strip.split(' ')
    num_to_delete = text[1].to_i

    if text.first == 'help'
        message = "You can: \n
                   - bulk delete direct messages by typing '/paper_shredder last (#of messages to delete)' \n
                   - view the source code at https://github.com/RyanNovas/paper_shredder \n
                   - learn more about the creator at www.ryannovas.com
                  "
    elsif 'directmessage' != params.fetch('channel_name')
        message = 'You can only your own delete direct messages. Type /paper_shredder help to learn more.'
    elsif text.first == 'last' && num_to_delete
        delete_last_number(num_to_delete, params)
        message = "What last #{num_to_delete} messages?"
    else
        message = 'That is an invalid command. Type /paper_shredder help to learn more.'
    end
    message
end

get '/*' do
  send_file 'index.html'
end
