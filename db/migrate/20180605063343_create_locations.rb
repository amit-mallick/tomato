  class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :location
      t.references :resturant

      t.timestamps
    end
    add_index :locations, :resturant_id
  end
end
