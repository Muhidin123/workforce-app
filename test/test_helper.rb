ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase

  #Warden test included because of the Devise gem
  #Devise gem requires for user to be signed in and some of the code uses "current_user" - devise helper
  #in accessing to a current logged in user
  include Warden::Test::Helpers

  
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...


end
