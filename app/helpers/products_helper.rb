module ProductsHelper
  def tag_list
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

  def split_tags(tags)
    @tags_list = []
    if tags
      @tags_list = tags.split(",")
    end
    return @tags_list
  end

  def unit_list
    units = [
      "kilograms",
      "pounds",
      "liter",
      "per unit"
    ]
  end
end
#
# product
#
# profile page for user_id
#
# subscription_and_email
#
# search_function
#
# shopping_lists
#
# log with api
#
# authenticate vendor/user
#
# change database scheme
# 1.delete message table
# 2.add store_market store_id market_id opentime closetime
# 3.add application(store_id, market_id, status)
# 4. remove store_id, opentime, closetime, address,
