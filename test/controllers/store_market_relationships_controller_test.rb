require 'test_helper'

class StoreMarketRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_market_relationship = store_market_relationships(:one)
  end

  test "should get index" do
    get store_market_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_store_market_relationship_url
    assert_response :success
  end

  test "should create store_market_relationship" do
    assert_difference('StoreMarketRelationship.count') do
      post store_market_relationships_url, params: { store_market_relationship: {  } }
    end

    assert_redirected_to store_market_relationship_url(StoreMarketRelationship.last)
  end

  test "should show store_market_relationship" do
    get store_market_relationship_url(@store_market_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_market_relationship_url(@store_market_relationship)
    assert_response :success
  end

  test "should update store_market_relationship" do
    patch store_market_relationship_url(@store_market_relationship), params: { store_market_relationship: {  } }
    assert_redirected_to store_market_relationship_url(@store_market_relationship)
  end

  test "should destroy store_market_relationship" do
    assert_difference('StoreMarketRelationship.count', -1) do
      delete store_market_relationship_url(@store_market_relationship)
    end

    assert_redirected_to store_market_relationships_url
  end
end
