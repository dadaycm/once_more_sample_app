require 'test_helper'

class GuanxiTest < ActiveSupport::TestCase

  def setup
    @guanxi = Guanxi.new(follower_id: users(:michael).id,
                                     followed_id: users(:archer).id)
  end

  test "should be valid" do
    @guanxi.valid?
    assert @guanxi.valid?
  end

  test "should require a follower_id" do
    @guanxi.follower_id = nil
    assert_not @guanxi.valid?
  end

  test "should require a followed_id" do
    @guanxi.followed_id = nil
    assert_not @guanxi.valid?
  end
end
