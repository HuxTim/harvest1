require 'test_helper'

class MarketTest < ActiveSupport::TestCase
  def setup
    @user = User.all.first
    @market = Market.new(name: "Example Market", city: "Boston", state: "MA", zipcode: "02453", open_time: 0, close_time: 1, description: "This is a market example!")
  end

  test "should be valid" do
    assert @market.valid?
  end

  test "name should be present" do
    @market.name = ""
    assert_not @market.valid?
  end

  test "name should not be blank" do
    @market.name = "     "
    assert_not @market.valid?
  end

  test "name should not be too long" do
    @market.name = "a" * 51
    assert_not @market.valid?
  end

  test "market name should be unique" do
    duplicate_market = @market.dup
    @market.save
    assert_not duplicate_market.valid?
  end

  test "description should not be too long" do
    @market.name = "a" * 501
    assert_not @market.valid?
  end

  test "have legal zipcode input" do
     @market.zipcode = "      "
     assert_not @market.valid?
     @market.zipcode = 023237
     assert_not @market.valid?
     @market.zipcode = 879
     assert_not @market.valid?
  end

  test "state should not be too long" do
     @market.state = "a" * 21
     assert_not @market.valid?
  end

  test "city should not be too long" do
     @market.city = "a" * 21
     assert_not @market.valid?
  end

  # it "have legal state input" do
  #    @market.state = "         "
  #    @market.valid?.must_equal false
  #    @market.state = 123
  #    @market.valid?.must_equal false
  #    @market.state = "MA"
  #    @market.valid?.must_equal true
  # end

  # it "have legal city input" do
  #    @market.state = "         "
  #    @market.valid?.must_equal false
  #    @market.state = 123
  #    @market.valid?.must_equal false
  #    @market.state = "Dafuq"
  #    @market.valid?.must_equal false
  #    @market.state = "Boston"
  #    @market.valid?.must_equal true
  # end

  test "open time should be present" do
    @market.open_time = ""
    assert_not @market.valid?
  end

  # test "close time should be present" do
  #   @market.close_time = ""
  #   assert_not @market.valid?
  # end
  #special case

  test "open time should more than 0" do
    @market.open_time = -1
    assert_not @market.valid?
  end

  test "close time should more than 0" do
    @market.close_time = -1
    assert_not @market.valid?
  end

  test "close time should less than 604800" do
    @market.close_time = 604801
    assert_not @market.valid?
  end

  test "open time must earlier than close time" do
    @market.open_time = 1
    @market.close_time = 0
    assert_not @market.valid?
  end

  # test "rating should more than or equal to 0" do
  #
  # end
  #
  # test "rating should be less or equal to 10" do
  #
  # end
end
