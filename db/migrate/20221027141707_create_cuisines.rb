class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :name, :null => false, index: { unique: true, name: 'unique_cuisine' }

      t.timestamps null: false
    end
  end
end
