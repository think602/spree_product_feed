Spree::Product.class_eval do 
  
  # really defensive code because of unknown spree inventory data 
  def brand_name
    brand_id = Spree::Taxonomy.find_by_name('Brand')
    return "" if brand_id.nil?
    
    brand = taxons.find_by_taxonomy_id(brand_id)
    return "" if brand.nil?
    
    brand.name
  end
  
  # def brand
  #   brand_id = Spree::Taxonomy.find_by_name('Brand')
  #   taxons.find_by_taxonomy_id(brand_id)
  # end
end
