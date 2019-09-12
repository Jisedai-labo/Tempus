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

test_user = User.find_or_create_by(email: "xftpt.nonoka@gmail.com")

languages = ["HTML/CSS", "JavaScript", "JavaScriptライブラリ", "Ruby/Rails", "Python/Django",
              "PHP", "Swift/Kotlin/Flutter", "SQL", "C/C++", "Java", "その他"]

icons = ["fab fa-html5 fa-5x",
          "fab fa-js-square fa-5x",
          "fab fa-vuejs fa-5x",
          "fas fa-gem fa-5x",
          "fab fa-python fa-5x",
          "fab fa-php fa-5x",
          "fas fa-mobile-alt fa-5x",
          "fas fa-database fa-5x",
          "fab fa-cuttlefish fa-5x",
          "fab fa-java fa-5x",
          "fas fa-laptop fa-5x"]

languages.size.times do |i|
  Language.create!(language: languages[i], icon: icons[i])
end

kyouzai = "Tutorial"
content = "Good"
language = Language.all.pluck(:language)

30.times do |m|
  Post.create!(user_id: m%10+1, studytime: m*60, language: languages[0], kyouzai: kyouzai, content: content, icon: icons[0])
end

21.times do |m|
  Post.create!(user_id: test_user.id, studytime: m*60, language: languages[m%10], kyouzai: kyouzai, content: content, icon: icons[m%10])
end

now = Time.now
test_user.posts.each do |post|
  post.created_at = now.ago(rand(1..7).days)
  post.save
end