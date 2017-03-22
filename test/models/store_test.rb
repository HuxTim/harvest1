require 'test_helper'
require "minitest/autorun"

class StoreTest < ActiveSupport::TestCase
  def setup
    puts "this modification is for test"
    @store = Store.new(description: "Example Description", open_time: "8:00am", close_time: "6:00pm")
  end

  test "should be valid" do
    assert @store.valid?
  end

  test "name should be present" do
    @store.description = ""
    assert_not @store.valid?
  end

  test "email should be present" do
    @store.description = "     "
    assert_not @store.valid?
  end

  describe Store do
    before do
      @store = Store.new(description: "Example Description", open_time: "8:00am", close_time: "6:00pm")
    end

    it "has non-empty description" do
      @store.description.wont_equal ""
    end

    it "has non-empty open_time" do
      @store.open_time.wont_equal ""
    end

    it "has non-empty close_time" do
      @store.close_time.wont_equal ""
    end
  end
end
