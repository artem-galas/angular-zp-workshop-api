# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :User do
    key :required, [:email]
    property :email do
      key :type, :string
    end
  end

  swagger_schema :UserResponse do
    property :data do
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :type do
        key :type, :string
        key :description, 'user'
      end
      property :attributes do
        key :'$ref', :User
      end
    end
  end

  swagger_schema :AuthRequest do
    property :data do
      property :type do
        key :type, :string
        key :description, 'user'
      end
      property :attributes do
        property :email do
          key :type, :string
        end
        property :password do
          key :type, :string
        end
      end
    end
  end

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false

  before_save :downcase_email

  private
  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
end
