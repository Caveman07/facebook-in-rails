# require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  email = Faker::Internet.email
  name = Faker::Name.name
  dob = rand(1950..2000)
  user = User.new(email: email,
              password: "070490",
              sex: ['male', 'female'].sample ,
              password_confirmation: "070490",
              name: name,
              dob: dob)
  user.skip_confirmation!
  user.save!
end
  # User.where(id: 108..120).each do |user|
  #   User.find(107).friendships.create!(friend_id: user.id, status: "accepted")
  #   end
