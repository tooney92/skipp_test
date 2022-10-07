require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "POST /api/v1/users" do

    context 'valid signup' do

      before(:each) do
        post '/api/v1/users', params: {
          email: "demo@gmail.com",
          password: "12345678"
        }, xhr:true
      end

      it 'creates user' do
        expect(response.status).to eq(201)
      end

    end

    context 'invalid signup' do
      before(:each) do
        post '/api/v1/users', params: {
          email: "",
          password: "12345678"
        }, xhr:true
      end

      it 'should not signup user with empty email' do
        expect(response.status).to eq(400)
      end
    end

  end
end
