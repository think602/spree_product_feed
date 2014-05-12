module Spree
  module FeedsHelper
    def full_url(path)
      URI.join(request.url, path)
    end
  end
end
