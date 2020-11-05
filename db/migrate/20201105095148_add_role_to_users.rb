class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer, :null => false, :default => 0
    add_column :books, :creator_id, :integer
  end
end
