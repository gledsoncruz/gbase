require_dependency "gbase/application_controller"

module Gbase
  class HomeController < ApplicationController


  	def index
    	#@activities = PublicActivity::Activity.order('created_at DESC').limit(20)
    end


  end
end
