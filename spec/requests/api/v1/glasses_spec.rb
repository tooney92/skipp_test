require 'rails_helper'

RSpec.describe "Api::V1::Glasses", type: :request do
  let!(:demo_user) { FactoryBot.create(:user) }
  let(:user_token) { user_login(demo_user) }

  context 'POST api/v1/glasses' do

    it "should create glasses if frame and lens are in stock" do
      lens = Lens.create({
                           "color": "pink",
                           "description": "demo",
                           "prescription_type": 1,
                           "stock": 1,
                           "price": 100.00,
                           "lens_type": 1
                         })
      frame = Frame.create({
                             "name": "demo_1",
                             "description": "demo demo",
                             "status": 'active',
                             "stock": 1,
                             "price": 100.0
                           })

      post '/api/v1/glasses', params: {
        glass: {
          frame: frame.id,
          lens: lens.id
        }
      }, headers: { 'Authorization' => user_token }, xhr: true

      expect(response.status).to eq(201)

    end

    it "should not create glasses if frame is not in stock" do
      lens = Lens.create({
                           "color": "pink",
                           "description": "demo",
                           "prescription_type": 1,
                           "stock": 1,
                           "price": 100.00,
                           "lens_type": 1
                         })
      frame = Frame.create({
                             "name": "demo_1",
                             "description": "demo demo",
                             "status": 'active',
                             "stock": 0,
                             "price": 100.0
                           })

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
      lens = Lens.create({
                           "color": "pink",
                           "description": "demo",
                           "prescription_type": 1,
                           "stock": 0,
                           "price": 100.00,
                           "lens_type": 1
                         })
      frame = Frame.create({
                             "name": "demo_1",
                             "description": "demo demo",
                             "status": 'active',
                             "stock": 1,
                             "price": 100.0
                           })

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
      lens = Lens.create({
                           "color": "pink",
                           "description": "demo",
                           "prescription_type": 1,
                           "stock": 1,
                           "price": 100.00,
                           "lens_type": 1
                         })
      frame = Frame.create({
                             "name": "demo_1",
                             "description": "demo demo",
                             "status": 'active',
                             "stock": 1,
                             "price": 100.0
                           })

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
