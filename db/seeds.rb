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
  surname: 'webcup',
  password: 'Webcup2023',  # Replace with the desired password,
  phone_number: '011 23 57 64',
  country: "Mauritius",
  admin: true
)

User.create!(
  email: 'user@webcup.com',
  name: 'Alan',
  surname: '- Président Assoc Webcup',
  password: 'Webcup2023',  # Replace with the desired password,
  phone_number: '021 23 47 64',
  country: "La Reunion",
  admin: false
)

sms_message = " SAFEHAVEN ALERT: A (#{[:type_disaster]}), named (#{[:name]}) is approaching near #{[:location]} in 4 hours. Please take precautions, check your SAFEHAVEN account for more information."
whatsapp_message = "🚨 SAFEHAVEN ALERT: A (#{[:type_disaster]}), named (#{[:name]}) is approaching near #{[:location]} in 4 hours. Please take precautions, check your SAFEHAVEN account for more information."
