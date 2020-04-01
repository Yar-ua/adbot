require 'telegram/bot'
class WebhooksController < ActionController::API

  def telegram
    token = ENV['TELEGRAM_BOT_TOKEN']
    Telegram::Bot::Client.run(token) do |bot|
      
      message = params[:message]
      cid = params[:message][:from][:id]
      bot.api.send_message(chat_id: cid, text: "ping? pong! Here is your raw message...")
      bot.api.send_message(chat_id: cid, text: message)
    end
  end

end
