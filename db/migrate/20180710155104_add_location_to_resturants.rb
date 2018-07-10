class AddLocationToResturants < ActiveRecord::Migration
  def change
    add_column :resturants, :location, :string
  end
end
