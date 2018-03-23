module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def json_error
      json['errors']
    end
  end
  module Header
    def build_auth_header(user)
      token = ::JsonWebToken.encode({user_id: user.id})
      return {
        'Authorization': token
      }
    end
  end
end