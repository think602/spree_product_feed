xml.instruct! :xml, version: "1.0" 
xml.rss(version: "2.0", "xmlns:g" => "http://base.google.com/ns/1.0"){
  xml.channel{
    xml.title("#{Spree::Config[:site_name]}")
    xml.link("http://#{Spree::Config[:site_url]}")
    xml.description("Find out about new products on http://#{Spree::Config[:site_url]} first!")
    xml.language('en-us')
    @products.each do |product|
      xml.item do
        xml.title(product.name)
        xml.brand(product.brand_name)
        xml.description(simple_format(product.description))
        xml.author(Spree::Config[:site_url])
        xml.pubDate((product.available_on || product.created_at).strftime("%a, %d %b %Y %H:%M:%S %z"))
        xml.link(product_url(product))
        xml.guid(product.id.to_s)
        xml.mpu(product.sku.to_s)
        
        xml.tag!('g:price', product.price.to_s)
        xml.tag!('g:condition', 'new')
        xml.tag!('g:id', product.id.to_s)
        
        product.shipping_category.shipping_methods.each do |shipping_method|
          shipping_method.zones.each do |zone|
            zone.zone_members.each do |zone_member|
              unless zone_member.zoneable.nil?
                xml.tag!('g:shipping') do 
                  xml.tag!('g:country', zone_member.zoneable.iso)
                  
                  package = Spree::Stock::Package.new(nil, nil)
                  package.add(product.master, 1)
                  
                  # we need to calculate the shipping_cost in relation to the zone_member
                  price = shipping_method.calculator.compute(package).to_s # '5.0'
                  
                  xml.tag!('g:price', "#{price} USD") 
                end
              end
            end
          end
        end
        
        case product.images.count
        when 1
          xml.tag!('g:image_link', full_url(product.images.first.attachment.url(:large)))
        when 2
          xml.tag!('g:image_link', full_url(product.images.first.attachment.url(:large)))
          xml.tag!('g:additional_image_link', full_url(product.images.second.attachment.url(:large)))
        end
        
      end
    end
  }
}
