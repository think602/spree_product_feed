# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_feed'
  s.version     = '2.1.0'
  s.summary     = 'Spree extension that provides an RSS feed for products'
  s.description = 'A Spree extension that provides an RSS feed for products, with Google Shopper extensions'
  s.author      = 'Joshua Nussbaum'
  s.email       = 'joshnuss@gmail.com'

  s.required_ruby_version = '>= 1.9.3'
  
  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 2.1.0'

  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
