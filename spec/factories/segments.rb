FactoryGirl.define do
  factory :segment do
    name { Faker::Book.title }
    body { Faker::Lorem.paragraphs(rand(1..5), true) }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
