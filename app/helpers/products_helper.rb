module ProductsHelper
  def tag_list()
    tags = [
      "vegetable",
      "meat",
      "fish",
      "fruit",
      "drink",
      "bread",
      "beef",
      "lamb",
      "chicken",
      "fresh"
    ]
  end

  def unit_list()
    units = [
      "LB",
      "meat",
      "fish",
      "fruit",
    ]
  end
end

product

profile page for user_id

subscription_and_email

search_function

shopping_lists

log with api

authenticate vendor/user

change database scheme
1.delete message table
2.add store_market store_id market_id opentime closetime
3.add application(store_id, market_id, status)
4. remove store_id, opentime, closetime, address,
