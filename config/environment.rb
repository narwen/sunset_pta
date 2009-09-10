# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.active_record.observers = :user_observer
  config.time_zone = 'UTC'

  # config.gem "ambethia-smtp-tls",
  #   :lib     => "smtp-tls",
  #   :version => "1.1.2",
  #   :source  => "http://gems.github.com"

  config.gem "authlogic"
  config.gem "be9-acl9", :source => "http://gems.github.com", :lib => "acl9"
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true
  }

end

