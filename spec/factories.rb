FactoryBot.define do

  factory :artist do
    name { Faker::Name.name }
  end

  factory :record do
    title { Faker::Lorem.sentence }
    year { Faker::Number.number(digits: 4) }
    condition { 'mint' }
  end

  factory :artist_record_association do
    artist
    record
  end
end
