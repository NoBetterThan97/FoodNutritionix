# frozen_string_literal: true
require_relative '../spec_helper.rb'

describe 'FoodNutritionix::FoodNutrixClient::search_foods' do
  before do
    VCR.insert_cassette(cassette_name(__FILE__, name), record: :new_episodes)
  end

  after do
    VCR.eject_cassette
  end

  it 'should return foods information that contain specific tags' do
    FoodNutritionix::FoodNutrixClient.search_foods(FOODS).wont_be_nil
  end
end
