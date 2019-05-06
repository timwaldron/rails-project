class ChangeGamePriceToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :price, :integer
  end
end
