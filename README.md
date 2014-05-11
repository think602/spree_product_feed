Spree Product Feed
================

[![Build Status](https://travis-ci.org/think602/spree_product_feed.svg?branch=master)](https://travis-ci.org/think602/spree_product_feed)

An extension that provides an RSS feed for products. Google Shopper attributes
are also implemented. An RSS link is automatically appended to the `<head>`
tag in the `layouts/spree_application` file.

Supported versions:  
- 2.1.x  
- 2.0.x  
- 1.3.x  


Installation
===============

1) add the gem to your `Gemfile`:

`gem 'spree_product_feed', github: 'think602/spree_product_feed', branch: 'master'`

2) run bundler:

`bundle install`

Viewing Product RSS
============

`http://example.com/feed/google.rss`

Testing
=======

Be sure to add the rspec-rails gem to your Gemfile and then create a dummy test app for the specs to run against.

    $ bundle exec rake test_app
    $ bundle exec rake spec

Copyright (c) 2011 Joshua Nussbaum, released under the New BSD License
