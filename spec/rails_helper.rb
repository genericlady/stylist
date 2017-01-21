ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'support/factory_girl'
require 'capybara/poltergeist'
require 'shoulda/matchers'

Capybara.javascript_driver = :poltergeist
Capybara.default_driver    = :poltergeist
Capybara.default_max_wait_time = 5 # This is usually 2 seconds

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # use_transactional_fixtures is usually set to true
  # transactional fixtures is RSpecs way of handling the database
  # since we are using DatabaseCleaner it must be set to false
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  # config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :type => :feature) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

