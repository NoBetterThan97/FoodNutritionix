# frozen_string_literal: true
require 'simplecov'
SimpleCov.start

require 'vcr'
require 'yaml'
require 'dotenv'
require 'webmock'
require 'minitest/rg'
require 'minitest/autorun'

require_relative '../lib/foodnutritionix.rb'

Dotenv.load

CASSETTES_FOLDER = 'spec/support/cassettes'
FOODS = ['pizza']

VCR.configure do |config|
  config.cassette_library_dir = CASSETTES_FOLDER
  config.hook_into :webmock
  
  config.filter_sensitive_data('<X_APP_ID>') { ENV['X_APP_ID'] }
  config.filter_sensitive_data('<X_APP_KEY>') { ENV['X_APP_KEY'] }
end

def cassette_name(path_to_spec, description)
  spec_filename = File.basename(path_to_spec, '.*')
  spec_description = description.gsub(/^test_[0-9]+_/, '')

  "#{spec_filename} #{spec_description}"
end
