class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :palette_id, null: false
      t.integer :giver_id, null: false

      t.timestamps
    end
    add_index :favorites, :palette_id
    add_index :favorites, :giver_id
  end
end