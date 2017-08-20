FactoryGirl.define do
  factory :segment do
    name { Faker::Book.title }
    body { Faker::Lorem.paragraphs(rand(1..5), true) }
    latitude { 41.876116499999995 }
    longitude { -87.6530416 }
  end
end
