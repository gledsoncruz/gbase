require_dependency "gbase/application_controller"

module Gbase
  class PermissionsController < ApplicationController

    def grant
    	@user = User.find(params[:id])
    	@permission = Permission.new
    	@modulos = Modulo.includes(:menus).where.not('gbase_menus.id' => nil).order(descricao: :asc)
    end

    def create
        @permission = Permission.new
    	@user = User.find(params[:permission][:user])
    	@perm = params[:permission]
    	#@permissions = @user.permissions

    	@menus = Menu.all

    	@menus_criar = Menu.find(@perm[:criar]) rescue []#Menus com permissao de criar
    	@menus_listar = Menu.find(@perm[:listar]) rescue []#Menus com permissao de listar
    	@menus_alterar = Menu.find(@perm[:alterar]) rescue []#Menus com permissao de alterar
    	@menus_apagar = Menu.find(@perm[:apagar]) rescue []#Menus com permissao de apagar

    	@menus.each do |m|
            permission = Permission.new
            permission.user_id = @user.id
            permission.modulo_id = m.modulo_id
            permission.menu_id = m.id
            #logger.fatal permission.menu_id

            if @user.permissions.exists?(permission.id)

                p = Permission.find(permission.id)
                @menus_listar.include?(m) ? p.update(listar: true) : p.update(listar: false)
                @menus_criar.include?(m) ? p.update(criar: true) : p.update(criar: false)
                @menus_alterar.include?(m) ? p.update(alterar: true) : p.update(alterar: false)
                @menus_apagar.include?(m) ? p.update(apagar: true) : p.update(apagar: false)

                if not p.listar? and not p.criar? and not p.alterar? and not p.apagar?
                    p.delete
                end

            else
                @menus_listar.include?(m) ? permission.listar = true : permission.listar = false
                @menus_criar.include?(m) ? permission.criar = true : permission.criar = false
                @menus_alterar.include?(m) ? permission.alterar = true : permission.alterar = false
                @menus_apagar.include?(m) ? permission.apagar = true : permission.apagar = false
                if permission.listar? or permission.criar? or permission.alterar? or permission.apagar?
                    permission.save
                end
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
