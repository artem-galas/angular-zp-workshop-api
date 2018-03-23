# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  avatar          :string
#

class UserSerializer < ActiveModel::Serializer
  type 'user'
  attributes :id, :email, :avatar

  def avatar
    object.avatar_url
  end
end
