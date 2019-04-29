class CreateGames < ActiveRecord::Migration[5.2]
  def change
    drop_table :games

    create_table :games do |t|
      t.string :title
      t.string :genre
      t.float :price
      t.string :platform
      t.boolean :preowned
      t.integer :condition
      t.boolean :sold
      t.string :note
      t.integer :rating

      t.timestamps
    end
  end
end
