class JwtResponse
  include Swagger::Blocks

  swagger_schema :JwtResponse do
    property :data do
      property :id do
        key :type, :string
      end
      property :type do
        key :type, :string
        key :description, 'auth_token'
      end
      property :attributes do
        property :auth_token do
          key :type, :string
        end
      end
    end
  end

  include ActiveModel::Serialization
  attr_accessor :auth_token

  def id
    hash
  end

  def initialize(token)
    @auth_token = token
  end
end