require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  def setup
    @store = Store.all.first
  end

  test "should be valid" do
    assert @store.valid?
  end

  test "name should be present" do
    @store.name = ""
    assert_not @store.valid?
  end

  test "vendor id should be present" do
      @store.vendor_id = ""
      assert_not @store.valid?
  end

  test "name should not be too long" do
    @store.name = "a" * 51
    assert_not @store.valid?
  end

  test "description should not be too long" do
    @store.description = "a" * 251
    assert_not @store.valid?
  end

  test "open time should more than 0" do
    @store.open_time = -1
    assert_not @store.valid?
  end

  test "close time should more than 0" do
    @store.close_time = -1
    assert_not @store.valid?
  end

  test "close time should less than 604800" do
    @store.close_time = 604801
    assert_not @store.valid?
  end

  test "open time must earlier than close time" do
    @store.open_time = 1
    @store.close_time = 0
    assert_not @store.valid?
  end
end
