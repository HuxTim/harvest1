require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  def setup
    @user = User.all.first
    @vender = Vendor.new(user_id: @user.id, description: "this is a example vendor")
  end

  test "should be valid" do
    assert @vender.valid?
  end

  test "user_id should be present" do
    @vender.user_id = ""
    assert_not @vender.valid?
  end

  test "description should not be too long" do
    @vender.description = "a" * 251
    assert_not @vender.valid?
  end
end
