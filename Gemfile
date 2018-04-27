source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/zstearman/prophet-data.git" }

ruby '2.4.0'

gem 'rails',          '~> 5.2.0'
gem 'pg',             '~>1.0.0'
gem 'puma',           '~> 3.11'
gem 'sass-rails',     '~> 5.0'
gem 'uglifier',       '~> 4.1'
gem 'coffee-rails',   '~> 4.2'
gem 'turbolinks',     '~> 5'
gem 'jbuilder',       '~> 2.7'
gem 'bcrypt',         '~> 3.1.7'
gem 'mini_magick',    '~> 4.8'
gem 'bootsnap',       '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails',  '~> 3.7'
  gem 'factory_girl', '~> 4.9.0'
end

group :development do
  gem 'web-console',            '>= 3.3.0'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring',                 '~> 2.0'
  gem 'spring-watcher-listen',  '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara',             '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'guard-rspec', '        ~> 4.7.3'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
