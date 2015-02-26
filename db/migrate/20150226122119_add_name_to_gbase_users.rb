class AddNameToGbaseUsers < ActiveRecord::Migration
  def change
    add_column :gbase_users, :name, :string, :limit => 80
    change_column_null :gbase_users, :name, false
  end
end
