require 'rails_helper'

RSpec.describe "Api::V1::Frames", type: :request do
  let!(:normal_user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:user, :as_admin) }
  let(:normal_user_token) { user_login(normal_user) }
  let(:admin_user_token) { user_login(admin_user) }


  context 'Frames Authentication' do

    it 'should not allow normal user create frames' do

      post '/api/v1/frames', params: {
        frame: {
          name: Faker::Movies::HarryPotter.spell,
          description: Faker::Movies::HarryPotter.quote,
          status: 1,
          stock: 1,
          price: 9.99
        }
      }, headers: { 'Authorization' => normal_user_token }, xhr: true
      expect(response.status).to eq(401)

    end

    it 'should allow admin create frames' do

      post '/api/v1/frames', params: {
        frame: {
          name: Faker::Movies::HarryPotter.spell,
          description: Faker::Movies::HarryPotter.quote,
          status: "active",
          stock: 1,
          price: 9.99
        }
      }, headers: { 'Authorization' => admin_user_token }, xhr: true

      expect(response).to have_http_status(:created)

    end

  end

  context 'GET /api/v1/frames' do


    it "should fetch only active frames" do

      FactoryBot.create_list(:frame, 5, :active)
      FactoryBot.create_list(:frame, 5, :inactive)

      get '/api/v1/frames?page=1&currency=GBP', headers: { 'Authorization' => normal_user_token }, xhr: true
      json = JSON.parse(response.body)
      expect(json['frames'].size).to eq(5)
    end

    context 'prices based on user currency' do

      before(:all) do
        FactoryBot.create(:frame)
      end

      after(:all) do
        Frame.destroy_all
      end

      it "should fetch frames with GBP rate" do
        get '/api/v1/frames?page=1&currency=GBP', headers: { 'Authorization' => normal_user_token }, xhr: true
        json = JSON.parse(response.body)
        lens_price = json['frames'][0]['price']
        expect(lens_price).to eq(87.81)
      end

      it "should fetch only frames with USD rate" do
        get '/api/v1/frames?page=1&currency=USD', headers: { 'Authorization' => normal_user_token }, xhr: true
        json = JSON.parse(response.body)
        lens_price = json['frames'][0]['price']
        expect(lens_price).to eq(97.98)
      end


      it "should fetch only frames with JOD rate" do
        get '/api/v1/frames?page=1&currency=JOD', headers: { 'Authorization' => normal_user_token }, xhr: true
        json = JSON.parse(response.body)
        lens_price = json['frames'][0]['price']
        expect(lens_price).to eq(69.48)
      end

      it "should fetch only frames with JPY rate" do
        get '/api/v1/frames?page=1&currency=JPY', headers: { 'Authorization' => normal_user_token }, xhr: true
        json = JSON.parse(response.body)
        lens_price = json['frames'][0]['price']
        expect(lens_price).to eq(14207.0)
      end



    end

  end


end
