require 'rails_helper'

RSpec.describe "Auth", type: :request do
  let!(:user) {create(:user)}

  describe 'POST /auth' do
    it 'has 200 status if credential right' do
      post api_auth_sign_in_path,
        params: {
          email: 'fake@mail.com',
          password: '123456789'
        }

      expect(json['data']['attributes'].keys).to contain_exactly 'auth_token'
      expect(response).to have_http_status(200)
    end

    it "has 401 status if credential isn't right" do
      post api_auth_sign_in_path,
        params: {
         email: 'fake@mail.com',
         password: 'invalid'
        }

      expect(json['errors'][0]['title']).to eq 'Invalid Login credentials'
      expect(response).to have_http_status(401)
    end
  end
end
