require_dependency "gbase/application_controller"

module Gbase
  class VersionsController < ApplicationController
  	before_action :auth_modulo
    def revert
    end

    def history
    	@modulo = Modulo.find(params[:id])
    	@reifies = @modulo.versions.map{|v| v.reify}.compact#.reverse &:created_at
    end

    private

    def auth_modulo
       authorize Modulo
    end
  end
end
