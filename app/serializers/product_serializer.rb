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

class ProductSerializer < ActiveModel::Serializer
  type 'product'
  attributes :title, :price, :description, :image

  def image
    object.image_url
  end
end
