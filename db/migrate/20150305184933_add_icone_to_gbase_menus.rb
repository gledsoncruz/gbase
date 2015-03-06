class AddIconeToGbaseMenus < ActiveRecord::Migration
  def change
    add_column :gbase_menus, :icone, :string, :limit => 40
  end
end
