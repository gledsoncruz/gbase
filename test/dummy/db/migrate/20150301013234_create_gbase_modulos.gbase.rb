# This migration comes from gbase (originally 20150301010826)
class CreateGbaseModulos < ActiveRecord::Migration
  def change
    create_table :gbase_modulos do |t|
      t.string :name
      t.string :descricao

      t.timestamps
    end
  end
end
