Rails.application.routes.draw do
  get '/google', to: 'spree/feeds#google', defaults: { format: 'rss' }
end
