module Gbase
  class ModuloPolicy < ApplicationPolicy

  	#def index?
	#	current_user.admin?
	#end

	def history?
        current_user.super?
    end

    def revert?
        current_user.super?
    end

  end
end
