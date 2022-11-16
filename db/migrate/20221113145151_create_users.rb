class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false, index: { unique: true, name: 'unique_username' }
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
