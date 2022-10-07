require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {FactoryBot.build(:user)}


  it 'should be valid when email and password is sent' do
    expect(user).to be_valid
  end

  it 'should not be valid without email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'should not be valid without password' do
    user.password = nil
    expect(user).not_to be_valid
  end
end
