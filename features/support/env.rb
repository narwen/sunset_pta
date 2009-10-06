require 'rubygems'
prefork = lambda {
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
  require 'cucumber/formatter/unicode'
  require 'webrat'
  require 'cucumber/webrat/element_locator'
  Webrat.configure do |config|
    config.mode = :rails
    config.open_error_files = false
  end
  require 'cucumber/rails/rspec'
  require 'webrat/core/matchers'
}
each_run = lambda {
  require 'cucumber/rails/world'
  require 'email_spec/cucumber'
  Cucumber::Rails::World.use_transactional_fixtures = true
  ActionController::Base.allow_rescue = true
}
begin
  require 'spork'
  Spork.prefork(&prefork)
  Spork.each_run(&each_run)
rescue LoadError
  prefork.call
  each_run.call
end
require File.expand_path(File.dirname(__FILE__) + '/../../db/fixtures/duties.rb')
