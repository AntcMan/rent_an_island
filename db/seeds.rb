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
p "All islands and users removed ..."

p "Creating users"

#create a user and save to database
names = %w(Anthony Shannaz Tan Johan)
names.each do |name|
  email = "#{name}@gmail.com"
  User.create(email:, password: "password", first_name: name)
end

p "Creating 10 islands ..."
10.times do |i|
  photo = URI.open("https://images.unsplash.com/photo-1502085671122-2d218cd434e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1526&q=80")
  #create an island
  user = User.all.sample
  suffixes = ["quit place", "island", "resort", "retreat"]
  name = "#{user.first_name.lowercase}'s #{suffixes.sample}"
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

  new_island = Island.new(attributes_hash)
  new_island.photo.attach(io: photo, filename: "#{i}.jpg", content_type: "image/jpg")
  new_island.save
  puts "created island"
end

p "10 islands created"
