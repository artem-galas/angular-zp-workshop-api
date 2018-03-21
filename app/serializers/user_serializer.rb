class UserSerializer < ActiveModel::Serializer
  type 'user'
  attributes :id, :email
end
