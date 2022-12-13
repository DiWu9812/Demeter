class CreateOwnRecipes < ActiveRecord::Migration
  def change
    create_table :own_recipes do |t|
    end
    add_reference :own_recipes, :user, foreign_key: true
    add_reference :own_recipes, :recipe, foreign_key: true
    add_index :own_recipes, [:user_id, :recipe_id], unique: true
  end
end
