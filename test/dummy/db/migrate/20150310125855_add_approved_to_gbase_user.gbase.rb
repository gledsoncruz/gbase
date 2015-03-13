# This migration comes from gbase (originally 20150310124824)
class AddApprovedToGbaseUser < ActiveRecord::Migration
  def change
    add_column :gbase_users, :approved, :boolean
  end
end
