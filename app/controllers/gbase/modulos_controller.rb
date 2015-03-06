require_dependency "gbase/application_controller"

module Gbase
  class ModulosController < ApplicationController
    after_action :verify_authorized

    def index
        authorize Modulo
        @q = Modulo.search(params[:q])
        @modulos = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
    end

    def show
        @modulo = Modulo.find(params[:id])
        @versions = @modulo.versions.reverse &:created_at
        respond_to do |format|
            format.html
            format.json { render :json => @modulo.to_json }
        end
    end

    def new
        @modulo = Modulo.new
    end

    def create
        @modulo = Modulo.new(secure_params)
        respond_to do |format|
          if @modulo.save
            format.html { redirect_to @modulo, notice: 'Módulo criado com sucesso.' }
            format.json { render :show, status: :created, location: @modulo }
          else
            format.html { render :new }
            format.json { render json: @modulo.errors, status: :unprocessable_entity }
          end
        end
    end

    def edit
        @modulo = Modulo.find(params[:id])
    end

    def update

        @modulo = Modulo.find(params[:id])
        if @modulo.update_attributes(secure_params)
          redirect_to modulo_path, :flash => { :success => 'Módulo alterado com sucesso.' }
        else
          render :action => 'edit'
        end
    end

    def destroy
        modulo = Modulo.find(params[:id])
        modulo.destroy
        redirect_to modulos_path, :notice => "Módulo excluído com sucesso."
    end

    private

      def secure_params
        params.require(:modulo).permit(:name, :descricao)
      end
  end
end
