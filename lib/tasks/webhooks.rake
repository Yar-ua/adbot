namespace :webhooks do
  
  HOST = ENV["HOST"]
  TELEGRAM_BOT_TOKEN = ENV["TELEGRAM_BOT_TOKEN"]
  PORT = 443


  desc "set webhooks"
  task set: :environment do
    puts "Registring webhooks on host #{HOST}"

    # At first, trying to set webhooks without certificate and on port 80
    # keep in mind what by default webkooks submiitting on port 443

    ## It nesessary if you use self-signed sertificate
    # cert_fn = File.join(Rails.root, 'cert.pem')
    # unless File.exist? cert_in
    #   puts "Generating self-signed certificate #{cert_fn}"
    #   `openssl req -newkey rsa:2048 -sha256 -nodes -keyout key.pem -x509 -days 365 -out cert.pem -subj "/O=0rg/CN=#{HOST}"`
    # else
    #   puts "Found certificate #{cert_fn}"
    # end
    ##

    # url = "https://#{HOST}:#{PORT}/webhooks/telegram/#{TELEGRAM_BOT_TOKEN}"
    url = "https://#{HOST}/webhooks/telegram/#{TELEGRAM_BOT_TOKEN}"
    puts "=> url: #{url}"
    puts "=> telegram bot token: #{TELEGRAM_BOT_TOKEN}"
    puts `curl -F "url=#{url}" https://api.telegram.org/bot#{TELEGRAM_BOT_TOKEN}/setWebhook`

    ## It nesessary if you use self-signed sertificate
    # puts `curl -F “url=#{url}" -F "certificate=@#{cert_fn}" https://api.telegram.org/bot#{TELEGRAM_BOT_TOKEN}/setWebhook`
    ##

  end

  desc "check webhooks"
  task info: :environment do

    puts "Getting webhooks info"
    puts `curl  https://api.telegram.org/bot#{TELEGRAM_BOT_TOKEN}/getWebhookInfo`
  end

  desc "delete webhooks"
  task delete: :environment do
    puts "Deleting webhooks"
    puts `curl  https://api.telegram.org/bot#{TELEGRAM_BOT_TOKEN}/deleteWebhook`
  end

end
