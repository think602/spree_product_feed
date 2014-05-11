require 'spec_helper'

describe Spree::FeedsController do
  describe "GET show.rss" do
    describe "google" do 
      before do 
        get :show, 
          use_route: 'spree', 
          platform: 'google',
          format: 'rss'
      end

      specify { response.should be_success }
      specify { response.content_type.should == 'application/rss+xml' }
    end
  end
end
