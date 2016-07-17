source 'https://rubygems.org'


gem 'rails', '5.0.0'
gem 'pg', '0.18.4'
gem 'puma', '3.4.0'
gem 'rack-cors', :require => 'rack/cors'
gem 'devise'
gem 'dotenv-rails', :groups => [:development, :test, :production]

group :development, :test do
  gem 'faker', git: 'https://github.com/stympy/faker'
  gem 'pry', '0.10.4'
end

group :development do
  gem 'listen', '3.0.8'
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.0'
  gem 'rails_best_practices'
  gem 'metric_fu'

end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


group :test do
  gem 'simplecov', :require => false
  gem 'factory_girl_rails', '4.7.0'
  gem 'factory_girl', '4.7.0'
  gem 'shoulda-matchers', '3.1.1'
  gem 'rspec-core', '3.5.1'
  gem 'rspec-expectations', '3.5.0'
  gem 'rspec-mocks', '3.5.0'
  gem 'rspec-rails', '3.5.1'
  gem 'rspec-support', '3.5.0'
end