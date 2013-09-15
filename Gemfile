source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'pg'
gem 'puma'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks' # Read more: https://github.com/rails/turbolinks
gem "omniauth-github"
gem "bcrypt-ruby"
gem 'mandrill-api'

group :production do
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end


group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem "guard-rspec"
  gem "guard-zeus"
  gem "growl"
  gem "rb-inotify", require: false
  gem "rb-fsevent", require: false
  gem "rb-fchange", require: false
  gem "database_cleaner"
end