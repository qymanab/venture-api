# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Segment.destroy_all
Genre.destroy_all

adventure = Genre.create(name: "adventure")
fiction = Genre.create(name: "fiction")
nonfiction = Genre.create(name: "non-fiction")
horror = Genre.create(name: "horror")
comedy = Genre.create(name: "comedy")
romance = Genre.create(name: "romance")
other = Genre.create(name: "other")



# 5.times do
#   s = Segment.create(name: title_from.sample, body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
#   s.genres << Genre.all.sample
# end


j = Segment.create(name:'The John Hancock Horror' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8988' , longitude: '-87.6229')

w = Segment.create(name:'What you talkin\' bout Willis tower?' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8789' , longitude: '-87.6359')

n = Segment.create(name:'Batman vs The Napervillans' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.7508' , longitude: '-88.1535')

g = Segment.create(name:'We found love at Grant Park' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8722' , longitude: '-87.6188')

a = Segment.create(name:'Where am I!?' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.80' , longitude: '-87.27')

jimmy = Segment.create(name:'My perfect Jimmy John\'s cookie' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876887' , longitude: '-87.648035')

j.genres << horror
w.genres << comedy
n.genres << fiction
g.genres << romance
a.genres << adventure
jimmy.genres << nonfiction

#
# adventure.segments << Segment.new(name:'Chair' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876116499999995' , longitude: '-87.6530416' )
# adventure. segments << Segment.new(name:'couch' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8761018' , longitude: '-87.6529906' )
# fiction.segments << Segment.new(name:'Metis Logo' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876445499999996' , longitude: '-87.65302489999999' )
# nonfiction.segments << Segment.new(name: 'Breakout Room', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876382299999996' , longitude: '-87.653041' )
# horror.segments << Segment.new(name:'Yoda Quote', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763582' , longitude: '-87.6530538' )
# comedy.segments << Segment.new(name:'Kelly Desk', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876419999999996' , longitude: '-87.65305359999999' )
# romance.segments << Segment.new(name:'firt row', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763736' , longitude: '-87.6530294' )
# other.segments << Segment.new(name:'storage', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763736' , longitude: '-87.6530361' )
# horror.segments << Segment.new(name:'office', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876161599999996' , longitude: '-87.6530372' )
