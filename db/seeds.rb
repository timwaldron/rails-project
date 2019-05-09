# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Random users
puts "Seeding data... Please wait..."
start_time = Time.now


ItemTransaction.destroy_all
Game.destroy_all
User.destroy_all

states = ['VIC', 'TAS', 'NSW', 'QLD', 'WA', 'NT', 'ACT']

puts 'Generating admin accounts...'
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
  state: states.first,
  postcode: 3000,
  admin: true).save

puts 'Creating David...'

User.new(first_name: 'David',
  last_name: 'Bui',
  email: 'davidb9@outlook.com.au',
  username: 'david',
  :password => '123123',
  :password_confirmation => '123123',
  street_number: '555',
  street_name: 'Fake Street',
  suburb: 'Fakeland',
  city: 'Melbourne',
  state: states.first,
  postcode: 3000,
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
    admin: false
  }

  User.new(params).save
  puts "Created user: #{params[:username]} | #{params[:email]}"
end

all_users = User.all

platforms = ['PlayStation 4', 'Xbox One', 'Nintendo Switch', 'PC']
genres = ['Action', 'Adventure', 'Role-Playing', 'Simulation', 'Strategy', 'Sports']

real_titles = [
  # Playstation 4 games
  { title: 'Overwatch', genre: 'Action', platform: 'PlayStation 4', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10)},
  { title: 'Minecraft', genre: 'Simulation', platform: 'PlayStation 4', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Red Dead Redemption 2', genre: 'Role-Playing', platform: 'PlayStation 4', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Crash Team Racing', genre: 'Sports', platform: 'PlayStation 4', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Days Gone', genre: 'Action', platform: 'PlayStation 4', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },

  # Xbox One games
  { title: 'Forza Horizon 3', genre: 'Sports', platform: 'Xbox One', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Battlefield V', genre: 'Action', platform: 'Xbox One', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'NBA 2K19', genre: 'Sports', platform: 'Xbox One', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Grand Theft Auto V', genre: 'Action', platform: 'Xbox One', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Fallout 76', genre: 'Simulation', platform: 'Xbox One', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },

  # PC Games
  { title: 'The Sims 4', genre: 'Simulation', platform: 'PC', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Spellforce 3', genre: 'Strategy', platform: 'PC', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'XCOM 2', genre: 'Action', platform: 'PC', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Dead Rising 4', genre: 'Action', platform: 'PC', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Frost Punk', genre: 'Role-Playing', platform: 'PC', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  
  # Nintendo Switch
  { title: 'Mario Kart 8 Deluxe', genre: 'Sports', platform: 'Nintendo Switch', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Mortal Kombat 11', genre: 'Action', platform: 'Nintendo Switch', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Splatoon 2', genre: 'Action', platform: 'Nintendo Switch', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'My Time at Portia', genre: 'Strategy', platform: 'Nintendo Switch', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
  { title: 'Dragons Dawn of New Riders', genre: 'Action', platform: 'Nintendo Switch', price: rand(15..100), condition: rand(0..4), sold: false, note: '', rating: rand(1..10) },
]

puts "Generating 'real' game listings [#{real_titles.count}]..."

real_titles.shuffle.each do |game_hash|
  new_game = Game.new(game_hash.merge(user_id: all_users.sample.id))
  puts "Generated game: #{new_game.title}"

  sanitized_title = new_game.title.gsub(' ', '_').downcase
  sanitized_platform = new_game.platform.gsub(' ', '_').downcase

  img_path = "#{Rails.root}/app/assets/images/seed_images/#{sanitized_platform}"

  images_to_attach = []

  Dir.glob("#{img_path}/#{sanitized_title}*") do |game_img|
    images_to_attach << game_img
  end

  images_to_attach.each do |img_location|
    new_game.images.attach(io: File.open(img_location), filename: img_location.split('/').last, content_type: 'image/*')
    puts "Attached image to #{new_game.title}: #{img_location.split('/').last}"
  end

  new_game.save

  puts "Created game listing '#{new_game.title}' from user #{User.find(new_game.user_id).username}"
end


end_time = Time.now
puts "Seeding completed in #{(end_time - start_time).round(3)} seconds!"