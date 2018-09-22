# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '...adding default Pairs'
  ["AUDUSD", "USDAUD", "AUDEUR", "EURUSD", "USDEUR"].each { |code| Pair.find_or_create_by!(code: code) }

puts '...adding default User'
  User.create!(name: "Rayk", email: "rayk@nelson.com", password: "Test12345", password_confirmation: "Test12345")
