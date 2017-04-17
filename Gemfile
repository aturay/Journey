source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'redis', '~> 3.0'
gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'

gem 'therubyracer'
gem 'devise'
gem 'omniauth'
gem 'omniauth-oauth2', '~> 1.4'
gem 'omniauth-vkontakte'

gem "paperclip", "~> 5.0.0"

group :development, :test do
  gem 'byebug', platform: :mri
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'mysql2', '>= 0.3.18', '< 0.5'

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails_12factor', group: :production

ruby "2.3.1"