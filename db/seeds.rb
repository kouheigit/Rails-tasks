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

categories = ["食品", "日用品", "電化製品", "衣類", "その他"]
product_names = [
  "米", "食パン", "牛乳", "卵", "りんご",
  "洗剤", "シャンプー", "歯ブラシ", "ティッシュ", "タオル",
  "イヤホン", "キーボード", "マウス", "電気ケトル", "LEDライト",
  "Tシャツ", "パーカー", "靴下", "ジャケット", "帽子"
]

100.times do |i|
  number = i + 1
  category = categories[i % categories.length]

  Product.find_or_create_by!(code: format("PRD%03d", number)) do |product|
    product.name = "#{product_names[i % product_names.length]} #{number}"
    product.category = category
    product.price = Faker::Number.between(from: 100, to: 50_000)
    product.stock = Faker::Number.between(from: 0, to: 100)
    product.alert_threshold = Faker::Number.between(from: 5, to: 20)
    product.is_active = Faker::Boolean.boolean(true_ratio: 0.85)
    product.description = Faker::Lorem.sentence
  end
end
