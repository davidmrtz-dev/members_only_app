source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4'

gem 'bcrypt', '~> 3.1.11'
gem 'carrierwave',  '1.2.2'
gem 'mini_magick',  '4.7.0'
gem 'faker', '>= 1.7.3'
gem 'will_paginate'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '>=3.3.7'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'execjs'
gem 'mini_racer'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'guard', '~> 2.16', '>= 2.16.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg', '0.20.0'
  gem 'fog', '1.42'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
