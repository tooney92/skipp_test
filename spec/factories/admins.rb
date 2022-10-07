FactoryBot.define do
  factory :admin do
    user { FactoryBot.create(:user) }
  end
end
