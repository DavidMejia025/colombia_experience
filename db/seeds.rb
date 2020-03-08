# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Client.destroy_all
Quote.destroy_all
City.destroy_all
Vendor.destroy_all
Service.destroy_all
Category.destroy_all
# Option.destroy_all
# Price.destroy_all

quote = Quote.create

category = Category.create!(name: "Hotel")

city = City.create!(name:"Bogota")

vendor = city.vendors.create!({name: "Ibis", category_id: category.id})

service = vendor.services.create!({name: "standard", city_id: city.id})

option = service.options.create(name: "temporada alta")
price = option.prices.create(capacity: 2, value: 200000)

option = service.options.create(name: "temporada baja")
price = option.prices.create(capacity: 2, value: 100000)

option = service.options.create(name: "temporada alta j-d")
price = option.prices.create(capacity: 2, value: 300000)

option = service.options.create(name: "temporada baja j-d")
price = option.prices.create(capacity: 2, value: 150000)
