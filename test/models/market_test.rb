require 'test_helper'

class MarketTest < ActiveSupport::TestCase
  def setup
    @user = User.all.first
    @market = Market.new(name: "Example Market", city: "Boston", state: "MA", zipcode: "02453", open_time: 0, close_time: 1, description: "This is a market example!",rating: 0)
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

  test "description should not be too long" do
    @market.name = "a" * 251
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

  test "rating should be postive" do
    @market.rating = -1
    assert_not @market.valid?
  end

  test "rating should be less than 5" do
    @market.rating = 6
    assert_not @market.valid?
  end

  test "have legal state input" do
     @market.state = "         "
     assert_not @market.valid?
     @market.state = 123
     assert_not @market.valid?
  end

  test "city name must to legel and belong to state" do
    @market.city = "Dafuq"
    assert_not @market.valid?
    @market.city = 123
    assert_not @market.valid?
    @market.city = "Boston"
    @market.state = "CA"
    assert_not @market.valid?
  end

  test "open time should be present" do
    @market.open_time = ""
    assert_not @market.valid?
  end

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
end
