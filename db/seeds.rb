# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Faker::Config.locale = 'en'

# 3.times do
#   User.create!(
#     email: Faker::Internet.unique.email,
#     password: 'aa1234',
#     password_confirmation: 'aa1234'
#   )
# end
 
users = User.all

10.times do
  Entry.create!(
    date: Faker::Date.between(from: '2025-08-20', to: '2025-08-30'),
    title: Faker::Lorem.sentence(word_count: 2),
    body: Faker::Lorem.sentence(word_count: 50),
    mood: "happy",
    user_id: users.sample.id,
  )
end