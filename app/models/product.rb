# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  price       :float
#  description :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
end
