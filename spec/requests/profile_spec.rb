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

      expect(json_error[0]['title']).to eq 'Authorize Error'
      expect(response).to have_http_status(401)
    end
  end

  describe 'PUT /profile/avatar' do

    before :each do
      @file = fixture_file_upload(Rails.root.join('spec/fixtures/1.jpg'))
    end

    it 'has 200 status if avatar passed and save' do
      put api_profile_avatar_path,
        params: {
          avatar: @file
        },
        headers: @auth_header

      expect(response).to have_http_status(200)
    end

    it 'has 422 status if avatar isnt a file' do
      put api_profile_avatar_path,
        params: {
          avatar: 'random string'
        },
        headers: @auth_header

      expect(response).to have_http_status(422)
      expect(json_error[0]['title']).to eq 'Invalid Attributes'
    end

    it 'has 400 status if avatar params not passed' do
      put api_profile_avatar_path,
        headers: @auth_header

      expect(response).to have_http_status(400)
      expect(json_error[0]['title']).to eq 'Bad Request'
    end

    it 'has 401 status if not logged' do
      put api_profile_avatar_path

      expect(json_error[0]['title']).to eq 'Authorize Error'
      expect(response).to have_http_status(401)
    end
  end
end
