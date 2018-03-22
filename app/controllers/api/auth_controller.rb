module Api
  class AuthController < ApiController
    include Swagger::Blocks

    swagger_path '/auth/sign_in' do
      operation :post do
        key :description, 'Sign In User'
        key :operationId, 'signInUser'
        key :produced, [ 'application/json']
        key :tags, ['auth']
        parameter do
          key :in, :body
          key :name, :body
          key :required, true
          schema do
            key :'$ref', :AuthRequest
          end
        end
        response 200 do
          key :description, 'User Token'
          schema do
            key :'$ref', :JwtResponse
          end
        end
      end
    end

    def sign_in
      user = User.find_by(email: params[:email].to_s.downcase)

      if user && user.authenticate(params[:password])
        auth_token = ::JsonWebToken.encode({user_id: user.id})

        render json: JwtResponse.new(auth_token), status: :ok
      else
        render_error(401, 'Invalid Login credentials', 'Invalid Login credentials')
      end
    end
  end
end
