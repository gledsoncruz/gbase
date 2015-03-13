# This migration comes from gbase (originally 20150311204725)
class AddAlterarToGbasePermissions < ActiveRecord::Migration
  def change
    add_column :gbase_permissions, :alterar, :boolean
  end
end
