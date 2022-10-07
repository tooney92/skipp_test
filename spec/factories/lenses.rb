FactoryBot.define do
  factory :lens do
    color { Faker::Color.color_name }
    description { Faker::Movies::HarryPotter.quote }
    prescription_type { 1 }
    stock { 1 }
    price { 100 }
    lens_type { 1 }
  end
end
