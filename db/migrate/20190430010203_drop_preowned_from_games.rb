class DropPreownedFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :preowned
  end
end
