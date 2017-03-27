require 'test_helper'

describe Market do
  before do
    @market = Market.create()
  end

  test "should be valid" do
    assert @market.valid?
  end

  test "name should be present" do
    @market.name = ""
    assert_not @market.valid?
    @market.name = "    "
    assert_not @market.valid?
  end

  test "name should not be too long" do
    @market.name = "a" * 51
    assert_not @market.valid?
  end

  it "cannot have empty description" do
     @market.description = "     "
     @market.valid?.must_equal false
     @market.description = nil
     @market.valid?.must_equal false
     @market.description = "a market"
     @market.valid?.must_equal true
  end

  it "have legal zipcode" do
     @market.zipcode = "      "
     @market.valid?.must_equal false
     @market.zipcode = 023237
     @market.valid?.must_equal false
     @market.zipcode = 879
     @market.valid?.must_equal false
     @market.zipcode = 02453
     @market.valid?.must_equal true
  end

  it "have legal state name" do
     @market.state = "         "
     @market.valid?.must_equal false
     @market.state = 123
     @market.valid?.must_equal false
     @market.state = "MA"
     @market.valid?.must_equal true
  end
end
