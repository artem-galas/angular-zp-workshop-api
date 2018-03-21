require 'rails_helper'

RSpec.describe "Products", type: :request do
  let!(:product) { create_list(:product, 5) }

  describe 'GET /products' do
    it 'has 200 status' do
      get api_products_path

      expect(response).to have_http_status(200)
      expect(json['data'].length).to eq 5
      expect(json['data'][0]['attributes'].keys).to contain_exactly(*%w[title price description image])
    end
  end
end
