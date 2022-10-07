require 'rails_helper'

RSpec.describe UserCart, type: :model do
  let!(:cart) { FactoryBot.build(:user_cart) }

  it "should be valid when required fields are sent" do
    expect(cart).to be_valid
  end

  it "should not be valid without glass" do
    cart.glass = nil
    expect(cart).not_to be_valid
  end

  it "should not be valid without user" do
    cart.user = nil
    expect(cart).not_to be_valid
  end
end
