require 'rails_helper'

RSpec.describe Glass, type: :model do
   let!(:glass) {FactoryBot.build(:glass)}

   it 'should not be valid without lens' do
     glass.lens = nil
     expect(glass).not_to be_valid
   end


   it 'should not be valid without frame' do
     glass.frame = nil
     expect(glass).not_to be_valid
   end

   it 'should not be valid without user' do
     glass.user = nil
     expect(glass).not_to be_valid
   end

   it 'should not be valid without lens_amount' do
     glass.lens_amount = nil
     expect(glass).not_to be_valid
   end

   it 'should not be valid without frame amount' do
     glass.frames_amount = nil
     expect(glass).not_to be_valid
   end

end
