# frozen_string_literal: true
module FoodNutritionix
  class Food
    attr_reader :food_name, :consumed_at, :serving_qty, :serving_unit, :serving_weight_grams, :nf_calories, :nf_total_fat, :nf_saturated_fat, :nf_cholesterol, :nf_sodium, :nf_total_carbohydrate, :nf_dietary_fiber, :nf_sugars, :nf_protein, :nf_potassium, :photo

    def initialize(data)
      @food_name = data['food_name']
      @consumed_at = DateTime.parse(data['consumed_at'])
      @serving_qty = data['serving_qty']
      @serving_unit = data['serving_unit']
      @serving_weight_grams = data['serving_weight_grams']
      @nf_calories = data['nf_calories']
      @nf_total_fat = data['nf_total_fat']
      @nf_saturated_fat = data['nf_saturated_fat']
      @nf_cholesterol = data['nf_cholesterol']
      @nf_sodium = data['nf_sodium']
      @nf_total_carbohydrate = data['nf_total_carbohydrate']
      @nf_dietary_fiber = data['nf_dietary_fiber']
      @nf_sugars = data['nf_sugars']
      @nf_protein = data['nf_protein']
      @nf_potassium = data['nf_potassium']
      @photo = data['photo']
    end

    def self.search(*tags)
      data = FoodNutrixClient.search_foods(tags)
      new(data)
    end
  end
end
