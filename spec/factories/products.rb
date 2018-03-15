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

FactoryBot.define do
  factory :product do
    title 'Comics 1'
    price 300.00
    description 'This is amazing comics'
    image ''

    before :create do |product|
      # p file_fixture('1.jpg')
      File.open("#{::Rails.root}/spec/fixtures/1.jpg") do |f|
        product.image = f
      end
    end
  end
end
