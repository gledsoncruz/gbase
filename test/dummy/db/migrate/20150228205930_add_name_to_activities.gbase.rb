# This migration comes from gbase (originally 20150228205904)
class AddNameToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :name, :string
  end
end
