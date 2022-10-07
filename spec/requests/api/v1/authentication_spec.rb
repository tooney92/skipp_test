require 'rails_helper'

RSpec.describe "Api::V1::Authentications", type: :request do

  let!(:subject) {User.create({ email: 'demo2@gmail.com', password: '12345678' })}

  describe 'POST /api/v1/auth/login' do
    context 'valid login' do
      before(:each) do
        post '/api/v1/auth/login', params: {
          email: subject.email,
          password: '12345678'
        }
      end

      it 'should return return token' do
        puts subject.email
        json = JSON.parse(response.body)
        expect(json).to include("token", "exp", "email")
      end
    end

    context 'invalid login' do
      it 'should not return token' do

        post '/api/v1/auth/login', params: {
          email: 'wrong_user',
          password: '12345678'
        }

        expect(response.status).to eq(401)
      end
    end
  end

end
