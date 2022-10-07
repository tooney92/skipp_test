require 'rails_helper'

RSpec.describe Lens, type: :model do
  let!(:lens) {FactoryBot.build(:lens)}

  it 'is valid with all attributes provided' do
    expect(lens).to be_valid
  end

  it 'is not valid without stock' do
    lens.stock = nil
    expect(lens).not_to be_valid
  end

  it 'is not valid without description' do
    lens.description = nil
    expect(lens).not_to be_valid
  end

  it 'is not valid without color' do
    lens.color = nil
    expect(lens).not_to be_valid
  end

  it 'is not valid without price' do
    lens.price = nil
    expect(lens).not_to be_valid
  end

  it 'is not valid without lens_type' do
    lens.lens_type = nil
    expect(lens).not_to be_valid
  end

end
