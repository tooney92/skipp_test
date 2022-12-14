FactoryBot.define do
  factory :frame do
    name { Faker::Movies::HarryPotter.spell }
    description { Faker::Movies::HarryPotter.quote }
    status { 1 }
    stock { 1 }
    price { 100.0 }

    trait :active do
      after(:create) do |frame|
        frame.status = 1
        frame.save
      end
    end

    trait :inactive do
      after(:create) do |frame|
        frame.status = 0
        frame.save
      end
    end

    trait :out_of_stock do
      before(:create) do |frame|
        frame.stock = 0
      end
    end
  end
end
