Spree::Core::Engine.routes.draw do
  get 'feeds/google', to: 'feeds#google', defaults: { format: 'rss' }
end
