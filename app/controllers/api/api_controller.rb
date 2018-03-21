module Api
  class ApiController < ApplicationController

    protected
    def authenticate_request!
      if !payload || !JsonWebToken.valid_payload(payload.first)
        return invalid_authentication
      end

      load_current_user!
      invalid_authentication unless @current_user
    end

    # Returns 401 response. To handle malformed / invalid requests.
    def invalid_authentication
      render_error(401, 'Authorize Error', 'Unauthorized')
    end

    def render_error(status, title, detail)
      render json: {
        errors: [
          format_to_jsonapi_error(status.to_s, title, detail)
        ]
      }, status: status.to_i
    end

    private
    # Deconstructs the Authorization header and decodes the JWT token.
    def payload
      auth_header = request.headers['Authorization']
      token = auth_header.split(' ').last
      JsonWebToken.decode(token)
    rescue
      nil
    end

    # Sets the @current_user with the user_id from payload
    def load_current_user!
      @current_user = User.find_by(id: payload[0]['user_id'])
    end

    def format_to_jsonapi_error(status, title, detail)
      {
        status: status,
        title: title,
        detail: detail
      }
    end
  end
end

