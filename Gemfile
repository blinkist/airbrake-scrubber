# frozen_string_literal: true

ruby "2.6.5"

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/blinkist/#{repo}.git" }

group :test do
  gem "dotenv"
  gem "forgery"
  gem "rack"
  gem "rake"
  gem "rspec"
  gem "rspec_junit_formatter"
  gem "simplecov"
end

group :development, :test do
  gem 'awesome_print'
  gem "byebug"
  gem 'memory_profiler'
  gem "ruby-prof"
end

# Specify your gem"s dependencies in blinkist-core.gemspec
gemspec
