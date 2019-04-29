class RenameGameTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :game, :games
  end
end
