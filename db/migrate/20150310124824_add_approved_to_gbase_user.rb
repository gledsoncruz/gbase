class AddApprovedToGbaseUser < ActiveRecord::Migration
  def change
    add_column :gbase_users, :approved, :boolean
  end
end
