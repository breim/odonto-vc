# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Jquery
gem 'jquery-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Handle env passwords
gem 'figaro'
# Auth
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
# Minify controllers
gem 'responders'
# Simple form
gem 'simple_form'
# Serializer API
gem 'active_model_serializers'
# Decorators
gem 'draper'
# multi-search in database
gem 'pg_search'
# Paperclip
gem 'paperclip', '5.2.0'
# BRL Money
gem 'brdinheiro'
# Pagination
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap4'
# Fix URI depreciation
gem 'addressable'
# Payment method
gem 'pagarme'
# Graphs
gem 'chartkick'
gem 'groupdate'
# Cron Jobs
gem 'whenever', require: false
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'coveralls', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'jasmine-rails'
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
end

group :development do
  # Security test
  gem 'brakeman'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
