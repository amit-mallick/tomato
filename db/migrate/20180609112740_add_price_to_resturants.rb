class AddPriceToResturants < ActiveRecord::Migration
  def change
    add_column :resturants, :price, :integer
  end
end
