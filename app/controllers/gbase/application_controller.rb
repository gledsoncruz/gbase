module Gbase
  class ApplicationController < ActionController::Base
  	include Pundit
  	protect_from_forgery
  	before_action :authenticate_user!

  	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	  private

	  def user_not_authorized
	    flash[:alert] = "Acesso não autorizado, entre em contato com o administrador."
	    redirect_to(request.referrer || Rails.application.routes.url_helpers.root_path)
	  end
  end
end
