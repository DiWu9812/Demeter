class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string :unit
      t.float :amount, :default => false
      t.string :metric_unit
      t.float :metric_amount, :default => false

      t.timestamps null: false
    end
  end
end
