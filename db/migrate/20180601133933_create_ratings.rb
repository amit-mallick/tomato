class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :commenter
      t.integer :rating
      t.text :body
      t.references :resturant

      t.timestamps
    end
    add_index :ratings, :resturant_id
  end
end
