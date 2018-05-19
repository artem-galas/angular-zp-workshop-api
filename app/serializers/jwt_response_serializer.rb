class JwtResponseSerializer < ActiveModel::Serializer
  type 'auth_token'
  attributes :id, :auth_token
end
