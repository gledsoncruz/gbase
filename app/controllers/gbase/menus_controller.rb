require_dependency "gbase/application_controller"

module Gbase

  	class MenusController < ApplicationController
  		before_action :set_modulo, only: [:show, :edit, :update, :destroy]
  		before_action :auth_menu


	    def index
	    	@q = Menu.search(params[:q])
		    @menus = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
		    respond_to do |format|
		        format.html
		        format.json { render :json => @menus.to_json }
		    end
	    end

	    def show
	    end

	    def edit
	    end

	    def update
	    	respond_to do |format|
		      if @menu.update(menu_params)
		        format.html { redirect_to @menu, notice: 'Menu alterado com sucesso.' }
		        format.json { render :show, status: :ok, location: @menu }
		      else
		        format.html { render :edit }
		        format.json { render json: @menu.errors, status: :unprocessable_entity }
		      end
		    end
	    end

	    def new
	    	@menu = Menu.new
	    	@modulos = Modulo.all
	    end

	    def create
	    	@menu = Menu.new(menu_params)
		    #@menu.link = controller_name.to_s

		    respond_to do |format|
		      if @menu.save
		        format.html { redirect_to @menu, notice: 'Menu criado com sucesso.' }
		        format.json { render :show, status: :created, location: @menu }
		      else
		        format.html { render :new }
		        format.json { render json: @menu.errors, status: :unprocessable_entity }
		      end
		    end
	    end

	    def destroy
		    @menu.destroy
		    respond_to do |format|
		      format.html { redirect_to menus_url, notice: 'Menu excluído com sucesso.' }
		      format.json { head :no_content }
		    end
		end

	    private
		    def set_modulo
		      	@menu = Menu.find(params[:id])
		    end
		    def menu_params
		    	params.require(:menu).permit(:nome, :descricao, :link, :icone, :modulo_id)
		    end
		    def auth_menu
      			authorize Menu
    		end


  	end

end
