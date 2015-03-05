# This migration comes from gbase (originally 20150304125552)
class CreateGbasePermissions < ActiveRecord::Migration
  def change
    create_table :gbase_permissions, {:id => false} do |t|

      t.integer :gbase_user_id
      t.integer :gbase_modulo_id
      t.integer :gbase_menu_id
      t.foreign_key :gbase_users
      t.foreign_key :gbase_modulos
      t.foreign_key :gbase_menus

      t.timestamps
    end
    execute "ALTER TABLE gbase_permissions ADD PRIMARY KEY (gbase_user_id, gbase_modulo_id, gbase_menu_id);"
    rename_column :gbase_permissions, :gbase_user_id, :user_id
    rename_column :gbase_permissions, :gbase_modulo_id, :modulo_id
    rename_column :gbase_permissions, :gbase_menu_id, :menu_id
  end
end
