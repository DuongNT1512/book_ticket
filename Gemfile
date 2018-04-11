source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

gem "bootstrap-sass", "~> 3.3.7"
gem "config", "~> 1.7.0"
gem "faker", "~> 1.8.7"
gem "font-awesome-rails", "~> 4.7.0"
gem "jquery-rails", "~> 4.3.1"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :framgia do
  gem "autoprefixer-rails"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "database_cleaner"
  gem "factory_bot"
  gem "jshint"
  gem "railroady"
  gem "rails_best_practices"
  gem "reek"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
end
