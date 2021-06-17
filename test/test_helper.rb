ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require 'coveralls'
Coveralls.wear!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  #This is commented out to get rid of a testing error
  #parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
