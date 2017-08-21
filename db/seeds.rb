# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Segment.delete_all
Genre.delete_all

# 30.times do
#   Segment.create(name: Faker::Book.title, body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
# end

Segment.create(name:'Chair' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876116499999995' , longitude: '-87.6530416' )
Segment.create(name:'couch' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8761018' , longitude: '-87.6529906' )
Segment.create(name:'Metis Logo' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876445499999996' , longitude: '-87.65302489999999' )
Segment.create(name: 'Breakout Room', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876382299999996' , longitude: '-87.653041' )
Segment.create(name:'Yoda Quote', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763582' , longitude: '-87.6530538' )
Segment.create(name:'Kelly Desk', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876419999999996' , longitude: '-87.65305359999999' )
Segment.create(name:'firt row', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763736' , longitude: '-87.6530294' )
Segment.create(name:'storage', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763736' , longitude: '-87.6530361' )
Segment.create(name:'office', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876161599999996' , longitude: '-87.6530372' )

Genre.create(name: "adventure")
Genre.create(name: "fiction")
Genre.create(name: "non-fiction")
Genre.create(name: "horror")
Genre.create(name: "comedy")
Genre.create(name: "romance")
Genre.create(name: "other")
