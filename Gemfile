source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass'
gem 'rails_bootstrap_navbar'

gem 'cancan'
gem 'figaro'
gem 'haml-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'fb-channel-file'
gem 'koala', '~> 1.7.0rc1'

gem 'rolify'
gem 'simple_form', '>= 3.0.0.rc'
gem 'mail_form', :git => 'https://github.com/plataformatec/mail_form.git'
gem 'rack-recaptcha', :require => 'rack/recaptcha'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
	gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'mailcatcher'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
end

group :production do
	gem 'pg'
  gem 'thin'
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
