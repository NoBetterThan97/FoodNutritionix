# frozen_string_literal: true
require 'yaml'
require 'httparty'

module FoodNutritionix
  class FoodNutrixClient
    API_BASE = 'https://trackapi.nutritionix.com/'
    API_VERSION = 'v2/'
    SEARCH_FOOD_ENDPOINT = URI.join(API_BASE, API_VERSION, 'natural/nutrients')

    def self.config=(conf)
      @config ? @config.update(conf) : (@config = conf)
    end

    def self.config
      @config ||= { x_app_id: ENV['X_APP_ID'], x_app_key: ENV['X_APP_KEY'] }
    end

    def self.search_foods(*foods)
      result = HTTParty.post(SEARCH_FOOD_ENDPOINT,
                             headers: authorization_header,
                             body: { query: foods.join(' ') })
                       .parsed_response
      result['foods']
    end

    def self.authorization_header
      @authorization_header ||= {
        'x-app-id'  => config[:x_app_id].to_s,
        'x-app-key' => config[:x_app_key].to_s
      }
    end
  end
end
