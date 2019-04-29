class AddItemsToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :street_number, :string
    add_column :users, :street_name, :string
    add_column :users, :suburb, :string
    add_column :users, :city, :string
    add_column :users, :postcode, :integer
    add_column :users, :date_of_birth, :date
  end
end
