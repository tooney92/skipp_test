require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "POST /api/v1/users" do

    context 'valid signup' do

      it 'creates user' do
        post '/api/v1/users', params: {
          email: "demo@gmail.com",
          password: "12345678"
        }, xhr:true

        expect(response.status).to eq(201)
      end

    end

    context 'invalid signup' do

      it 'should not signup user with empty email' do

          post '/api/v1/users', params: {
            email: "",
            password: "12345678"
          }, xhr:true

        expect(response.status).to eq(400)
      end
    end

  end
end
