FactoryBot.define do
  factory :glass do
    user { FactoryBot.create(:user) }
    frame { FactoryBot.create(:frame) }
    lens { FactoryBot.create(:lens) }
  end
end
