# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying the previous Database"

Review.destroy_all
Disaster.destroy_all
User.destroy_all

puts "Database clean"

puts "creating an admin user"

User.create!(
  email: 'admin@webcup.com',
  name: 'admin',
  password: 'Webcup2023',  # Replace with the desired password
  admin: true
)
