# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rails', '~> 7.0.0'
gem 'mysql2'
gem 'puma', '~> 6.0'
gem 'sassc-rails', '~> 2.0'
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'
gem 'mini_racer'
gem 'kaminari'

gem 'omniauth', '~> 1.3'
gem 'omniauth-google-oauth2'

gem 'http_accept_language', '~> 2.1'

gem 'httparty'

gem 'jquery-rails'

# Application monitoring
gem 'sentry-raven'

group :development, :test do
  gem 'rubocop', require: false
end

group :development do
  gem 'rspec-rails', '~> 3.5', require: false
  gem 'listen', '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
