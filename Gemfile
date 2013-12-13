source 'http://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.13'
gem 'jquery-rails', "3.0.4"
gem 'devise', "3.0.0"
gem 'simple_form', "2.1.0"
gem "paperclip", "3.4.2"
gem 'aws-sdk', "1.13.0"
gem 'will_paginate', '~> 3.0'
gem 'bootstrap-will_paginate'
gem 'omniauth', "1.1.4"
gem 'omniauth-facebook', "1.4.1"
gem 'make_voteable'
gem 'rack-google-analytics'

group :production do
	gem 'pg'
end

group :development, :test do
	gem 'sqlite3'
	gem 'letter_opener', github: 'ryanb/letter_opener'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.3.1.3'
end
