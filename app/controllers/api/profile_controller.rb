module Api
  class ProfileController < ApiController
    include Swagger::Blocks
    require 'concerns/documentation/documentation'

    swagger_path '/profile' do
      operation :get do
        key :description, 'Get Profile User'
        key :operationId, 'getProfile'
        key :produced, [ 'application/json']
        key :tags, ['profile']
        extend Documentation::RequestHeaders
        response 200 do
          key :description, 'User Profile'
          schema do
            key :'$ref', :UserResponse
          end
        end
      end
    end
    swagger_path '/profile/avatar' do
      operation :put do
        key :description, 'Update Profile Avatar'
        key :operationId, 'updateProfile'
        key :produced, [ 'application/json']
        key :tags, ['profile']
        extend Documentation::RequestHeaders
        parameter do
          key :in, :formData
          key :name, :avatar
          key :required, true
          key :description, 'Uploaded avatar file'
        end
        response 200 do
          key :description, 'Update Profile'
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

    def update_avatar
      return render_error(400, 'Bad Request', 'Avatar params not passed') if avatar_params.nil?
      return render_error(422, 'Invalid Attributes', "Avatar isn't file") if avatar_params.class != ActionDispatch::Http::UploadedFile
      if @current_user.update(avatar: avatar_params)
        render json: @current_user.reload
      else
        render_error(422, 'Invalid Attributes', 'Invalid Attributes')
      end
    end

    private

    def avatar_params
      params[:avatar]
    end
  end
end
