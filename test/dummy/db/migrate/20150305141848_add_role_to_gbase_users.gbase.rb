# This migration comes from gbase (originally 20150226124830)
class AddRoleToGbaseUsers < ActiveRecord::Migration
  def change
    add_column :gbase_users, :role, :integer
    change_column_null :gbase_users, :role, false
  end
end
