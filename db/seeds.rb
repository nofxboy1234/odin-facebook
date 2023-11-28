# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# puts "\n== Seeding the database manually =="
# User.destroy_all
# User.create!( email: 'manual_user1@example.com', password: '111111' )
# User.create!( email: 'manual_user2@example.com', password: '111111' )
# User.create!( email: 'manual_user3@example.com', password: '111111' )
# puts 'seeding complete!'


puts "\n== Seeding the database with fixtures =="
system("bin/rails db:fixtures:load FIXTURES_PATH=spec/fixtures")
puts 'seeding complete!'


# puts "\n== Seeding the database with FactoryBot (not recommended by ThoughtBot...) =="
# User.destroy_all
# FactoryBot.create_list(:user, 3)
# puts 'seeding complete!'
