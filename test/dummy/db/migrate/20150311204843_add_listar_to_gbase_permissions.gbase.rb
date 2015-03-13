# This migration comes from gbase (originally 20150311204651)
class AddListarToGbasePermissions < ActiveRecord::Migration
  def change
    add_column :gbase_permissions, :listar, :boolean
  end
end
