class CreateRecipeVotes < ActiveRecord::Migration
  def change
    create_table :recipe_votes do |t|
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0
    end
    add_reference :recipe_votes, :recipe, foreign_key: true
    add_index :recipe_votes, :recipe_id, unique: true
  end
end
