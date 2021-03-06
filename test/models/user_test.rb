require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", zipcode: "02453", state: "MA", city: "Boston", password: "qazsedc")
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

  test "have legal state input" do
     @user.state = "         "
     assert_not @user.valid?
     @user.state = 123
     assert_not @user.valid?
  end

  test "city name must to legel and belong to state" do
     @user.city = "Dafuq"
     assert_not @user.valid?
     @user.city = 123
     assert_not @user.valid?
     @user.city = "Boston"
     @user.state = "CA"
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

end
