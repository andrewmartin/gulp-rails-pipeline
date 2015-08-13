require File.expand_path('../helpers.rb', __FILE__)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# puts "Seeding database. Do you want to run 'db:reset' first?"

puts "Creating our base categories."

categories = ["Book", "Music", "Movie", "Food", "Idea", "Clothing", "Product"]
Category.destroy_all
categories.each do |category|
  Category.create!(
    :name => "#{category}"
  )
  puts "Created Category #{category}"
end

puts "^------------------------------------------------------^"
puts "deleting existing Items"
Item.destroy_all

puts "Creating 99 items, all assigned to a random fake category"
99.times do
  category = Category.offset(rand(Category.count))
  first_category = category.first
  second_category = category.last
  name = SeedHelpers.gen_unique_name(Faker::Commerce.product_name)
  i = Item.create!(
    :name => name
  )
  i.item_categories.create!(category_id: first_category.id)
  i.item_categories.create!(category_id: second_category.id)
  puts "Created #{name} in #{first_category.name} and #{second_category.name}."
end