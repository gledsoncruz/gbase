require_dependency "gbase/application_controller"

module Gbase
  class PermissionsController < ApplicationController

    def grant
    	@user = User.find(params[:id])
    	@permission = Permission.new
    	@modulos = Modulo.includes(:menus).where.not('gbase_menus.id' => nil).order(descricao: :asc)
    end

    def create
    	@user = User.find(params[:permission][:user])
    	@perm = params[:permission]
    	#@permission = Permission.new
    	@permissions = @user.permissions

    	@menus = Menu.all
    	@menus_criar = Menu.find(@perm[:criar]) #Menus com permissao de criar
    	@menus_listar = Menu.find(@perm[:listar]) #Menus com permissao de listar
    	@menus_alterar = Menu.find(@perm[:alterar]) #Menus com permissao de alterar
    	@menus_apagar = Menu.find(@perm[:apagar]) #Menus com permissao de apagar
    	permission = Permission.new

    	@menus.each do |m|

    		#@menus_listar.include?(m) ? permission.listar = true : permission.listar = false
    		#@menus_criar.include?(m) ? permission.criar = true : permission.criar = false
    		#@menus_alterar.include?(m) ? permission.alterar = true : permission.alterar = false
    		#@menus_apagar.include?(m) ? permission.apagar = true : permission.apagar = false

    		if @menus_criar.include?(m)

    		end
    	end

    	redirect_to users_path
    end


    private

	  def secure_params
	    params.require(:permission).permit(:user_id, :modulo_id, :menu_id, :listar, :criar, :alterar, :apagar)

	  end
  end
end
