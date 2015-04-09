# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

neighborhoods = ['Cambridge', 'Fenway', 'Allston']

neighborhoods.each do |name|
  Neighborhood.create(name: name)
end

bed_sizes = [
  ['Twin', 0],
  ['Full', 1],
  ['Queen', 2],
  ['King', 3]
]

bed_sizes.each do |name, size_order|
  BedSize.create(name: name, size_order: size_order)
end

room_types = [
  ['Single Room', 0],
  ['Shared Room', 1]
]

room_types.each do |name, size_order|
  RoomType.create(name: name, size_order: size_order)
end

housing_types = [
  ['Studio', 0],
  ['Apartment', 1],
  ['House', 2]
]

housing_types.each do |name, size_order|
  HousingType.create(name: name, size_order: size_order)
end

universities = ['Boston University', 'MIT', 'Harvard', 'Northeastern']

universities.each do |name|
  University.create(name: name)
end