module Gbase
  class ApplicationController < ActionController::Base
  	before_action :authenticate_user!

  	include PublicActivity::StoreController

	#def current_user
	 # @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	#end

	#helper_method :current_user
	#hide_action :current_user





  end
end
