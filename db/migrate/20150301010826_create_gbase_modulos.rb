class CreateGbaseModulos < ActiveRecord::Migration
  def change
    create_table :gbase_modulos do |t|
      t.string :name, :limit => 80, :null => false
      t.string :descricao, :limit => 120, :null => false

      t.timestamps
    end
    add_index :gbase_modulos, :name
  end
end
