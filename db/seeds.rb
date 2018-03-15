# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

Product.create(
  [
    {
      title: 'Superman',
      price: 4.99,
      description: 'Lorem Impsum',
      image: File.open("#{::Rails.root}/spec/fixtures/1.jpg")
    },
    {
      title: 'Batman',
      price: 2.99,
      description: 'Lorem Impsum',
      image: File.open("#{::Rails.root}/spec/fixtures/2.jpg")
    },
  ]
)
