source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "jsbundling-rails"

# Use Sass to process CSS
# gem "sassc-rails"
gem "dartsass-rails", "~> 0.4.0"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry-byebug'
  gem "faker"
  gem "factory_bot_rails"
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-checkstyle_formatter"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
  
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem 'sorcery', "0.16.3"
gem 'rails-i18n', '~> 7.0.0'
gem 'draper', '4.0.2'
# carrierwave をインストールした際に追記（https://github.com/carrierwaveuploader/carrierwave）
gem 'carrierwave', '~> 3.0'

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  
end

# DeviseとWardenのインストールのため追記(202406081910)
gem 'devise'

# ブックマーク処理をturbo_streamを使って画面遷移をせずに行える用に追記(202406091300)
gem 'turbo-rails', "1.1.1"

# 掲示板のページネーション用に追記(202406111300)
gem 'kaminari', "1.2.2"

gem 'bootstrap5-kaminari-views'

# 掲示板の検索機能を実装用に追記(202406111800)
gem 'ransack', "3.2.1"