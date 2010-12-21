source 'http://rubygems.org'

gem 'rails', '3.0.0.beta4'

# data slinging
gem 'sqlite3-ruby', :require => 'sqlite3', :group => [:development, :test]
gem 'mysql'
gem 'mysql2'
gem 'right_aws'

# don't bother loading these into memory by default
group :deploy do
  gem 'unicorn'
  gem 'capistrano'
end

# test libs
group :test do
  gem 'rspec'
  gem 'rspec-rails', '>= 2.0.0.beta.10'
  gem 'rr'
  gem 'autotest'
  gem 'autotest-rails'
  gem 'webrat'
  gem 'ruby-debug'
end
