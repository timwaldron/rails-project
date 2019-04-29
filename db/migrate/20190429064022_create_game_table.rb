class CreateGameTable < ActiveRecord::Migration[5.2]
  def change
    create_table :game_tables do |t|
      t.string :title
      t.string :genre
      t.float :price
      t.string :platform
      t.boolean :preowned
      t.integer :condition
      t.boolean :sold
      t.string :note
      t.integer :rating
    end
  end
end
