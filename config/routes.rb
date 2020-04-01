Rails.application.routes.draw do
  post '/webhooks/telegram/:token', to: "webhooks#telegram"
  get '/webhooks/telegram/:token', to: "webhooks#telegram"
end
