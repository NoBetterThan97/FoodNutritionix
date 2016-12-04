# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'foodnutritionix/version'

Gem::Specification.new do |s|
  s.name        =  'foodnutritionix'
  s.version     =  FoodNutritionix::VERSION

  s.summary     =  'Get foods nutrients by search it name'
  s.description =  'Get name, search time, unit, qty, weight, nutrients, calories, photo'
  s.authors     =  ['Leo Lee']
  s.email       =  ['leo.li@iss.nthu.edu.tw']

  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- spec/*`.split("\n")

  s.add_runtime_dependency 'httparty', '~> 0.14'

  s.add_development_dependency 'dotenv', '~> 2.1'
  s.add_development_dependency 'minitest', '~> 5.9'
  s.add_development_dependency 'minitest-rg', '~> 5.2'
  s.add_development_dependency 'rake', '~> 11.3'
  s.add_development_dependency 'vcr', '~> 3.0'
  s.add_development_dependency 'webmock', '~> 2.1'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'flog', '~> 4.4'
  s.add_development_dependency 'flay', '~> 2.8'
  s.add_development_dependency 'rubocop', '~> 0.42'
  s.add_development_dependency 'httparty', '~> 0.14'

  s.homepage    =  'https://github.com/NoBetterThan97/FoodNutritionix'
  s.license     =  'MIT'
end
