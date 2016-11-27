require 'vcr'
require 'yaml'
require 'dotenv'
require 'webmock'
require 'minitest/rg'
require 'minitest/autorun'

require_relative '../lib/foodnutritionix.rb'

Dotenv.load

puts FoodNutritionix::FoodNutrixClient.search_foods
 puts ENV['x_app_id']
 puts ENV['x_app_key']
