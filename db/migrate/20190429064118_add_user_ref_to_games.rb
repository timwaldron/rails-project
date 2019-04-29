class AddUserRefToGames < ActiveRecord::Migration[5.2]
  def change
    rename_table :game_tables, :game
  end
end
