require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @market = Market.all.first
    @store =  @market.stores.all.first
    @user = User.all.first
    @review = Review.create(user_id: @user.id, market_id: @market.id, store_id: @store.id, rating: "5", description: "this is a example review")
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
    @review.description = "a" * 501
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
