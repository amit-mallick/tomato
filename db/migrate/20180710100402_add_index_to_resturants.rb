class AddIndexToResturants < ActiveRecord::Migration
  def change
    add_index :resturants, :user_id
  end
end
