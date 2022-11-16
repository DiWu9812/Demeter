class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name, :null => false, index: { unique: true, name: 'unique_ingredient' }
      t.float :calorie_per_serving

      t.timestamps null: false
    end
  end
end
