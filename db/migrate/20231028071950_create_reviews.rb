class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.boolean :is_safe
      t.string :comment
      t.string :full_name
      t.string :email
      t.string :image_path
      t.references :disaster, null: false, foreign_key: true

      t.timestamps
    end
  end
end
