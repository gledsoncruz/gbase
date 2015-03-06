module Gbase
  class Modulo < ActiveRecord::Base

  	#def self.policy_class
	 #   ApplicationPolicy
	#end

  	#include PublicActivity::Model
  	#tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil },
	#name: proc {|controller, model| model.name }

	has_paper_trail
	has_many :permissions
	has_many :users, through: :permissions
	has_many :menus, through: :permissions

	validates :name, :descricao, presence: true

  end
end
