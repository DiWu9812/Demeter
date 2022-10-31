class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, :null => false
      t.text :steps, :null => false
      t.string :image_url

      t.timestamps null: false
    end
  end
end
