module Gbase
  	class User < ActiveRecord::Base

  		#include PublicActivity::Model
  		#tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil },
		#name: proc {|controller, model| model.name }

		#has_paper_trail :only => [:name, :email]
	    # Include default devise modules. Others available are:
	    # :confirmable, :lockable, :timeoutable and :omniauthable

	    has_many :permissions, :dependent => :destroy
		has_many :modulos, through: :permissions
		has_many :menus, through: :permissions


	    devise :database_authenticatable, :registerable,
	           :recoverable, :rememberable, :trackable, :validatable, :timeoutable

	    enum role: [:super, :admin, :user]
		after_initialize :set_default_role, :if => :new_record?

		def set_default_role
		  self.role ||= :user
		end

		validates :name, presence: true

 	 end
end
