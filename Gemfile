source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Encoding and decoding JWT tokens
# Once the user model is done, the implementation of the JWT token generation can start.
# First, the jwt gem will make encoding and decoding of HMACSHA256 tokens
# available in the Rails application.
# Read more at http://tutorials.pluralsight.com/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api#1ERPTkVS3yHey7s0.99
gem 'jwt'

# Authenticating users
# Instead of using private controller methods, simple_command can be used: simple_command .
# The simple command gem is an easy way of creating services. Its role is similar to
# the role of a helper, but instead of facilitating the connection between the
# controller and the view, it does the same for the controller and the model.
# In this way, we can shorten the code in the models and controllers.
gem 'simple_command'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
