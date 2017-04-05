# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Vendor.destroy_all
Market.destroy_all
Store.destroy_all
Product.destroy_all
MarketReview.destroy_all
StoreReview.destroy_all

firstnames = ["Abigail", "Bill", "Ike", "George", "Jake", "Christina", "Max", "Thomas", "Sarah", "Daisy", "Delila", "Rose"]
lastnames = ["Smith", "Arrow", "House", "Levin", "Woolf", "Hunt", "Roth", "Zhang", "Amami", "Spinner-Reyes"]

puts "creating sample users"
puts "creating vendors"
i = 0
50.times  do
  name = firstnames.sample + " " + lastnames.sample
  email = name[0,3] + i.to_s  + "@gmail.com"
  @user = User.create!(name: name, email: email, zipcode: "02453", city: "Waltham", state: "MA", password: "123456", password_confirmation: "123456")
  if rand() > 0.5
    @vendor = @user.vendors.new()
    @vendor.save()
  end
  i = i + 1
end

adjectives = ["active", "fun", "exciting", "refreshing"]
puts "creating markets"
2.times do
  @user = User.offset(rand(User.count)).first
  name = @user.name + "'s Market"
  description = "a " + adjectives.sample + " market"
  @market = @user.markets.create!(name: name,
  city: "Waltham",
  state: "MA",
  zipcode: "02453",
  rating: "1",
  address: "415 South St",
  description: description,
  open_time: 0,
  close_time: 3600)

  10.times do
    @user = User.offset(rand(User.count)).first
    if @user.id != @market.user_id
      MarketReview.create!(rating: [1, 2, 3, 4, 5].sample,
      comment: i.to_s + "test review",
      user_id: @user.id,
      market_id: @market.id)
    end
  end
end

products = ["Bread", "Pastas", "Vegetable", "Meats", "Cheese", "Milk"]
adjectives = ["Fresh", "Red", "Gluten-free", "Nike", "Moldy"]
puts "creating stores"
Vendor.all.each do |vendor|

  marketid = rand() > 0.5 ? Market.all.first.id : Market.all.offset(1).first.id
  product = products.sample

  name = @user.name + "'s " + product + " Shop"

  @store = vendor.stores.create!(name: name,
  description: "test store",
  open_time: 0,
  close_time: 3600,
  market_id: marketid)

  name = adjectives.sample + " " + product
  Product.create!(name: name,
  price: "$4.00/lb",
  description: "test product ",
  tag: "gluten free, soy-free",
  store_id: @store.id)
  10.times do
    @user = User.offset(rand(User.count)).first
    product = products.sample
    StoreReview.create!(rating: [1, 2, 3, 4, 5].sample,
    comment: "test store review",
    user_id: @user.id,
    store_id: @store.id)
  end
end

p "Created #{User.count} users"
p "Created #{Market.count} markets"
p "Created #{Vendor.count} vendors"
p "Created #{Store.count} stores"
p "Created #{Product.count} products"
