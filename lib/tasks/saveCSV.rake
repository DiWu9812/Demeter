# usage:
# bundle exec rake csv:ingredient:all => export all users to /db/csv/ingredient.csv
# bundle exec rake csv:recipe_ingredients:all => export all users to /db/csv/recipe_ingredient.csv
# bundle exec rake csv:recipes:all => export all users to /db/csv/recipe.csv
require 'csv'

# filename = ["ingredient", "recipe_ingredients", "recipes"] 
namespace :csv do
  namespace :ingredient do
    desc "export all ingredients to a csv file"
    task :all => :environment do
      ing_file = "#{Rails.root}/db/csv/ingredient.csv"
      ing_table = Ingredient.all;0 # ";0" stops output.  Change "User" to any model.
      export_to_csv(ing_file, ing_table)
    end
  end
  namespace :recipe_ingredients do
    task :all => :environment do
      reci_ing_file = "#{Rails.root}/db/csv/recipe_ingredient.csv"
      reci_ing_table = RecipeIngredient.all;0 # ";0" stops output.  Change "User" to any model.
      export_to_csv(reci_ing_file, reci_ing_table)
    end
  end

  namespace :recipes do
    task :all => :environment do
      reci_file = "#{Rails.root}/db/csv/recipe.csv"
      reci_table = Recipe.all;0 # ";0" stops output.  Change "User" to any model.
      export_to_csv(reci_file, reci_table)
    end
  end

  def export_to_csv(file, table)
    CSV.open(file, 'w' ) do |writer|
      writer << table.first.attributes.map { |a,v| a }
      table.each do |s|
        writer << s.attributes.map { |a,v| v }
      end
    end
  end
end