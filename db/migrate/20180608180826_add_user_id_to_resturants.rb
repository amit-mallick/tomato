class AddUserIdToResturants < ActiveRecord::Migration
  def change
    add_column :resturants, :user_id, :integer
  end
end
