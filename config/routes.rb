Rails.application.routes.draw do
  get 'feeds/:platform', to: 'spree/feeds#show', defaults: { format: 'xml' }
end
