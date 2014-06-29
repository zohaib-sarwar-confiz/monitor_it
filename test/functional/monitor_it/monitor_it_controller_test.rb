require 'test_helper'

module MonitorIt
  class MonitorItControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
