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

User.create!(email: "xftpt.nonoka@gmail.com", password: "123456", name: "tomoya")

test_user = User.find_by(email: "xftpt.nonoka@gmail.com")

Language.create!(language: "HTML/CSS")
Language.create!(language: "JavaScript")
Language.create!(language: "JavaScriptライブラリ")
Language.create!(language: "Ruby/Rails")
Language.create!(language: "Python/Django")
Language.create!(language: "PHP")
Language.create!(language: "Swift/Kotlin/Flutter")
Language.create!(language: "SQL")
Language.create!(language: "C/C++")
Language.create!(language: "Java")
Language.create!(language: "その他")

kyouzai = "Tutorial"
content = "Good"
language = Language.all.pluck(:language)

30.times do |m|
  Post.create!(user_id: m%10+1, studytime: m*60, language: language[0], kyouzai: kyouzai, content: content)
end

21.times do |m|
  Post.create!(user_id: test_user.id, studytime: m*60, language: language[m%4], kyouzai: kyouzai, content: content)
end

now = Time.now
test_user.posts.each do |post|
  post.created_at = now.ago(rand(1..7).days)
  post.save
end