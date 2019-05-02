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

ItemTransaction.destroy_all
Game.destroy_all
User.destroy_all

puts 'Creating Tim...'

User.new(first_name: 'Tim',
  last_name: 'Waldron',
  email: 'tim@waldron.im',
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
  admin: true).save

puts 'Creating David...'

User.new(first_name: 'David',
  last_name: 'Bui',
  email: 'davidb9@a.a',
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
  admin: false).save

puts 'Generating random users...'

20.times do
  street_address = Faker::Address.street_address
  #=> "282 Kevin Brook"

  user_alias = Faker::JapaneseMedia::SwordArtOnline.game_name + rand(1..9999).to_s

  params = {
    first_name: Faker::Name.unique.first_name,
    last_name:  Faker::Name.unique.last_name,
    email: "#{user_alias.downcase}@fakeemail.not.real",
    username: user_alias.downcase,
    :password => '123123',
    :password_confirmation => '123123',
    street_number: rand(1..999),
    street_name: Faker::Address.street_name,
    suburb: Faker::Address.city,
    city: Faker::Address.city,
    postcode: rand(1000..9999),
    state: states.sample,
    date_of_birth: Faker::Date.backward(rand(6575..18000)),
    admin: false
  }

  User.new(params).save
  puts "Created user: #{params[:username]} | #{params[:email]}"
end

platforms = ['PlayStation 4', 'Xbox One', 'Nintendo Switch', 'PC']
all_users = User.all

25.times do
  params = {
    title: Faker::Games::LeagueOfLegends.summoner_spell + " " + Faker::Games::LeagueOfLegends.location,
    genre: Faker::Book.genre,
    price: rand(1.00..100.00).round(2),
    platform: platforms.sample,
    condition: rand(0..4),
    sold: false,
    note: Faker::Restaurant.review,
    rating: rand(1..10),
    user_id: all_users.sample.id
  }

  Game.new(params).save
  puts "Created game listing '#{params[:title]}' from user #{User.find(params[:user_id]).username}"
end

# all_games = Game.all
# 

# 10.times do
#   item_params = {
#     item_id: all_games.sample.id,
#     buyer_id: all_users.sample.id,
#     seller_id: all_users.sample.id
#   }

#   item_transaction = ItemTransaction.new(item_params).save
#   puts "Created transaction:"
#   puts "\tGame ID..........: #{item_params[:item_id]}"
#   puts "\tGame Title.......: #{Game.find(item_params[:item_id]).title}"
#   puts "\tBuyer ID.........: #{item_params[:buyer_id]}"
#   puts "\tBuyer Username...: #{User.find(item_params[:buyer_id]).username}"
#   puts "\tSeller ID........: #{item_params[:seller_id]}"
#   puts "\tSeller Username..: #{User.find(item_params[:seller_id]).username}"
#   puts

#   update = Game.find(item_params[:item_id])
#   update.sold = true
#   update.save
# end