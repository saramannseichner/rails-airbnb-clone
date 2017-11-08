# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Artwork.destroy_all

puts "Creating artworks..."
attributes = [
  [
    {
      name: "The Cliff",
      medium: "Photograph",
      height: 2,
      width: 2,
      description: "A beautiful cliff taken during my trip to Colombia.",
      address: "125 Rue Elmire",
      user_id: 1,
      price: 1000
    },
    "https://picsum.photos/400/300/?random"
  ]
]

attributes.each do |attr|
  artwork = Artwork.new(attr[0])
  artwork.save!
  artwork.photo_url = attr[1]
end

puts "Finished!"
