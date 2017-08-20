# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Segment.delete_all

30.times do
  Segment.create(name: Faker::Book.title, body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
end
