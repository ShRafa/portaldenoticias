class AddRoleToUser < ActiveRecord::Migration
  def change
    remove_column :users, :role
    add_reference :users, :role
  end
end
