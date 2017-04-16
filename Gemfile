source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
#Adding bcryt to encrypt stored passwords -  ActiveModel has_secure_password
gem 'bcrypt', '3.1.11'
#To produce mock or fake data
gem 'faker', '1.6.6'
#breaks up the lists of doctors, patients and clinics into pages
gem 'will_paginate',           '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'
#Creates simple form used to create new patients
gem 'simple_form', '~> 3.4'
# Adding bootstrap files (sass)
gem 'bootstrap-sass', '3.3.6'
# This gem is used for displaying image
# gem 'paperclip', '~> 5.1'
# Use Puma as the app server- this is needed to sqlite3 on heroku
gem 'puma', '~> 3.0'
#Drpaer is used to create a decorator controller for the decorator design pattern
gem 'draper', '3.0.0.pre1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
#pre installed gems
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'


group :development, :test do
  gem 'sqlite3', '1.3.12'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '9.0.0', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.18.4'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
