# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Device.destroy_all
10.times do
  device = Device.new
  device.company = Faker::Company.name
  device.model = Faker::Commerce.product_name
  device.type = 'mobile'
  device.key = Faker::Code.ean
  device.user_id = 2
  device.status = 'Active'

  device.save
end


