# This migration comes from gbase (originally 20150226122119)
class AddNameToGbaseUsers < ActiveRecord::Migration
  def change
    add_column :gbase_users, :name, :string, :limit => 80
    change_column_null :gbase_users, :name, false
  end
end
