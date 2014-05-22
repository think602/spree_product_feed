require 'spec_helper'

describe Spree::FeedsController do
  describe "GET /google.rss" do
    it "google" do 
      get :google, use_route: 'spree', format: 'rss'
      response.should be_success
      response.content_type.should == 'application/rss+xml'
    end
  end
end
