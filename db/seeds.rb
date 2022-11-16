# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

50.times do
  @restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian japanese french belgian].sample
  )
  # @review.restaurant(
  #   rating: rand(1..5),
  #   content: Faker::Restaurant.review
  # )
end

puts "Finished!"

# t.string "name"
# t.string "address"
# t.string "phone_number"
# t.string "category"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# end

# create_table "reviews", force: :cascade do |t|
# t.integer "rating"
# t.string "content"
# t.integer "restaurant_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
