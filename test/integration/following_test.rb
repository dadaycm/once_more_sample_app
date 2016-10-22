require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other = users(:archer)
    log_in_as(@user)
  end

  test "superstars page" do
    get superstars_user_path(@user)
    assert_not @user.superstars.empty?
    assert_match @user.superstars.count.to_s, response.body
    @user.superstars.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "fans page" do
    get fans_user_path(@user)
    assert_not @user.fans.empty?
    assert_match @user.fans.count.to_s, response.body
    @user.fans.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "should follow a user the standard way" do
    assert_difference '@user.superstars.count', 1 do
      post guanxis_path, params: { followed_id: @other.id }
    end
  end

  test "should follow a user with Ajax" do
    assert_difference '@user.superstars.count', 1 do
      post guanxis_path, xhr: true, params: { followed_id: @other.id }
    end
  end

  test "should unfollow a user the standard way" do
    @user.follow(@other)
    guanxi = @user.active_guanxis.find_by(followed_id: @other.id)
    assert_difference '@user.superstars.count', -1 do
      delete guanxi_path(guanxi)
    end
  end

  test "should unfollow a user with Ajax" do
    @user.follow(@other)
    guanxi = @user.active_guanxis.find_by(followed_id: @other.id)
    assert_difference '@user.superstars.count', -1 do
      delete guanxi_path(guanxi), xhr: true
    end
  end
end
