class CreateResturants < ActiveRecord::Migration
  def change
    create_table :resturants do |t|
      t.string :image
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
