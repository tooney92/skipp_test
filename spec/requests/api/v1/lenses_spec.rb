require 'rails_helper'

RSpec.describe "Api::V1::Lenses", type: :request do
  let!(:normal_user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:user, :as_admin) }
  let(:normal_user_token) { user_login(normal_user) }
  let(:admin_user_token) { user_login(admin_user) }


  context 'Frames Authentication' do

    it 'should not allow normal user create lenses' do

      post '/api/v1/lenses', params: {
        lenses: {
          color: Faker::Color.color_name,
          description: Faker::Movies::HarryPotter.quote,
          prescription_type: 1,
          stock: 1,
          price: Faker::Number.decimal(l_digits: 2),
          lens_type: 1
        }
      }, headers: { 'Authorization' => normal_user_token }

      expect(response.status).to eq(401)

    end

    it 'should allow admin create lenses' do

      post '/api/v1/lenses', params: {
        lens: {
          color: Faker::Color.color_name,
          description: Faker::Movies::HarryPotter.quote,
          prescription_type: "fashion",
          stock: 1,
          price: Faker::Number.decimal(l_digits: 2),
          lens_type: "classic"
        }
      }, headers: { 'Authorization' => admin_user_token }, xhr: true

      json = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json['lens'].keys).to contain_exactly(
        'color',
        'description',
        'prescription_type',
        'stock',
        'price',
        'lens_type',
        'id'
      )

    end

  end

  context 'prices based on user currency' do

    before(:all) do
      Lens.create({
                    "color": "pink",
                    "description": "demo",
                    "prescription_type": 1,
                    "stock": 1,
                    "price": 100.00,
                    "lens_type": 1
                  })
    end

    after(:all) do
      Lens.destroy_all
    end

    it "should fetch lenses with GBP rate of 87.79 for user with GBP currency" do
      get '/api/v1/lenses?page=1&currency=GBP', headers: { 'Authorization' => normal_user_token }, xhr: true
      json = JSON.parse(response.body)
      lens_price = json['lenses'][0]['price']
      expect(lens_price).to eq(87.79)
    end

    it "should fetch only lenses with USD rate of" do
      get '/api/v1/lenses?page=1&currency=USD', headers: { 'Authorization' => normal_user_token }, xhr: true
      json = JSON.parse(response.body)
      lens_price = json['lenses'][0]['price']
      expect(lens_price).to eq(97.98)
    end


    it "should fetch only lenses with JOD rate of" do
      get '/api/v1/lenses?page=1&currency=JOD', headers: { 'Authorization' => normal_user_token }, xhr: true
      json = JSON.parse(response.body)
      lens_price = json['lenses'][0]['price']
      expect(lens_price).to eq(69.48)
    end

    it "should fetch only lenses with JPY rate of" do
      get '/api/v1/lenses?page=1&currency=JPY', headers: { 'Authorization' => normal_user_token }, xhr: true
      json = JSON.parse(response.body)
      lens_price = json['lenses'][0]['price']
      expect(lens_price).to eq(14207.0)
    end



  end
end
