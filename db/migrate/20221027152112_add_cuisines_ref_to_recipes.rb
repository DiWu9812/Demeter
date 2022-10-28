class AddCuisinesRefToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :cuisine, index: true, foreign_key: true
  end
end
