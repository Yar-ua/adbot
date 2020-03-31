class ApplicationController < ActionController::Base

  require 'telegram/bot'

  token = ENV['TELEGRAM_BOT_TOKEN']
  url = ENV['HOST']

  Telegram::Bot::Client.run(token) do |bot|
  # Telegram::Bot::Client.run(token, url: url) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, 
                            text: "Rails bot calling: Hello, #{message.from.first_name}")
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, 
                            text: "Rails bot calling: Bye, #{message.from.first_name}")
      end
    end
  end


end
