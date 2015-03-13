class AddAlterarToGbasePermissions < ActiveRecord::Migration
  def change
    add_column :gbase_permissions, :alterar, :boolean
  end
end
