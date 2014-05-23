module Spree
  class FeedsController < Spree::StoreController
    respond_to :rss

    def google
      @products = Spree::Product.unscoped.
        where('spree_products.deleted_at IS NULL').
        includes(:master).references('spree_products').
        includes(shipping_category: [shipping_methods: [:zones]]).references('spree_shipping_cateogry')
      
      respond_to do |format|
        format.rss  { render template: 'spree/feeds/google', status: 200, layout: false }
      end
    end
    
  end
end
