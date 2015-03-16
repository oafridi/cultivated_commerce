source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.8'

# database - postgres
gem 'pg', '~> 0.17.1'

# Assets and frontend stuff
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '3.1.2'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'simple_form', '~> 3.1.0'
gem 'haml', '~> 4.0.5'

# Misc
gem 'sdoc', '~> 0.4.0',          group: :doc

# Auth
gem 'devise', '~> 3.4.1'

# Google maps
gem 'geocoder', '~> 1.2.6'
gem 'gmaps4rails', '~> 2.1.2'

group :test, :development do
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker', '~> 1.4.3'
  gem 'pry-rails', '~> 0.3.2'
  gem 'rspec-rails', '~> 3.1.0'
  gem "spring"
end

group :test do
  gem 'capybara', '~> 2.4.4'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'launchy', '~> 2.4.3'
  gem 'selenium-webdriver', '~> 2.45.0'
  gem 'rspec-collection_matchers', '~> 1.1.2'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', '~> 0.9.1'
end

group :development do  
  gem 'pry', '~> 0.10.1'
  gem "spring-commands-rspec"
  gem 'guard', '~> 2.8.2'
  gem 'guard-rspec', '~> 4.3.1'
  gem 'guard-livereload', '~> 2.4.0'
  gem "rack-livereload", '~> 0.3.15'
  gem 'better_errors', '~> 2.1.0'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
