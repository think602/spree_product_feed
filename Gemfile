source 'http://rubygems.org'

spree_branch = '2-1-stable'

gem 'spree', 
  github: 'spree/spree', branch: spree_branch
  
unless ENV['TRAVIS']
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'libnotify'
  
  gem 'quiet_assets'
  gem 'sprockets', '2.11.0'
  
  gem 'debugger'
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-rescue'
  
  gem 'fuubar'
  
  gem 'spree_auth_devise', 
    github: 'spree/spree_auth_devise', branch: spree_branch
end

gemspec
