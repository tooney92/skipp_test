FactoryBot.define do
  factory :user do
    email { "#{Faker::Name.first_name}_#{Faker::Name.last_name}@demo.com" }
    password { "12345678" }

    trait :as_admin do
      after(:create) do |user|
        Admin.create(
          {
            user: user
          }
        )
      end
    end
  end
end
