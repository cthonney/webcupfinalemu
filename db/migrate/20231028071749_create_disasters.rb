class CreateDisasters < ActiveRecord::Migration[7.0]
  def change
    create_table :disasters do |t|
      t.string :type
      t.float :latitude
      t.float :longitude
      t.string :magnitude

      t.timestamps
    end
  end
end
