# frozen_string_literal: true
require_relative '../spec_helper.rb'

describe 'FoodNutritionix::Food::search' do
  before do
    VCR.insert_cassette(cassette_name(__FILE__, name), record: :new_episodes)
  end

  after do
    VCR.eject_cassette
  end

  it 'should return Foods that contain specific tags' do
    foods = FoodNutritionix::Food.search(FOODS)
    foods.wont_be_nil
  end
end
