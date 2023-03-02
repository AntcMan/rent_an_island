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
  photo = URI.open("https://source.unsplash.com/random/1920x1080/?island")
  user = User.all.sample
  suffixes = ["Quiet Cove", "Paradise Island", "Secluded Resort", "Tropical Retreat", "Exotic Oasis", "Sandy Shores", "Beachside Bungalow", "Isolated Haven", "Island Escape", "Remote Hideaway"]
  name = "#{user.first_name}'s #{suffixes.sample}"
  capacity = (10..100).to_a.sample
  location = Faker::Fantasy::Tolkien.location
  price = (10000..100000).to_a.sample
  island_descriptions = ["A tropical paradise with stunning beaches, lush forests, and vibrant nightlife.", "An island with a buzzing party scene, beautiful beaches, and plenty of water sports.", "A laid-back island with gorgeous beaches, natural beauty, and a relaxed vibe.", "with crystal-clear waters, white-sand beaches, and a strong cultural heritage.", "with some of the most beautiful beaches and waters in the world, perfect for diving and snorkeling.", "An island nation with stunning beaches, lush rainforests, and a unique Melanesian culture.", "You are close to a group of 15 islands with turquoise waters, white sand beaches, and a relaxed Polynesian vibe.", "An archipelago with coral reefs, clear waters, and French-influenced cuisine and culture.", "A UNESCO World Heritage site with breathtaking natural beauty, stunning beaches, and diverse wildlife.", "with white sand beaches, clear waters, and a range of outdoor activities."]

  description = island_descriptions.sample
  # description = Faker::Lorem.sentences(number: 5).join(" ")
    attributes_hash = {
    name: name,
    capacity: capacity,
    description: description,
    location: location,
    price: price,
    user_id: user.id,
    # availability: ([true, false].sample)
  }

  new_island = Island.new(attributes_hash)
  new_island.photo.attach(io: photo, filename: "#{i}.jpg", content_type: "image/jpg")
  new_island.save
  puts "created island"
end

p "10 islands created"

rails g availabilityValidator
