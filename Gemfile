source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'draper', github: 'drapergem/draper'
gem 'mini_magick', '~> 4.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'

group :test do
  gem 'rspec-activemodel-mocks'
  gem 'rspec-its'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'nyan-cat-formatter'end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
end

