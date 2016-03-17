source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


# API Development
gem 'grape'
gem 'grape-swagger'
gem 'rack-cors', require: 'rack/cors' #For CORS request
gem 'grape-entity' # API Object representation
gem 'redcarpet'
gem 'rouge'
gem 'hashie-forbidden_attributes'
# gem 'grape-kaminari' - In case I need API pagination
# gem 'doorkeeper' - In case I need to implement Oauth2 for the API
# gem 'wine_bouncer' - In case I need scope validation with Oauth2 for the API



group :development, :test do
  # Fake data for tests and playground
  gem 'fabrication'
  gem 'faker'

  # Debug
  gem 'byebug'
  gem 'pry'
  gem 'pry-rails'
  gem 'awesome_print'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rubocop', require: false
  gem 'guard-rspec'
end


group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 2.8.0'
  gem 'simplecov', require: false
  gem 'database_cleaner'
  gem 'spring-commands-rspec'
  # gem 'timecop' #In case I need to freeze dates later.

  # Allow me tu use all the cores of my processor for parallel test
  gem 'parallel_tests'
end
