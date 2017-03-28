require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @store = Store.all.first
    @product = Product.new(name: "Example Product", quantity: "100LB", price: "100D/LB", description: "this is my example product", tag: "this is a tag feild", store_id: @store.id)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = ""
    assert_not @product.valid?
  end

  test "price should be present" do
    @product.price = ""
    assert_not @product.valid?
  end

  test "store id should be present" do
    @product.store_id = ""
    assert_not @product.valid?
  end

  test "name should not be too long" do
    @product.name = "a" * 51
    assert_not @product.valid?
  end

  test "description shoud not be too long" do
    @product.description = "a" * 501
    assert_not @product.valid?
  end

  test "tag should not be too long" do
    @product.tag = "a" * 101
    assert_not @product.valid?
  end

  test "price should not be too long" do
    @product.price = "a" * 21
    assert_not @product.valid?
  end

  test "quantity should not be too long" do
    @product.quantity = "a" * 21
    assert_not @product.valid?
  end

  # test "quantity should be in acceptable format" do
  #
  # end
  #
  # test "price should be in acceptable format" do
  #
  # end
end
