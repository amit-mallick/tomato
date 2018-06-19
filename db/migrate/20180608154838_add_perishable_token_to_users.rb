class AddPerishableTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :perishable_token, :string, :default => "", :null => false
  end
  add_index :users, :perishable_token
end
