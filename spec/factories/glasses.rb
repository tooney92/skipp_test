FactoryBot.define do
  factory :glass do
    user { FactoryBot.create(:user) }
    frame { FactoryBot.create(:frame) }
    lens { FactoryBot.create(:lens) }
    lens_amount { 56.9 }
    frames_amount { 56.9 }
  end
end
