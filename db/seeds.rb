  # This file should contain all the record creation needed to seed the database with its default values.
  # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
  #
  # Examples:
  #
  #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  #   Character.create(name: 'Luke', movie: movies.first)

  #If needs to be remade, should be done so that all models are made with a function call

puts "starting seeding process.."
  ProductImage.destroy_all
  StoreImage.destroy_all
  MarketImage.destroy_all
  Subscription.destroy_all
  StoreReview.destroy_all
  MarketReview.destroy_all
  ShoppingList.destroy_all
  Request.destroy_all
  StoreMarketRelationship.destroy_all
  Product.destroy_all
  Store.destroy_all
  Market.destroy_all
  Vendor.destroy_all
  User.destroy_all

puts "halfway done starting"






  firstnames = ["Abigail", "Bill", "Ike", "George", "Jake", "Christina", "Max", "Thomas", "Sarah", "Daisy", "Delila", "Rose"]
  lastnames = ["Smith", "Arrow", "House", "Levin", "Woolf", "Hunt", "Roth", "Zhang", "Amami", "Spinner-Reyes"]

  puts "creating sample users and vendors"
  i = 0
  85.times do
    name = firstnames.sample + " " + lastnames.sample
    email = name[0,3] + i.to_s  + "@gmail.com"
    @user = User.create!(name: name, email: email, zipcode: "02453", password: "123456", password_confirmation: "123456")
    if i > 28
      @vendor = Vendor.create!(user_id: @user.id)
    end
    i = i + 1
  end

  ##

  puts "creating markets"

    @users = User.offset(1)

    @user = @users.first
    name = "Central Square Farmers Market"
    description = ""
    @market = @user.markets.create!(name: name,
    city: "Cambridge",
    state: "MA",
    zipcode: "02139",
    rating: "1",
    address: "Bishop Allen Drive at Norfolk Street",
    description: @user.name + "'s Market:" + description,
    open_time: 43200,
    close_time: 64800)
    10.times do
      @user = User.offset(rand(User.count)).first
      if @user.id != @market.user_id
        MarketReview.create!(rating: [1, 2, 3, 4, 5].sample,
        comment: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
        user_id: @user.id,
        market_id: @market.id)
      end
    end

    @user = @users.second
    name = "Waltham Farmers Market"
    description = "We are in the Arthur J. Clark Government Building."
    @market = @user.markets.create!(name: name,
    city: "Waltham",
    state: "MA",
    zipcode: "02452",
    rating: "1",
    address: "119 School Street, at Lexington Street",
    description: @user.name + "'s Market:" + description,
    open_time: 5*86400+9*3600+30*60,
    close_time: 5*86400+43200+2*3600)
    10.times do
      @user = User.offset(rand(User.count)).first
      if @user.id != @market.user_id
        MarketReview.create!(rating: [1, 2, 3, 4, 5].sample,
        comment: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
        user_id: @user.id,
        market_id: @market.id)
      end
    end

    @user = @users.third
    name = "Framingham / Village Green Farmers Market"
    description = "Pay with:\nCash\nSNAP / EBT \nEBTWIC FMNP Coupons WIC\nWIC Fruit & Veg Coupons\nSeniors' Coupons\nCredit Cards"
    @market = @user.markets.create!(name: name,
    city: "Framingham",
    state: "MA",
    zipcode: "01760",
    rating: "1",
    address: "Village Green at Framingham Center",
    description: @user.name + "'s Market:" + description,
    open_time: 3*86400+43200,
    close_time: 3*86400+43200+5*3600+30*60)
    10.times do
      @user = User.offset(rand(User.count)).first
      if @user.id != @market.user_id
        MarketReview.create!(rating: [1, 2, 3, 4, 5].sample,
        comment: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
        user_id: @user.id,
        market_id: @market.id)
      end
    end

    @user = @users.fourth
    name = "Newton Farmers Market (New Cold Spring Park)"
    description = "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
    @market = @user.markets.create!(name: name,
    city: "Newton",
    state: "MA",
    zipcode: "02461",
    rating: "1",
    address: "1200 Beacon Street",
    description: @user.name + "'s Market:" + description,
    open_time: 1*86400+43200+3600+30*60,
    close_time: 1*86400+43200+3600*6)
    10.times do
      @user = User.offset(rand(User.count)).first
      if @user.id != @market.user_id
        MarketReview.create!(rating: [1, 2, 3, 4, 5].sample,
        comment: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
        user_id: @user.id,
        market_id: @market.id)
      end
    end

    @user = @users.fifth
    name = "Newton Farmers Market (Elm St)"
    description = "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
    @market = @user.markets.create!(name: name,
    city: "West Newton",
    state: "MA",
    zipcode: "02465",
    rating: "1",
    address: "Elm St.",
    description: @user.name + "'s Market:" + description,
    open_time: 5*86400+3600*10,
    close_time: 5*86400+43200+2*3600)
    10.times do
      @user = User.offset(rand(User.count)).first
      if @user.id != @market.user_id
        MarketReview.create!(rating: [1, 2, 3, 4, 5].sample,
        comment: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
        user_id: @user.id,
        market_id: @market.id)
      end
    end
  ##

  protein = [ {'name' => "Lamb Chop (Organic)", 'tags' => "Organic,Lamb,Kosher"}, {'name' => "Lamb Chop", 'tags' => "Lamb"},
    {'name' => "NY Strip", 'tags' => "Beef"}, {'name' => "Skinless Chicken Breast (Organic)", 'tags' => "Organic,Chicken,Kosher"},
    {'name' => "Skinless Chicken Breast", 'tags' => "Chicken"}, {'name' => "Ground Beef", 'tags' => "Beef,Kosher"},  {'name' => "Pork Sausage", 'tags' => "Pork"}, {'name' => "Pork Tenderloin", 'tags' => "Pork"},  {'name' => "Beef Sausage", 'tags' => "Beef,Kosher"},  {'name' => "Kielbasa", 'tags' => "Pork"},
    {'name' => "Chicken Thigh (With Skin)", 'tags' => "Chicken"},  {'name' => "Pork Shoulder", 'tags' => "Pork"},  {'name' => "Beef Chuck", 'tags' => "Beef"},  {'name' => "Sirloin Flank Steak", 'tags' => "Beef,Kosher"}, {'name' => "Chuck Steak", 'tags' => "Beef,Kosher"},  {'name' => "Chicken Quarter", 'tags' => "Chicken,Kosher"},
    {'name' => "Chicken Quarter", 'tags' => "Chicken"}, {'name' => "Skinless Chicken Breast", 'tags' => "Kosher,Chicken"}]

  seafood = [{'name' => "Tuna", 'tags' => "Seafood"}, {'name' => "Salmon", 'tags' => "Seafood"}, {'name' => "Blue Crab", 'tags' => "Seafood"},
    {'name' => "Lobster", 'tags' => "Seafood"}, {'name' => "Smoked Salmon", 'tags' => "Seafood"}, {'name' => "Abalone", 'tags' => "Seafood"}, {'name' => "Cod", 'tags' => "Seafood"},
    {'name' => "Halibut", 'tags' => "Seafood"}, {'name' => "Shrimp", 'tags' => "Seafood"}, {'name' => "Tilapia", 'tags' => "Seafood"}, {'name' => "Salmon (Organic)", 'tags' => "Seafood,Organic"},
    {'name' => "Abalone (Organic)", 'tags' => "Seafood,Organic"}, {'name' => "Tilapia (Organic)", 'tags' => "Organic,Seafood"}]

  vegetable = [ {'name' => "Orange Bell Pepper", 'tags' => ""}, {'name' => "Red Bell Pepper", 'tags' => ""},
    {'name' => "Green Bell Pepper", 'tags' => ""}, {'name' => "Cucumber", 'tags' => ""}, {'name' => "Okra", 'tags' => ""},
    {'name' => "Squash", 'tags' => ""}, {'name' => "Zucchini", 'tags' => ""}, {'name' => "Beets", 'tags' => ""},
    {'name' => "Carrots", 'tags' => ""}, {'name' => "Radishes", 'tags' => ""}, {'name' => "Turnips", 'tags' => ""},
    {'name' => "Idaho Potatoes", 'tags' => ""}, {'name' => "Sweet Potatoes", 'tags' => ""}, {'name' => "Broccoli", 'tags' => ""},
    {'name' => "Cauliflower", 'tags' => ""}, {'name' => "Vidalia Onions", 'tags' => ""}, {'name' => "Sweet Onions", 'tags' => ""},
    {'name' => "Leek", 'tags' => ""}, {'name' => "Asparagus", 'tags' => ""}, {'name' => "Cabbage", 'tags' => ""},
    {'name' => "Russet Potatoes", 'tags' => ""}, {'name' => "Celery", 'tags' => ""}, {'name' => "Ginger", 'tags' => ""},
    {'name' => "Bokchoy", 'tags' => ""}, {'name' => "Garlic", 'tags' => ""}, {'name' => "Tomatoes", 'tags' => ""},
    {'name' => "Spinach", 'tags' => ""}, {'name' => "Mint", 'tags' => ""}, {'name' => "Basil", 'tags' => ""},
    {'name' => "Corn", 'tags' => ""}, {'name' => "Portobello Mushrooms", 'tags' => ""},
    {'name' => "White Button Mushrooms", 'tags' => ""}, {'name' => "Okra", 'tags' => "Organic,Pesticide-Free"},
    {'name' => "Squash", 'tags' => "Organic"}, {'name' => "Zucchini", 'tags' => "Organic"},
    {'name' => "Sweet Onions", 'tags' => "Organic"}, {'name' => "Leek", 'tags' => "Organic,Pesticide-Free"},
    {'name' => "Asparagus", 'tags' => "Organic,Pesticide-Free"}, {'name' => "Cabbage", 'tags' => "Pesticide-Free"},
    {'name' => "Spinach", 'tags' => "Pesticide-Free"}, {'name' => "Portobello Mushrooms", 'tags' => "Pesticide-Free"}]

  fruit = [ {'name' => "Blood Orange", 'tags' => ""}, {'name' => "Mandarin Orange", 'tags' => ""},
    {'name' => "Grapefruit", 'tags' => ""}, {'name' => "Lemon", 'tags' => ""}, {'name' => "Lime", 'tags' => ""},
    {'name' => "Pineapple", 'tags' => ""}, {'name' => "Banana", 'tags' => ""}, {'name' => "Pear", 'tags' => ""},
    {'name' => "Grapes", 'tags' => ""}, {'name' => "Golden Delicious Apple", 'tags' => ""},
    {'name' => "Granny Smith Apple", 'tags' => ""}, {'name' => "Watermelon", 'tags' => ""},
    {'name' => "Blueberries", 'tags' => ""}, {'name' => "Raspberries", 'tags' => ""}, {'name' => "Strawberries", 'tags' => ""},
    {'name' => "Peach", 'tags' => ""}, {'name' => "Cherry", 'tags' => ""},
    {'name' => "Pear (Organic)", 'tags' => "Organic,Pesticide-Free"},
    {'name' => "Strawberries (Organic)", 'tags' => "Organic,Pesticide-Free"},
    {'name' => "Blueberries (Organic)", 'tags' => "Organic,Pesticide-Free"} ]

  grain = [{'name' => "White Bread", 'tags' => ""}, {'name' => "Wheat Bread", 'tags' => ""},
    {'name' => "Whole Grain bread", 'tags' => ""}, {'name' => "Rye Bread", 'tags' => ""},
    {'name' => "Asiago Bread loaf", 'tags' => ""}, {'name' => "Blueberry Bagels", 'tags' => ""},
    {'name' => "Sesame Bagels", 'tags' => ""}, {'name' => "French Bread", 'tags' => ""},
    {'name' => "Plain Bagels", 'tags' => ""}]

  honey = [{'name' => "Honey 4oz", 'tags' => "Organic"}, {'name' => "Honey 8oz", 'tags' => "Organic"},
    {'name' => "Honey 16oz", 'tags' => "Organic"}]

  coffeeBeans = [{'name' => "Geisha Columbia (12oz)", 'tags' => "Organic"},
    {'name' => "Geisha Columbia (20oz)", 'tags' => "Organic"}, {'name' => "Australian Queensland (12oz)", 'tags' => "Organic"},
    {'name' => "Bolivia Typica (12oz)", 'tags' => "Organic"}, {'name' => "Bolivia Typica (20oz)", 'tags' => "Organic"},
    {'name' => "Caturra Colombia (12oz)", 'tags' => "Organic"}, {'name' => "Caturra Colombia (20oz)", 'tags' => "Organic"},
    {'name' => "Ethiopian Sidamo (12oz)", 'tags' => "Organic"}, {'name' => "Ethiopian Sidamo (20oz)", 'tags' => "Organic"}]

  jams = [{'name' => "Marmalade (12oz)", 'tags' => "Organic"}, {'name' => "Strawberry Preserves (12oz)", 'tags' => "Organic"},
    {'name' => "Apricot Preserves (12oz)", 'tags' => "Organic"}, {'name' => "Strawberry Jam (12oz)", 'tags' => "Organic"},
    {'name' => "Grape Jelly (12oz)", 'tags' => ""}, {'name' => "Marmalade (20oz)", 'tags' => "Organic"},
    {'name' => "Strawberry Preserves (20oz)", 'tags' => "Organic"}, {'name' => "Apricot Preserves (20oz)", 'tags' => "Organic"},
    {'name' => "Strawberry Jam (20oz)", 'tags' => "Organic"}, {'name' => "Grape Jelly (20oz)", 'tags' => ""}]

  bakery = [{'name' => "Cinnamon Bun", 'tags' => ""}, {'name' => "Jelly Donut", 'tags' => ""},
    {'name' => "Boston Creme Donut", 'tags' => ""}, {'name' => "Maple Donut", 'tags' => ""},
    {'name' => "Chocolate Long John", 'tags' => ""}, {'name' => "Carrot Cake (Slice)", 'tags' => ""},
    {'name' => "Chocolate Chip Cookies (Dzn)", 'tags' => ""},
    {'name' => "Gluten-Free Chocolate Chip Cookies (Dzn)", 'tags' => "Gluten-Free"},
    {'name' => "Gluten-Free Macadamia Nut Cookies (Dzn)", 'tags' => "Gluten-Free"}]

  cheese = [{'name' => "Brie Cheese 8oz", 'tags' => ""}, {'name' => "Gruyere Cheese 8oz", 'tags' => ""},
    {'name' => "Gouda Cheese 8oz", 'tags' => ""}, {'name' => "Feta Cheese 8oz", 'tags' => ""},
    {'name' => "Cheddar Cheese", 'tags' => ""}, {'name' => "Parmesan Cheese", 'tags' => ""},
    {'name' => " Mozarella Cheese 8oz", 'tags' => ""}]

puts "Working on 3 market stores"
  vn= 0
  order = "012342104310324"

  @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Honey Store"),
  description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  vendor_id: Vendor.offset(vn).first.id)

  vn = vn +1

  honey.each do |item|
  price = "$"+((4+rand(6))*0.5).to_s+"/lb"
  Product.create!(name: item['name'],
  price: price,
  popularity: 0,
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
  tag: item['tags'],
  group: "Misc.",
  store_id: @store.id)
  end

  10.times do
    @user = User.offset(rand(User.count)).first

    StoreReview.create!(rating: [1, 2, 3, 4, 5].sample,
    comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    user_id: @user.id,
    store_id: @store.id)
  end

  3.times do
    marketid = Market.offset(order[0].to_i).first.id
    order = order[1..order.length]

    @store.store_market_relationships.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),)

    @store.requests.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),
    status: (rand() > 0.5 ? 5 : 6))
  end

  @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Coffee Beans"),
  description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  vendor_id: Vendor.offset(vn).first.id)

  vn = vn +1

  coffeeBeans.each do |item|
  price = "$"+((4+rand(6))*0.5).to_s+"/lb"
  Product.create!(name: item['name'],
  price: price,
  popularity: 0,
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
  tag: item['tags'],
  group: "Misc.",
  store_id: @store.id)
  end

  10.times do
    @user = User.offset(rand(User.count)).first

    StoreReview.create!(rating: [1, 2, 3, 4, 5].sample,
    comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    user_id: @user.id,
    store_id: @store.id)
  end

  3.times do
    marketid = Market.offset(order[0].to_i).first.id
    order = order[1..order.length]

    @store.store_market_relationships.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),)

    @store.requests.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),
    status: (rand() > 0.5 ? 5 : 6))
  end

  @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Jam Stand"),
  description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  vendor_id: Vendor.offset(vn).first.id)

  vn = vn +1

  jams.each do |item|
  price = "$"+((4+rand(6))*0.5).to_s+"/lb"
  Product.create!(name: item['name'],
  price: price,
  popularity: 0,
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
  tag: item['tags'],
  group: "Misc.",
  store_id: @store.id)
  end

  10.times do
    @user = User.offset(rand(User.count)).first

    StoreReview.create!(rating: [1, 2, 3, 4, 5].sample,
    comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    user_id: @user.id,
    store_id: @store.id)
  end

  3.times do
    marketid = Market.offset(order[0].to_i).first.id
    order = order[1..order.length]

    @store.store_market_relationships.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),)

    @store.requests.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),
    status: (rand() > 0.5 ? 5 : 6))
  end

  @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Cheese Shop"),
  description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  vendor_id: Vendor.offset(vn).first.id)

  vn = vn + 1

  cheese.each do |item|
  price = "$"+((4+rand(6))*0.5).to_s+"/lb"
  Product.create!(name: item['name'],
  price: price,
  popularity: 0,
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
  tag: item['tags'],
  group: "Misc.",
  store_id: @store.id)
  end

  10.times do
    @user = User.offset(rand(User.count)).first

    StoreReview.create!(rating: [1, 2, 3, 4, 5].sample,
    comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    user_id: @user.id,
    store_id: @store.id)
  end

  3.times do
    marketid = Market.offset(order[0].to_i).first.id
    order = order[1..order.length]

    @store.store_market_relationships.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),)

    @store.requests.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),
    status: (rand() > 0.5 ? 5 : 6))
  end


  @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Baked Goods"),
  description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  vendor_id: Vendor.offset(vn).first.id)

  vn = vn + 1

  bakery.each do |item|
  price = "$"+((4+rand(6))*0.5).to_s+"/lb"
  Product.create!(name: item['name'],
  price: price,
  popularity: 0,
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
  tag: item['tags'],
  group: "Misc.",
  store_id: @store.id)
  end

  10.times do
    @user = User.offset(rand(User.count)).first

    StoreReview.create!(rating: [1, 2, 3, 4, 5].sample,
    comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    user_id: @user.id,
    store_id: @store.id)
  end

  3.times do
    marketid = Market.offset(order[0].to_i).first.id
    order = order[1..order.length]

    @store.store_market_relationships.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),)

    @store.requests.create!(market_id: marketid,
    open_time: Market.find(marketid).open_time+1800*rand(3),
    close_time: Market.find(marketid).close_time-1800*rand(3),
    status: (rand() > 0.5 ? 5 : 6))

  end

puts "Working on 2 market stores"
  order = "42321004212314023421"

  10.times do
    @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Stand"),
    description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    vendor_id: Vendor.offset(vn).first.id)

    vn = vn + 1

    (rand(4)+6).times do
    price = "$"+((4+rand(6))*0.5).to_s+"/lb"
    item = vegetable.sample
    Product.create!(name: item['name'],
    price: price,
    popularity: 0,
    description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
    tag: item['tags'],
    group: "Vegetable",
    store_id: @store.id)
    end

    (rand(4)+6).times do
    price = "$"+((4+rand(6))*0.5).to_s+"/lb"
    item = fruit.sample
    Product.create!(name: item['name'],
    price: price,
    popularity: 0,
    description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
    tag: item['tags'],
    group: "Fruit",
    store_id: @store.id)
    end

    (8+rand(5)).times do
      @user = User.offset(rand(User.count)).first
      StoreReview.create!(rating: [1, 2, 3, 4, 5].sample,
      comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      user_id: @user.id,
      store_id: @store.id)
    end

    2.times do
      marketid = Market.offset(order[0].to_i).first.id
      order = order[1..order.length]

      @store.store_market_relationships.create!(market_id: marketid,
      open_time: Market.find(marketid).open_time+1800*rand(3),
      close_time: Market.find(marketid).close_time-1800*rand(3),)

      @store.requests.create!(market_id: marketid,
      open_time: Market.find(marketid).open_time+1800*rand(3),
      close_time: Market.find(marketid).close_time-1800*rand(3),
      status: (rand() > 0.5 ? 5 : 6))
    end
  end

puts "working on the last single market stores"
(Vendor.count-vn).times do
  if rand > 0.8 #Meat
    @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Meats"),
    description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    vendor_id: Vendor.offset(vn).first.id)

    (rand(4)+6).times do
    price = "$"+((4+rand(6))*0.5).to_s+"/lb"
    item = protein.sample
    Product.create!(name: item['name'],
    price: price,
    popularity: 0,
    description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
    tag: item['tags'],
    group: "Meat",
    store_id: @store.id)
    end

  else
    if rand > 0.75 #Seafood
      @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Seafood Shop"),
      description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
      vendor_id: Vendor.offset(vn).first.id)

      (rand(4)+6).times do
      price = "$"+((4+rand(6))*0.5).to_s+"/lb"
      item = seafood.sample
      Product.create!(name: item['name'],
      price: price,
      popularity: 0,
      description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
      tag: item['tags'],
      group: "Meat",
      store_id: @store.id)
      end

    else
      if rand > 0.66 #Vegetable
        @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Vegetable Stand"),
        description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
        vendor_id: Vendor.offset(vn).first.id)

        (rand(4)+6).times do
        price = "$"+((4+rand(6))*0.5).to_s+"/lb"
        item = vegetable.sample
        Product.create!(name: item['name'],
        price: price,
        description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
        tag: item['tags'],
        group: "Vegetable",
        store_id: @store.id)
        end
      else
          if rand > 0.5#Fruit
            @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Fruit Stand"),
            description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
            vendor_id: Vendor.offset(vn).first.id)

            (rand(4)+6).times do
            price = "$"+((4+rand(6))*0.5).to_s+"/lb"
            item = fruit.sample
            Product.create!(name: item['name'],
            price: price,
            popularity: 0,
            description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
            tag: item['tags'],
            group: "Fruit",
            store_id: @store.id)
            end
          else
            @store = Store.create!(name: (Vendor.offset(vn).first.user.name + "'s Bakery"),
            description: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
            vendor_id: Vendor.offset(vn).first.id)

            (rand(4)+6).times do
            price = "$"+((4+rand(6))*0.5).to_s+"/lb"
            item = grain.sample
            Product.create!(name: item['name'],
            price: price,
            description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
            tag: item['tags'],
            group: "Grain",
            store_id: @store.id)
          end
        end
      end
    end
  end

  marketid = Market.offset(rand(5)).first.id

  @store.store_market_relationships.create!(market_id: marketid,
  open_time: Market.find(marketid).open_time+1800*rand(3),
  close_time: Market.find(marketid).close_time-1800*rand(3),)

  @store.requests.create!(market_id: marketid,
  open_time: Market.find(marketid).open_time+1800*rand(3),
  close_time: Market.find(marketid).close_time-1800*rand(3),
  status: (rand() > 0.5 ? 5 : 6))
end


  p "Created #{User.count} users"
  p "Created #{Market.count} markets"
  p "Created #{Vendor.count} vendors"
  p "Created #{Store.count} stores"
  p "Created #{Product.count} products"
