class EnsureUniquenessOfFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, [:giver_id, :palette_id], :uniq => true
  end
end
