module Gbase
  class Modulo < ActiveRecord::Base

  	include PublicActivity::Model
  	tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil },
	name: proc {|controller, model| model.name }

	has_paper_trail

  end
end
