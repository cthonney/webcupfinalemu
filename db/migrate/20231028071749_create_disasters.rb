class CreateDisasters < ActiveRecord::Migration[7.0]
  def change
    create_table :disasters do |t|
      t.string :type
      t.string :latitude
      t.string :longitude
      t.string :magnitude

      t.timestamps
    end
  end
end
