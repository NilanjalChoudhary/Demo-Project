# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

AdminUser.create!(email: 'admin123@a.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


# User.create!(email: "sarika@a.com", name: "sarika", age: 32, phone_number: 9765678944, year_of_experience: 32, role: 2, password: "111111")

# User.create(
#     email: "joe@p.com",
#     name: "Joe",
#     age: 32,
#     phone_number: 9765678944,
#     year_of_experience: 32,
#     role: 2,
#     password: "111111",
#     password_confirmation: "111111",
#     confirm_by_admin: true
#   )