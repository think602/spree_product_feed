xml.instruct! :xml, :version=>"1.0"
xml.rss(:version=>"2.0", "xmlns:g" => "http://base.google.com/ns/1.0"){
  xml.channel{
    xml.title("#{Spree::Config[:site_name]}")
    xml.link("http://#{Spree::Config[:site_url]}")
    xml.description("Find out about new products first! You'll always be in the know when new products become available")
    xml.language('en-us')
    @products.each do |product|
      xml.item do
        xml.title product.name
        xml.description simple_format(product.description)
        xml.author Spree::Config[:site_url]
        xml.pubDate (product.available_on || product.created_at).strftime("%a, %d %b %Y %H:%M:%S %z")
        affiliate_id = {vibrator: 1, condooms: 2, dildo: 4, glij: 5, sm:6}
        xml.link "#{product_url(product)}?aid=#{affiliate_id[current_store.code.to_sym]}"

        image = product.andand.images.andand.first || product.andand.variants.andand.collect(&:images).flatten.first
        xml.g :image_link, "#{request.protocol}#{request.host_with_port}#{image.attachment.url(:large)}" if image.present?

        xml.g :price, "#{product.price} EUR"
        xml.g :gtin, product.ean_code unless product.ean_code.blank?
        xml.g :brand, product.property('brand')
        xml.g :quantity, 10
        xml.g :availability, 'in stock'
        xml.g :online_only, 'y'
        xml.g :google_product_category, "Gezondheid en persoonlijke verzorging &gt; Gezondheidszorg &gt; Voorbehoedsmiddelen &gt; Condooms"
        xml.g :condition, 'retail'
        xml.g :id, product.id
        xml.g :shipping do
          xml.g :country, 'NL'
          xml.g :services, 'Standard'
          xml.g :price, '0.00'
        end
      end
    end
  }
}
