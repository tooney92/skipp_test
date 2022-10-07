require 'rails_helper'

RSpec.describe "Api::V1::Glasses", type: :request do
  let!(:demo_user) { FactoryBot.create(:user) }
  let(:user_token) { user_login(demo_user) }

  context 'POST api/v1/glasses' do

    it "should create glasses if frame and lens are in stock" do
      lens = FactoryBot.create(:lens)
      frame = FactoryBot.create(:frame)
      post '/api/v1/glasses', params: {
        glass: {
          frame: frame.id,
          lens: lens.id
        }
      }, headers: { 'Authorization' => user_token }, xhr: true

      expect(response.status).to eq(201)

    end

    it "should not create glasses if frame is not in stock" do
      lens = FactoryBot.create(:lens)
      frame = FactoryBot.create(:frame, :out_of_stock)

      post '/api/v1/glasses', params: {
        glass: {
          frame: frame.id,
          lens: lens.id
        }
      }, headers: { 'Authorization' => user_token }, xhr: true

      json = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(json['errors'][0]).to eq("frame out of stock. Current stock is: 0")
    end
    it "should not create glasses if lens is not in stock" do
      lens = FactoryBot.create(:lens, :out_of_stock)
      frame = FactoryBot.create(:frame)

      post '/api/v1/glasses', params: {
        glass: {
          frame: frame.id,
          lens: lens.id
        }
      }, headers: { 'Authorization' => user_token }, xhr: true

      json = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(json['errors'][0]).to eq("lens out of stock. Current stock is: 0")
    end
    it "should should subtract 1 from lens and frame after glass is created" do
      lens = FactoryBot.create(:lens)
      frame = FactoryBot.create(:frame)

      post '/api/v1/glasses', params: {
        glass: {
          frame: frame.id,
          lens: lens.id
        }
      }, headers: { 'Authorization' => user_token }, xhr: true

      updated_lens = Lens.find_by_id(lens.id)
      expect(updated_lens.stock).to eq(0)

    end

  end


end
