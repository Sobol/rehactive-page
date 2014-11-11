source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.2'
gem 'gmaps4rails', '~> 1.4.8'
gem 'pg'
gem 'will_paginate'
gem 'rack-rewrite'
gem 'devise'

gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'protected_attributes'
gem 'nokogiri'
gem 'ckeditor'
gem 'paperclip'
gem 'aws-sdk'
gem 'protected_attributes'
gem "non-stupid-digest-assets"

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem "livereload", require: false
  gem "better_errors"
  gem 'foreman', require: false
end

group :test, :development do
  gem "rspec-rails"
  gem "spork"
  gem "capybara"
  gem "capybara-firebug"
  gem 'selenium-webdriver'
  gem "poltergeist"
  gem "database_cleaner"
  gem "fabrication"
  gem "faker"
  gem "sinatra", require: false
  gem "pry"
end

group :development, :staging do
  gem 'letter_opener'
end

group :production, :staging do
  gem 'rails_12factor'
end

