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
Option.destroy_all
Price.destroy_all
ServiceCost.destroy_all

quote = Quote.create

category = Category.create!(name: "Hotel")

city = City.create!(name:"Bogota")

vendor = city.vendors.create!({name: "Ibis", category_id: category.id})

service = vendor.services.create!({name: "standard", city_id: city.id})

option = service.options.create(name: "temporada alta")
price = option.prices.create(capacity: 2, value: 4)

option = service.options.create(name: "temporada baja")
price = option.prices.create(capacity: 2, value: 2)

option = service.options.create(name: "temporada alta j-d")
price = option.prices.create(capacity: 2, value: 6)

option = service.options.create(name: "temporada baja j-d")
price = option.prices.create(capacity: 2, value: 3)

service = vendor.services.create!({name: "Gold", city_id: city.id})

option = service.options.create(name: "temporada alta")
price = option.prices.create(capacity: 2, value: 8)

option = service.options.create(name: "temporada baja")
price = option.prices.create(capacity: 2, value: 5)

option = service.options.create(name: "temporada alta j-d")
price = option.prices.create(capacity: 2, value: 10)

option = service.options.create(name: "temporada baja j-d")
price = option.prices.create(capacity: 2, value: 7)

vendor = city.vendors.create!({name: "Marriot", category_id: category.id})

service = vendor.services.create!({name: "silver", city_id: city.id})

option = service.options.create(name: "temporada alta")
price = option.prices.create(capacity: 2, value: 4)

option = service.options.create(name: "temporada baja")
price = option.prices.create(capacity: 2, value: 3)

option = service.options.create(name: "temporada alta j-d")
price = option.prices.create(capacity: 2, value: 5)

option = service.options.create(name: "temporada baja j-d")
price = option.prices.create(capacity: 2, value: 4)
