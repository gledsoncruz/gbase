module Gbase
  class ApplicationController < ActionController::Base
  	#include PublicActivity::StoreController
  	before_action :authenticate_user!


	#def current_user
	  #@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	#end

	#helper_method :current_user
	#hide_action :current_user

  end
end
