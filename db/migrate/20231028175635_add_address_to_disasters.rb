class AddAddressToDisasters < ActiveRecord::Migration[7.0]
  def change
    add_column :disasters, :address, :string
  end
end
