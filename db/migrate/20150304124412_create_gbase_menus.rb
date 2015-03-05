class CreateGbaseMenus < ActiveRecord::Migration
  def change
    create_table :gbase_menus do |t|
      t.string :nome, :limit => 80, :null => false
      t.string :descricao, :limit => 120, :null => false
      t.string :link, :limit => 30, :null => false
      t.integer :gbase_modulo_id
      t.foreign_key :gbase_modulos

      t.timestamps
    end
    add_index :gbase_menus, :descricao
    rename_column :gbase_menus, :gbase_modulo_id, :modulo_id
  end
end
