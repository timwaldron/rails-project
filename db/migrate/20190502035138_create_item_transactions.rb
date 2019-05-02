class CreateItemTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :item_transactions do |t|
      t.integer :item_id
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
