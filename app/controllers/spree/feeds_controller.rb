module Spree
  class FeedsController < Spree::StoreController
    respond_to :rss

    def show
      params.merge!(per_page: 10000)
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products
      options = %w(google).include?(params[:platform]) ? {template: "spree/feeds/#{params[:platform]}", status: 200, layout: false} : {nothing: true, status: 404}

      respond_to do |format|
        format.rss { render(options)}
      end
    end
    
  end
end
