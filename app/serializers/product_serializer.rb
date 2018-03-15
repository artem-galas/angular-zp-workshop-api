class ProductSerializer < ActiveModel::Serializer
  type 'product'
  attributes :title, :price, :description, :image

  def image
    object.image_url
  end
end
