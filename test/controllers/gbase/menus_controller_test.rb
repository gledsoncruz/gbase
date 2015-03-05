require 'test_helper'

module Gbase
  class MenusControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

    test "should get create" do
      get :create
      assert_response :success
    end

  end
end
