# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Random users

puts 'Generating test accounts...'

states = ['VIC', 'TAS', 'NSW', 'QLD', 'WA', 'NT', 'ACT']

Game.destroy_all
User.destroy_all

params = {
  first_name: 'Tim',
  last_name: 'Waldron',
  email: 'tim@a.a',
  username: 'tim',
  :password => '123123',
  :password_confirmation => '123123',
  street_number: '555',
  street_name: 'Fake Street',
  suburb: 'Fakeland',
  city: 'Melbourne',
  state: states[0],
  postcode: 3000,
  date_of_birth: Faker::Date.backward(rand(6575..18000)),
  admin: true
}
User.new(params).save
puts 'Created Tim'

params = {
  first_name: 'David',
  last_name: 'Bui',
  email: 'david@a.a',
  username: 'david',
  :password => '123123',
  :password_confirmation => '123123',
  street_number: '555',
  street_name: 'Fake Street',
  suburb: 'Fakeland',
  city: 'Melbourne',
  state: states[0],
  postcode: 3000,
  date_of_birth: Faker::Date.backward(rand(6575..18000)),
  admin: false
}
User.new(params).save
puts 'Created David'
puts

puts 'Generating random users...'

20.times do
  street_address = Faker::Address.street_address
  #=> "282 Kevin Brook"

  params = {
    first_name: Faker::Name.unique.first_name,
    last_name:  Faker::Name.unique.last_name,
    email: "#{params[:first_name].downcase}@email.com",
    username: "#{params[:first_name].downcase}#{rand(1000..9999)}",
    :password => '123123',
    :password_confirmation => '123123',
    street_number: rand(1..999),
    street_name: Faker::Address.street_name,
    suburb: Faker::Address.city,
    city: Faker::Address.city,
    postcode: rand(1000..9999),
    state: states.sample,
    date_of_birth: Faker::Date.backward(rand(6575..18000))
    admin: false
  }

  User.new(params).save
  puts "Created user: User ID: #{params[:username]} | #{params[:email]}"
end

platforms = ['PlayStation 4', 'Xbox One', 'Nintendo Switch', 'PC']

25.times do
  params = {
    title: Faker::Games::LeagueOfLegends.summoner_spell + " " + Faker::Games::LeagueOfLegends.location,
    genre: Faker::Book.genre,
    price: rand(1.00..100.00),
    platform: platforms.sample,
    condition: rand(0..4),
    sold: [true, false].sample,
    note: Faker::Restaurant.review,
    rating: rand(1..10),
    user_id: User.all.sample.id
  }

  Game.new(params).save
  puts "Created game listing '#{params[:title]}' from user #{User.find(params[:user_id]).username}"
end