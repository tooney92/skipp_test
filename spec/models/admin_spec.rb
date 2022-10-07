require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) {FactoryBot.build(:admin)}

  it 'should be valid when user is sent' do
    expect(admin).to be_valid
  end

  it 'should not be valid without user' do
    admin.user = nil
    expect(admin).not_to be_valid
  end

end
