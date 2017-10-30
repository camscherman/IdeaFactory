FactoryGirl.define do
  factory :idea do
    title {Faker::MostInterestingManInTheWorld.quote }
    description {Faker::Lorem.paragraph}
  end
end
