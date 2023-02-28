

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Removing islands and users..."
Island.destroy_all
User.destroy_all
p "All islands removed ..."

p "Creating 10 islands ..."
10.times {
  #create a user and save to database
  person = (Faker::Fantasy::Tolkien.character)
  email = "#{person.gsub(" ","_")}@gmail.com"
  user = User.create(email:, password:"password")

  #create an island
  suffixes = ["secondary home", "island", "coconuts", "resort", "retreat"]
  name = "#{person}'s #{suffixes.sample}"
  capacity = (10..100).to_a.sample
  description = Faker::Lorem.sentences(number: 5).join(" ")
  location = Faker::Fantasy::Tolkien.location
  price = (10000..100000).to_a.sample
  attributes_hash = {
    name: name,
    capacity: capacity,
    description: description,
    location: location,
    price: price,
    user_id: user.id
  }
  new_island = Island.create(attributes_hash)
}

p "10 islands created"
