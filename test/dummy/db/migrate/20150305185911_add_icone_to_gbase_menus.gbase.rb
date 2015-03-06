# This migration comes from gbase (originally 20150305184933)
class AddIconeToGbaseMenus < ActiveRecord::Migration
  def change
    add_column :gbase_menus, :icone, :string, :limit => 40
  end
end
