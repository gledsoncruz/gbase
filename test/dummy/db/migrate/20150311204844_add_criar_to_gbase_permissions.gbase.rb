# This migration comes from gbase (originally 20150311204711)
class AddCriarToGbasePermissions < ActiveRecord::Migration
  def change
    add_column :gbase_permissions, :criar, :boolean
  end
end
