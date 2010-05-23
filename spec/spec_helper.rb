ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(Rails)
require 'rspec/rails'

FastGettext.silence_errors

GettextTestLog::activate_test_logging

Rspec.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
#  config.use_transactional_fixtures = true
#  config.use_instantiated_fixtures  = false
#  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  config.include(ValidAttributes)
end
