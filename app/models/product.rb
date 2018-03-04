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
  include Swagger::Blocks

  swagger_schema :Product do
    key :required, [:title, :price]
    property :title do
      key :type, :string
    end
    property :price do
      key :type, :number
      key :format, :float
    end
    property :description do
      key :type, :string
    end
    property :image do
      key :type, :string
    end
  end

  swagger_schema :ProductResponse do
    property :data do
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :type do
        key :type, :string
        key :description, 'products'
      end
      property :attributes do
        key :'$ref', :Product
      end
    end
  end

  swagger_schema :ProductRequest do
    property :data do
      property :type do
        key :type, :string
        key :description, 'products'
      end
      property :attributes do
        key :'$ref', :Product
      end
    end
  end

  swagger_schema :ProductsResponse do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
          key :format, :int64
        end
        property :type do
          key :type, :string
          key :description, 'products'
        end
        property :attributes do
          key :'$ref', :Product
        end
      end
    end
    property :meta do
      property :total do
        key :type, :integer
      end
    end
  end

  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
