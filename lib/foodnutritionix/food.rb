# frozen_string_literal: true
module FoodNutritionix
  class Food
    attr_reader :name,
                :serving_quantity,
                :serving_unit,
                :serving_weight,
                :calories,
                :total_fat,
                :saturated_fat,
                :cholesterol,
                :sodium,
                :carbohydrate,
                :dietary_fiber,
                :sugars,
                :protein,
                :potassium,
                :photo

    def initialize(data)
      @name = data['food_name']
      populate_serving_information(data)
      populate_nutrition_facts(data)
      @photo = data['photo']
    end

    def populate_serving_information(data)
      @serving_quantity = data['serving_qty']
      @serving_unit     = data['serving_unit']
      @serving_weight   = data['serving_weight_grams']
    end

    def populate_nutrition_facts(data)
      @calories      = data.fetch('nf_calories', 0.0)
      @fat           = data.fetch('nf_total_fat', 0.0)
      @saturated_fat = data.fetch('nf_saturated_fat', 0.0)
      @cholesterol   = data.fetch('nf_cholesterol', 0.0)
      @sodium        = data.fetch('nf_sodium', 0.0)
      @carbohydrate  = data.fetch('nf_total_carbohydrate', 0.0)
      @dietary_fiber = data.fetch('nf_dietary_fiber', 0.0)
      @sugars        = data.fetch('nf_sugars', 0.0)
      @protein       = data.fetch('nf_protein', 0.0)
      @potassium     = data.fetch('nf_potassium', 0.0)
    end

    def self.search(*names)
      FoodNutrixClient.search_foods(names)
                     &.map { |food| new(food) }
    end
  end
end
