xml.instrucst! :xml, version: "1.0" 
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
        xml.guid(product.id)
        
        xml.tag!('g:price', product.price)
        xml.tag!('g:condition', 'new')
        xml.tag!('g:id', product.id)
        
        case product.images.count
        when 1
          xml.tag!('g:image_link', full_url(product.images.first.attachment.url(:large)) )
        when 2
          xml.tag!('g:image_link', full_url(product.images.first.attachment.url(:large)) )
          xml.tag!('g:additional_image_link', full_url(product.images.second.attachment.url(:large)) )
        end
        
      end
    end
  }
}
