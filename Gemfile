source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#bootstrap base
gem 'twitter-bootstrap-rails'
gem "jquery-turbolinks"

#authentication
gem "devise"

#for seeds
gem "faker"

#for admin page
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'cancan'

#templates
gem 'bootstrap-social-rails'
gem 'font-awesome-rails'

#for SNS authentication
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

#image uploader
gem 'carrierwave'
gem 'rmagick'

#pusher
gem 'pusher'

#一応config
gem 'config'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  # to know if the app sent the mail
  # gem 'letter_opener'
  
  #for testing
  gem "rspec-rails"
  gem "factory_girl_rails"

  #for debug
  gem "better_errors"
  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer' # スタックをたどれる
  
  gem 'dotenv-rails' #環境変数を入れてくれる
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
end

group :production do
    gem 'rails_12factor'
end
