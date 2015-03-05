require 'test_helper'

module Gbase
  class VersionsControllerTest < ActionController::TestCase
    test "should get revert" do
      get :revert
      assert_response :success
    end

    test "should get history" do
      get :history
      assert_response :success
    end

  end
end
