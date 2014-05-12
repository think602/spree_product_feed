module Spree
  class FeedsController < Spree::StoreController
    respond_to :rss

    def show
      @products = Spree::Product.unscoped.active.
        includes(taxons: [:taxonomy]).where('spree_taxonomies.name = ?', 'Brand').references('spree_taxonomies')
      
      options = %w(google).include?(params[:platform]) ? {template: "spree/feeds/#{params[:platform]}", status: 200, layout: false} : {nothing: true, status: 404}

      respond_to do |format|
        format.rss { render(options)}
      end
    end
    
  end
end
