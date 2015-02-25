require 'test_helper'

module Gbase
  class UserControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
