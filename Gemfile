source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
gem 'pg'            , group: :production
gem 'rails_12factor', group: :production


gem 'puma', '~> 3.0'

gem 'coffee-rails', '~> 4.2'
gem 'sass-rails', '~> 5.0'
gem 'haml-rails'

gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0.5'

gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'

gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'mysql2', '>= 0.3.18', '< 0.5'

  gem 'web-console', '>= 3.3.0'

  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

ruby "2.3.1"