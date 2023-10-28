class RenameTypeInDisaster < ActiveRecord::Migration[7.0]
  def change
    rename_column :disasters, :type, :disaster_type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
