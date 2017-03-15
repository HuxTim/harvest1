# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Vendor.destroy_all

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
@first_vendor = User.first

@first_vendor.vendors.create!(description: "This is a description of me")


p "Created #{User.count} users"
p "Created #{Vendor.count} vendors"
