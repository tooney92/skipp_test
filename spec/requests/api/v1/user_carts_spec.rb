require 'rails_helper'

RSpec.describe "Api::V1::UserCarts", type: :request do

  let!(:normal_user) { FactoryBot.create(:user) }
  let(:user_token) { user_login(normal_user) }


  context 'prices based on user currency' do

    before(:each) do
      lens = FactoryBot.create(:lens)
      frame = FactoryBot.create(:frame)

      post '/api/v1/glasses', params: {
        glass: {
          frame: frame.id,
          lens: lens.id
        }
      }, headers: { 'Authorization' => user_token }, xhr: true
    end

    it "should fetch lenses with GBP rate of 87.79 for user with GBP currency" do
      get '/api/v1/user_carts?currency=GBP', headers: { 'Authorization' => user_token }, xhr: true
      json = JSON.parse(response.body)
      lens_price = json['glasses'][0]['lens_price']
      frame_price = json['glasses'][0]['frame_price']
      expect(lens_price).to eq(42.15)
      expect(frame_price).to eq(87.81)
    end

    it "should fetch only lenses with USD rate of" do
      get '/api/v1/user_carts?currency=USD', headers: { 'Authorization' => user_token }, xhr: true
      json = JSON.parse(response.body)
      lens_price = json['glasses'][0]['lens_price']
      frame_price = json['glasses'][0]['frame_price']
      expect(lens_price).to eq(47.03)
      expect(frame_price).to eq(97.98)
    end


    it "should fetch only lenses with JOD rate of" do
      get '/api/v1/user_carts?currency=JOD', headers: { 'Authorization' => user_token }, xhr: true
      json = JSON.parse(response.body)
      lens_price = json['glasses'][0]['lens_price']
      frame_price = json['glasses'][0]['frame_price']
      expect(lens_price).to eq(33.35)
      expect(frame_price).to eq(69.48)
    end

    it "should fetch only lenses with JPY rate of" do
      get '/api/v1/user_carts?currency=JPY', headers: { 'Authorization' => user_token }, xhr: true
      json = JSON.parse(response.body)
      lens_price = json['glasses'][0]['lens_price']
      frame_price = json['glasses'][0]['frame_price']
      expect(lens_price).to eq(6820.0)
      expect(frame_price).to eq(14207.0)
    end

  end
end
