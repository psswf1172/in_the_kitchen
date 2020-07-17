source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3.2'

gem 'aws-sdk'
gem 'aws-sdk-rails'
gem 'aws-sdk-s3'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.3.1'
gem 'cocoon', '~> 1.2', '>= 1.2.11'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dotenv-rails'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
# gem 'faraday_middleware'
gem 'faraday_middleware-aws-sigv4'
gem 'gemoji-parser'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mini_magick', '~>4.8.0'

gem 'oj' #speed up JSON generation and parsing
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2' # git: 'https://github.com/zquestz/omniauth-google-oauth2.git'
gem 'openssl'
# Use postgreSQL as the database for Active Record
gem 'pg', '~> 0.21.0'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'searchkick'
gem 'sidekiq'
# Use Uglifier as compressor for JavaScript assets
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'wysiwyg-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'simplecov'
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'ffaker'
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.7'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
