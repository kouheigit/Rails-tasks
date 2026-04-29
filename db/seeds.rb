# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"
Faker::Config.locale = "ja"

20.times do
  Customer.create!(
    company_name: Faker::Company.name,
    contact_name: Faker::Name.name,
    contact_email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number,
    customer_status: "active",
    memo: Faker::Lorem.sentence
  )
end
