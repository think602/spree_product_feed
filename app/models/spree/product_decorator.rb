Spree::Product.class_eval do 
  def brand_name
    brand_id = Spree::Taxonomy.find_by_name('Brand')
    brand = taxons.find_by_taxonomy_id(brand_id)
    brand.name
  end
  
  def brand
    brand_id = Spree::Taxonomy.find_by_name('Brand')
    taxons.find_by_taxonomy_id(brand_id)
  end
end
