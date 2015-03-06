module Gbase
  class UserPolicy < ApplicationPolicy

	def show?
    	current_user.super? or current_user == model
  	end

  	def edit?
    	update?
  	end

  	def update?
    	current_user.super? or current_user == model
  	end

  end
end