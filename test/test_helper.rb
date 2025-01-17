
ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter 'app/secrets'
end
require_relative "../config/environment"
require "rails/test_help"


class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  #This is commented out to get rid of a testing error
 # parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  def log_in( admin)
    if (integration_test?)
      #user warden helper
      login_as(admin, :scope => :admin)
    else #controller_test, model_test
      #USE DEVISE HELPER
      sign_in(admin)
    end
  end
end
