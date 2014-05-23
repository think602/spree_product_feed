Spree::Core::Engine.routes.draw do
  get '/google', to: 'feeds#google', defaults: { format: 'rss' }
end
