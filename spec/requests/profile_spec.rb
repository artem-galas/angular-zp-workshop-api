require 'rails_helper'

RSpec.describe "Profile", type: :request do
  let!(:user) { create(:user) }

  before :each do
    @auth_header = build_auth_header(user)
  end

  describe 'GET /profile' do
    it 'has 200 status if logged in' do
      get api_profile_path,
        headers: @auth_header

      expect(json['data']['attributes']['email']).to eq user.email
      expect(response).to have_http_status(200)
    end

    it 'has 401 status if not logged' do
      get api_profile_path

      expect(json['errors'][0]['title']).to eq 'Authorize Error'
      expect(response).to have_http_status(401)
    end
  end
end
