FactoryGirl.define do
  factory :idea do
    association :user, factory: :user
    title {Faker::MostInterestingManInTheWorld.quote }
    description {Faker::Lorem.paragraph}

  end
end
