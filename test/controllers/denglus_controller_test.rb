require 'test_helper'

class DenglusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get denglus_new_url
    assert_response :success
  end

end
