class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :surname, :string
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :country, :string
    add_column :users, :admin, :boolean
    add_column :users, :ngo, :boolean
    add_column :users, :gov, :boolean
  end
end
