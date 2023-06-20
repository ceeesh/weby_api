# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
include BCrypt

Client.create!(email: "admin2@test.com" , password: Password.create('password'), 
admin: true, first_name: 'admin', 
last_name: 'admin', gender: 'Others', 
country: 'PH', birthday: 'admin', phone_number: 'admin')

Client.create! do |u|
  u.email = 'admin1@test.com'
  u.first_name = 'admin'
  u.last_name = 'admin'
  u.gender = 'Others'
  u.country = 'PH'
  u.password = 'password'
  u.birthday = 'admin'
  u.phone_number = 'admin'
  u.admin = true
end
