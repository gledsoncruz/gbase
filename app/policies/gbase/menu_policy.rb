module Gbase
  class MenuPolicy < ApplicationPolicy



  	def index?
		@current_user.super? and @current_user.permissions.select{|p| p.listar == true && p.menu.link == getLink}.any?
	end

	def create?
	    @current_user.super? and @current_user.permissions.select{|p| p.criar == true && p.menu.link == getLink}.any?
	end

	def new?
	    create?
	end

	def update?
	    @current_user.super? and @current_user.permissions.select{|p| p.alterar == true && p.menu.link == getLink}.any?
	end

	def edit?
	    update?
	end

	def destroy?
	    @current_user.super? and @current_user.permissions.select{|p| p.apagar == true && p.menu.link == getLink}.any?
	end


	def getLink
		Gbase::Engine.routes.url_helpers.menus_path
	end

  end
end
