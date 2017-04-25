require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @market = Market.all.first
    @store =  @market.stores.all.first
    @user = User.all.first
    @review = Review.new(user_id: @user.id, market_id: @market.id, store_id: @store.id, rating: "5", description: "this is a example review", rating: 0)
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "rating should be present" do
    @review.rating = ""
    assert_not @review.valid?
  end

  test "store id should be present" do
    @review.store_id = ""
    assert_not @review.valid?
  end

  test "market id should be present" do
    @review.market_id = ""
    assert_not @review.valid?
  end

  test "user id should be present" do
    @review.user_id = ""
    assert_not @review.valid?
  end

  test "description should not be to long" do
    @review.description = "a" * 251
    assert_not @review.valid?
  end

  test "rating should be postive" do
    @review.rating = -1
    assert_not @review.valid?
  end

  test "rating should be less than 5" do
    @review.rating = 6
    assert_not @review.valid?
  end

  # test "rating should more than or equal to 0" do
  #
  # end
  #
  # test "rating should be less or equal to 10" do
  #
  # end

end
