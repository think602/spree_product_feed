source 'http://rubygems.org'

gem 'spree', 
  :github => 'spree/spree', 
  :branch => '2-1-stable'

unless ENV['TRAVIS']
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'libnotify'
  gem 'bullet'
end

gem 'fuubar'
gem 'debugger'

gem 'pry-rails'
gem 'pry-debugger'
gem 'pry-rescue'

gemspec
