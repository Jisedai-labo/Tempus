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

User.create!(email: "xftpt.nonoka@gmail.com", password: "123456", name: "tomoya")

test_user = User.find_by(email: "xftpt.nonoka@gmail.com")
sample_languages = ["Ruby", "Rails", "Python", "JavaScript"]

21.times do |m|
  Post.create!(user_id: test_user.id, studytime: m*60*10, language: sample_languages.sample, kyouzai: kyouzai, content: content)
end

now = Time.now
test_user.posts.each do |post|
  post.created_at = now.ago(rand(1..7).days)
  post.save
end