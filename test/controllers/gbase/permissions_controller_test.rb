require 'test_helper'

module Gbase
  class PermissionsControllerTest < ActionController::TestCase
    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
