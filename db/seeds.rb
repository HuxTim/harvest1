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

User.create!([{
  name: "John Smith",
  email: "John@example.com",
  zipcode: "02453",
  city: "Waltham",
  state: "MA",
  password: "123456",
  password_confirmation: "123456"
# },
# {
#   name: "Captain Ahab",
#   email: "illgetthatwhale@trustme.com",
#   zipcode: "34099",
#   city: "San Francisco"
#   password_digest: "ihatewhales"
# },
# {
#   name: "Bugs Bunny",
#   email: "whatsupdoc@bunny.com",
#   zipcode: "91203",
#   city: "Boston"
#   password_digest: "ilovecarrots"
}])

@first_market = Market.create!(name: "John's Market",
                               city: "Waltham",
                              state: "MA",
                              zipcode: "02453",
                              rating: "1",
                              description:"a nice market A market is one of the many varieties of systems, institutions, procedures, social relations and infrastructures whereby parties engage in exchange. Wikipedia",
                              open_time: 0,
                              close_time: 3600)

@first_user = User.first

@first_vendor = @first_user.vendors.create!(description: "This is a description of me")

# Store.create(vendor_railid: @vendor.id)
@first_store = Store.create!(name: "John's Bread",
                                                    description: "delicious bread",
                                                    open_time: 0,
                                                    close_time: 3600,
                                                    vendor_id: @first_vendor.id,
                                                    market_id: @first_market.id)

(0..20).each do |i|
  Store.create!(name: "John's Bread",
                description: i.to_s + "A they've checked out your screenshots and are still interested, until they come to your drab App Store description when they hit the back button and go to download your competitor's app.",
                open_time: 0,
                close_time: 3600,
                vendor_id: @first_vendor.id,
                market_id: @first_market.id)

  Review.create!(rating: 3,
                description: i.to_s + " is a review for test!A potential customer has liked your icon enough to tap through, they've checked out your screenshots and are still interested, until they come to your drab App Store description when ",
                user_id: @first_user.id,
                market_id: @first_market.id)
end

@first_product = Product.create!(name: "Bread",
                                 quantity: "10",
                                 price: "$4.00/lb",
                                 description: "delicious bread",
                                 tag: "gluten free, soy-free",
                                 store_id: @first_store.id)


p "Created #{User.count} users"
p "Created #{Market.count} markets"
p "Created #{Vendor.count} vendors"
p "Created #{Store.count} stores"
p "Created #{Product.count} products"
