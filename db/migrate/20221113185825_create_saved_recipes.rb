class CreateSavedRecipes < ActiveRecord::Migration
  def change
    create_table :saved_recipes do |t|
    end
    add_reference :saved_recipes, :user, foreign_key: true
    add_reference :saved_recipes, :recipe, foreign_key: true
    add_index :saved_recipes, [:user_id, :recipe_id], unique: true
  end
end
