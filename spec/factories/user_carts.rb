FactoryBot.define do
  factory :user_cart do
    glass { FactoryBot.create(:glass) }
    user { FactoryBot.create(:user) }
  end
end
