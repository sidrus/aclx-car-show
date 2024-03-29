# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'devise'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  #config.filter_rails_from_backtrace!

  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
end

def configure_oauth_for_test
	Capybara.default_host = 'localhost'
		OmniAuth.config.test_mode = true
		Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
		Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
			:provider => 'facebook',
			:uid => '12345',
			:info => {
				:nickname => 'test_user',
				:email => 'test@example.org'
			}
		})
end