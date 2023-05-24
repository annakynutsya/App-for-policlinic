# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development? || Rails.env.production?
  AdminUser.create!(phone: '0978337855', password: 'futT%$7658vTYu', password_confirmation: 'futT%$7658vTYu')
end
