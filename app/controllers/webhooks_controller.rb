# require 'telegram/bot'
# class WebhooksController < ActionController::API

#   token = ENV['TELEGRAM_BOT_TOKEN']
#   def telegram
#     Telegram::Bot::Client.run(token) do |bot|
      
#       first_name = params[:message][:from][:first_name]
#       cid = params[:message][:from][:id]
#       text = params[:message][:text]
      
#       bot.api.send_message(chat_id: cid, text: "Привіт, #{first_name}")
#       bot.api.send_message(chat_id: cid, text: "Ти написав\n#{text}")
#     end
#   end

# end
