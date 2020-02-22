# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Quote.destroy_all
City.destroy_all
Activity.destroy_all
SubActivity.destroy_all
ActivityOption.destroy_all

city = City.create!(name: "Bogota")

activity = city.activities.create!(name:"partido contra santa fe")


sub_activity = activity.sub_activities.create!(name:"Lateral")
#
option_a = sub_activity.activity_options.create!(cost: 20000, capacity: 1)#, sub_activity_id: SubActivity.last,  activity_id: Activity.last)
option_b = sub_activity.activity_options.create!(cost: 40000, capacity: 1)
option_c = sub_activity.activity_options.create!(cost: 70000, capacity: 1)

sub_activity = activity.sub_activities.create!(name:"Oriental")

option_a = sub_activity.activity_options.create!(cost: 20000, capacity: 1)#, sub_activity_id: SubActivity.last,  activity_id: Activity.last)
option_b = sub_activity.activity_options.create!(cost: 40000, capacity: 1)
option_c = sub_activity.activity_options.create!(cost: 70000, capacity: 1)
