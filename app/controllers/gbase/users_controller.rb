require_dependency "gbase/application_controller"

module Gbase
  class UsersController < ApplicationController

    def index
    	@q = User.search(params[:q])
    	@users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
    end

    def new

    end

  end
end
