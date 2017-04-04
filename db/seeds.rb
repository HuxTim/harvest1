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

<<<<<<< HEAD
firstnames = ["Abigail", "Bill", "Ike", "George", "Jake", "Christina", "Max", "Thomas", "Sarah", "Daisy", "Delila", "Rose"]
lastnames = ["Smith", "Arrow", "House", "Levin", "Woolf", "Hunt", "Roth", "Zhang", "Amami", "Spinner-Reyes"]

puts "creating sample users"
puts "creating vendors"
50.times do
	name = firstnames.sample + " " + lastnames.sample
	email = name + "@gmail.com"
	@user = User.create(name: name, email: email, zipcode: "02453", city: "Waltham", state: "MA", password: "123456", password_confirmation: "123456")
	if rand() > .5 
	@user.vendors.create!()
	end
end

adjectives = ["active", "fun", "exciting", "refreshing"]
puts "creating markets"
2.times do
	offset = rand(User.count)
	@user = Users.first(:offset => offset)
	name = @user.name + "'s Market"
	description = "a " + adjectives.sample + " market"
	@market = Market.create!(name: name,
                              city: "Waltham",
                              state: "MA",
                              zipcode: "02453",
                              rating: "-1",
			      address: "415 South St"
                              description: description,
				open_time: 0,
                              close_time: 3600)

	10.times do
		offset = rand(User.count)
		@user = Users.first(:offset => offset)
		if @user.id != @market.user_id
		  	MarketReview.create!(rating: [1, 2, 3, 4, 5].sample,
		        comment: i.to_s + "test review",
		        user_id: @user.id,
		        market_id: @market.id)
		end
	end
end

vendorid = 0
products = ["Bread", "Pastas", "Vegetable", "Meats", "Cheese", "Milk"]
adjectives = ["Fresh", "Red", "Gluten-free", "Nike", "Moldy"]
puts "creating stores"
(Vendor.count).times do
	vendorid += 1
	marketid = rand() > .5 ? 1 : 2
	offset = rand(User.count)
	
	name = @user.name + "'s " + product + " Shop"

	  @store = Store.create!(name: name,
                description: "test store"
                open_time: 0,
                close_time: 3600,
                vendor_id: vendorid,
                market_id: 0)
	  
	Product.create!(name: "Bread",
                 price: "$4.00/lb",
                 description: i.to_s + "test product ",
                 tag: "gluten free, soy-free",
                 store_id: @store.id)

	@user = Users.first(:offset => offset)
	product = products.sample
  	StoreReview.create!(rating: [1, 2, 3, 4, 5].sample,
                comment: i.to_s + "test store review",
                user_id: @first_user.id,
                store_id: @store.id)
end

p "Created #{User.count} users"
p "Created #{Market.count} markets"
p "Created #{Vendor.count} vendors"
p "Created #{Store.count} stores"
p "Created #{Product.count} products"
