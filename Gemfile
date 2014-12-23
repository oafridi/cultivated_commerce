source 'https://rubygems.org'

gem 'rails', '4.1.8'

# database - postgres
gem 'pg'

# Assets and frontend stuff
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'simple_form'
gem 'haml'

# Misc
gem 'sdoc', '~> 0.4.0',          group: :doc

# Auth
gem 'devise'

# Google maps
gem 'geocoder'
gem 'gmaps4rails'

group :test, :development do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem "spring"
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers', require: false
  gem 'simplecov'
end

group :development do  
  gem 'pry'
  gem "spring-commands-rspec"
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem "rack-livereload"
  # gem 'better_errors'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
