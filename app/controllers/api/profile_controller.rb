module Api
  class ProfileController < ApiController
    include Swagger::Blocks

    swagger_path '/profile' do
      operation :get do
        key :description, 'Get Profile User'
        key :operationId, 'getProfile'
        key :produced, [ 'application/json']
        key :tags, ['profile']
        response 200 do
          key :description, 'User Profile'
          schema do
            key :'$ref', :UserResponse
          end
        end
      end
    end


    before_action :authenticate_request!

    def show
      render json: @current_user
    end
  end
end
