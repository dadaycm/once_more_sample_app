require 'test_helper'

class GuanxisControllerTest < ActionDispatch::IntegrationTest

  test "create should require logged-in user" do
    assert_no_difference 'Guanxi.count' do
      post guanxis_path
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Guanxi.count' do
      delete guanxi_path(guanxis(:one))
    end
    assert_redirected_to login_url
  end
end
