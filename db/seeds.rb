require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do 
    User.create!(
    email: Faker::Internet.email
    string: Faker::Boolean.boolean ? "client":"therapist"
    verified: Faker::Boolean.boolean ? true : false
    anonymized: Faker::Boolean.boolean ? true : false
    )
end

therapist_users = User.all[0...4]
client_users = User.all[5...9]

therapist_users.each do 
    User.create!(
    firstName: Faker::Name.first_name
    lastName: Faker::Name.last_name
    description: Faker::Lorem.paragraphs
    profile_image_url
    therapy_process: Faker::Lorem.paragraphs
    website_url
    phone
    country
    birth_date
    setting_preference
    show_age
    onboarding_step
    )
end

client_users.each do 
    User.create!(
    email: Faker::Internet.email
    string: Faker::Boolean.boolean ? "client":"therapist"
    verified: Faker::Boolean.boolean ? true : false
    anonymized: Faker::Boolean.boolean ? true : false
    )
end
