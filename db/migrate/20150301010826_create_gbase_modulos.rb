class CreateGbaseModulos < ActiveRecord::Migration
  def change
    create_table :gbase_modulos do |t|
      t.string :name
      t.string :descricao

      t.timestamps
    end
  end
end
