ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require_relative "factories"
require 'mocha/minitest'

class ActiveSupport::TestCase
end
