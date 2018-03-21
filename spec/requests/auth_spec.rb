require 'rails_helper'

RSpec.describe "Auth", type: :request do
  let!(:user) {create(:user)}

  describe 'POST /auth' do
    it 'Success auth user' do
      post api_auth_sign_in_path,
        params: {
          email: 'fake@mail.com',
          password: '123456789'
        }

      p json
      expect(response).to have_http_status(200)
    end
  end
end
