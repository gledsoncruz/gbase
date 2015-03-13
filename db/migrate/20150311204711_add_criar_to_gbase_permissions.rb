class AddCriarToGbasePermissions < ActiveRecord::Migration
  def change
    add_column :gbase_permissions, :criar, :boolean
  end
end
