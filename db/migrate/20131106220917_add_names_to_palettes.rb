class AddNamesToPalettes < ActiveRecord::Migration
  def change
    add_column :palettes, :name, :string
  end
end
