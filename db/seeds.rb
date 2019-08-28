# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  User.create!(email: "test#{n}@test.com", password: "1234567#{n}", name: "テスト#{n}")
end


language = "Rails"
kyouzai = "Tutorial"
content = "Good"

30.times do |m|
  Post.create!(user_id: m%10+1, studytime: m*60, language: language, kyouzai: kyouzai, content: content)
end