require 'rails_helper'

RSpec.describe Frame, type: :model do
  let!(:frame) {FactoryBot.build(:frame)}

  it 'is valid with all attributes provided' do
    expect(frame).to be_valid
  end
  
  it 'is not valid without description' do
    frame.description = nil
    expect(frame).not_to be_valid
  end

  it 'is not valid without status' do
    frame.status = nil
    expect(frame).not_to be_valid
  end

  it 'is not valid without stock' do
    frame.stock = nil
    expect(frame).not_to be_valid
  end

  it 'is not valid without price' do
    frame.price = nil
    expect(frame).not_to be_valid
  end

  it 'is not valid without name' do
    frame.name = nil
    expect(frame).not_to be_valid
  end
end
