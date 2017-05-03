module ProductsHelper
  def tag_list
    tags = [
      "Beef",
      "Pork",
      "Lamb",
      "Chicken",
      "Organic",
      "Kosher",
      "Seafood",
      "Pesticide-Free",
      "Gluten-Free"
      # "vegetable",
      # "meat",
      # "fish",
      # "fruit",
      # "drink",
      # "bread",
      # "beef",
      # "lamb",
      # "chicken",
      # "fresh"
    ]
  end

  def tag_color
    tags = {
      "Beef" => "#4d75b7",
      "Pork" => "#603248",
      "Lamb" => "#99705a",
      "Chicken" => "#c6c471",
      "Organic" => "#76895a",
      "Kosher" => "#6b5672",
      "Seafood" => "#753b50",
      "Pesticide-Free" => "#48717c",
      "Gluten-Free" => "#639679"
    }
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

  def group_list
    groups = [
      "Meat",
      "Vegetable",
      "Fruit",
      "Grain",
      "Misc."
    ]
  end

  def product_background
    backgrounds = {
      "Meat" => "/images/meat_bg.jpg",
      "Vegetable" => "/images/vegetable_bg.jpg",
      "Fruit" => "/images/fruit_bg.jpg",
      "Grain" => "/images/grain_bg.jpg",
      "Misc." => "/images/misc_bg.jpg"
    }
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
