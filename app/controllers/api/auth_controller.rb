module Api
  class AuthController < ApiController

    def sign_in
      user = User.find_by(email: params[:email].to_s.downcase)

      if user && user.authenticate(params[:password])
        auth_token = JsonWebToken.encode({user_id: user.id})
        render json: {auth_token: auth_token}, status: :ok
      else
        render_error(401, 'Invalid Login credentials', 'Invalid Login credentials')
      end
    end
  end
end
