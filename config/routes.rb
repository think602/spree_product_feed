Rails.application.routes.draw do
  get 'feeds/:id', to: "spree/feeds#show", :defaults => { :format => 'xml' }
end
