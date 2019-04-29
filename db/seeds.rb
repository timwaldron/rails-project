# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Random users

puts 'Generating test accounts...'

User.destroy_all

params = {
  first_name: 'Tim',
  last_name: 'Waldron',
  email: 'tim@ozgamers.shop',
  username: 'tim',
  :password => '123123',
  :password_confirmation => '123123',
  street_number: '555',
  street_name: 'Fake Street',
  suburb: 'Fakeland',
  city: 'Melbourne',
  postcode: 3000,
  date_of_birth: DateTime.now
}
User.new(params).save
puts 'Created Tim'

params = {
  first_name: 'David',
  last_name: 'Bui',
  email: 'david@ozgamers.shop',
  username: 'david',
  :password => '123123',
  :password_confirmation => '123123',
  street_number: '555',
  street_name: 'Fake Street',
  suburb: 'Fakeland',
  city: 'Melbourne',
  postcode: 3000,
  date_of_birth: DateTime.now
}
User.new(params).save
puts 'Created David'


puts 'Generating random users...'
20.times do

  params = {
    first_name: Faker::Name.unique.first_name,
    last_name:  Faker::Name.unique.last_name,
    email: "#{params[:first_name].downcase}@ozgamers.shop",
    username: params[:first_name],
    :password => '123123',
    :password_confirmation => '123123',
    street_number: '555',
    street_name: 'Fake Street',
    suburb: 'Fakeland',
    city: 'Melbourne',
    postcode: 3000,
    date_of_birth: DateTime.now
  }

  User.new(params).save
  puts "Created user #{params[:email]}"

end