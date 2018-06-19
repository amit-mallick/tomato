class AddTypeToResturant < ActiveRecord::Migration
  def change
    add_column :resturants, :cuisines, :string
  end
end
