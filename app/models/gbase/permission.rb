module Gbase
  class Permission < ActiveRecord::Base

  	self.primary_keys = :user_id, :modulo_id, :menu_id
	belongs_to :modulo, :foreign_key => [:modulo_id]
  	belongs_to :user, :foreign_key => [:user_id]
  	belongs_to :menu, :foreign_key => [:menu_id]

  end
end
