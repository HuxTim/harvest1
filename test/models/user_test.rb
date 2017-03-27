require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", zipcode: "02453", state: "MA", city: "boston")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
    @user.name = "    "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "name should be valid" do
    @user.name = "213dsajlsa"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "zipcode should be present" do
    @user.zipcode = nil
    assert_not @user.valid?
    @user.zipcode = ""
    assert_not @user.valid?
    @user.zipcode = "   "
    assert_not @user.valid?
  end

  test "state should be present" do
    @user.state = nil
    assert_not @user.valid?
    @user.state = ""
    assert_not @user.valid?
    @user.state = "   "
    assert_not @user.valid?
  end

  test "city should be present" do
    @user.city = nil
    assert_not @user.valid?
    @user.city = ""
    assert_not @user.valid?
    @user.city = "   "
    assert_not @user.valid?
  end

  test "zipcode should be acceptable" do
    @user.zipcode = "dsajkl"
    assert_not @user.valid?
    @user.zipcode = "1293809"
    assert_not @user.valid?
    @user.zipcode = "021"
    assert_not @user.valid?
  end

  test "state should be acceptable" do
    @user.state = "dsajkl"
    assert_not @user.valid?
    @user.state = "1293809"
    assert_not @user.valid?
    @user.state = "021"
    assert_not @user.valid?
  end

  test "city should be acceptable" do
    @user.city = "dsajkl"
    assert_not @user.valid?
    @user.city = "1293809"
    assert_not @user.valid?
    @user.city = "021"
    assert_not @user.valid?
  end
end
