FactoryBot.define do
  factory :lens do
    color { Faker::Color.color_name }
    description { Faker::Movies::HarryPotter.quote }
    prescription_type { 1 }
    stock { 1 }
    price { 48 }
    lens_type { 1 }

    trait :out_of_stock do
      before(:create) do |lens|
        lens.stock = 0
      end
    end
  end
end
