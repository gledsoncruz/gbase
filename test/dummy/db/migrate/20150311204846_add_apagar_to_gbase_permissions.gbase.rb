# This migration comes from gbase (originally 20150311204742)
class AddApagarToGbasePermissions < ActiveRecord::Migration
  def change
    add_column :gbase_permissions, :apagar, :boolean
  end
end
