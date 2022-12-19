# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'json'
require 'uri'
require 'net/http'
require 'openssl'
require 'activerecord-import'

ing_path = "#{Rails.root}/db/csv/ingredient.csv"
ingredients = []
CSV.foreach(ing_path, headers: true) do |row|
	ingredients << row.to_h
end
Ingredient.import(ingredients)

reci_path = "#{Rails.root}/db/csv/recipe.csv"
recipe = []
CSV.foreach(reci_path, headers: true) do |row|
	recipe << row.to_h
end
Recipe.import(recipe)

reci_ing_path = "#{Rails.root}/db/csv/recipe_ingredient.csv"
recipe_ingredients = []
CSV.foreach(reci_ing_path, headers: true) do |row|
	recipe_ingredients << row.to_h
end
RecipeIngredient.import(recipe_ingredients)

Recipe.find_each do |recipe|
	RecipeVote.create(:recipe_id => recipe.id)
end
