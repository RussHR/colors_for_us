class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      t.string :color_1, null: false
      t.string :color_2
      t.string :color_3
      t.string :color_4
      t.string :color_5
      t.integer :creator_id, null: false

      t.timestamps
    end
    add_index :palettes, :creator_id
  end
end
