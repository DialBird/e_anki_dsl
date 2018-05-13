# frozen_string_literal: true

ruby '2.5.1'
source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord'
gem 'pg'
gem 'rake'

group :development, :test do
  gem 'rspec'
  gem 'factory_bot'
  gem 'pry-byebug'
end

group :test do
  gem 'database_cleaner'
end
