class AddListarToGbasePermissions < ActiveRecord::Migration
  def change
    add_column :gbase_permissions, :listar, :boolean
  end
end
