module Spree
  class FeedsController < Spree::StoreController
    respond_to :rss

    def google
      @products = Spree::Product.includes(:master).references('spree_products')
      
      respond_to do |format|
        format.rss  { render template: 'spree/feeds/google', status: 200, layout: false }
      end
    end
    
  end
end
