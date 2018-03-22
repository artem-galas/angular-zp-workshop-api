module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
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