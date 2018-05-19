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

FactoryBot.define do
  factory :user do
    email 'fake@mail.com'
    password '123456789'
  end
end
