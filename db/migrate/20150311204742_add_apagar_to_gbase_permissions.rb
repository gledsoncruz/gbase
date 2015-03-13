class AddApagarToGbasePermissions < ActiveRecord::Migration
  def change
    add_column :gbase_permissions, :apagar, :boolean
  end
end
